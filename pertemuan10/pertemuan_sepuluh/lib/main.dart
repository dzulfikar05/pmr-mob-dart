import 'dart:async';
import 'dart:io' show Platform;

import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// Main app color used for cards and buttons.
final MaterialColor themeMaterialColor =
    BaseflowPluginExample.createMaterialColor(const Color.fromRGBO(48, 49, 60, 1));

void main() => runApp(const GeolocatorApp());

class GeolocatorApp extends StatelessWidget {
  const GeolocatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geolocator Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeMaterialColor),
        useMaterial3: true,
      ),
      home: const GeolocatorWidget(),
    );
  }
}

class GeolocatorWidget extends StatefulWidget {
  const GeolocatorWidget({super.key});

  static ExamplePage createPage() =>
      ExamplePage(Icons.location_on, (context) => const GeolocatorWidget());

  @override
  State<GeolocatorWidget> createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<GeolocatorWidget> {
  static const _locationServicesDisabled = 'Location services are disabled.';
  static const _permissionDenied = 'Permission denied.';
  static const _permissionDeniedForever = 'Permission denied forever.';
  static const _permissionGranted = 'Permission granted.';

  final GeolocatorPlatform _geo = GeolocatorPlatform.instance;
  final List<_PositionItem> _items = <_PositionItem>[];

  StreamSubscription<Position>? _positionSub;
  StreamSubscription<ServiceStatus>? _serviceStatusSub;
  bool _positionStreamStarted = false;

  @override
  void initState() {
    super.initState();
    _listenServiceStatus();
  }

  @override
  void dispose() {
    _positionSub?.cancel();
    _serviceStatusSub?.cancel();
    super.dispose();
  }

  PopupMenuButton<int> _createActions() {
    return PopupMenuButton<int>(
      elevation: 40,
      onSelected: (value) async {
        switch (value) {
          case 1:
            await _getLocationAccuracy();
            break;
          case 2:
            await _requestTemporaryFullAccuracy();
            break;
          case 3:
            await _openAppSettings();
            break;
          case 4:
            await _openLocationSettings();
            break;
          case 5:
            setState(() => _items.clear());
            break;
        }
      },
      itemBuilder: (context) => [
        if (Platform.isIOS)
          const PopupMenuItem<int>(value: 1, child: Text('Get Location Accuracy')),
        if (Platform.isIOS)
          const PopupMenuItem<int>(value: 2, child: Text('Request Temporary Full Accuracy')),
        const PopupMenuItem<int>(value: 3, child: Text('Open App Settings')),
        if (Platform.isAndroid || Platform.isWindows)
          const PopupMenuItem<int>(value: 4, child: Text('Open Location Settings')),
        const PopupMenuItem<int>(value: 5, child: Text('Clear')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 10);

    return BaseflowPluginExample(
      pluginName: 'Geolocator',
      githubURL: 'https://github.com/Baseflow/flutter-geolocator',
      pubDevURL: 'https://pub.dev/packages/geolocator',
      appBarActions: [_createActions()],
      pages: [
        ExamplePage(
          Icons.location_on,
          (context) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                if (item.type == _PositionItemType.log) {
                  return ListTile(
                    title: Text(
                      item.displayValue,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return Card(
                  child: ListTile(
                    tileColor: themeMaterialColor,
                    title: Text(item.displayValue, style: const TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
            floatingActionButton: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _positionStreamStarted = !_positionStreamStarted;
                    _toggleListening();
                  },
                  tooltip: (_positionSub == null)
                      ? 'Start position updates'
                      : _positionSub!.isPaused
                          ? 'Resume'
                          : 'Pause',
                  backgroundColor: _determineButtonColor(),
                  child: (_positionSub == null || _positionSub!.isPaused)
                      ? const Icon(Icons.play_arrow)
                      : const Icon(Icons.pause),
                ),
                sizedBox,
                FloatingActionButton(
                  onPressed: _getCurrentPosition,
                  tooltip: 'Get current position',
                  child: const Icon(Icons.my_location),
                ),
                sizedBox,
                FloatingActionButton(
                  onPressed: _getLastKnownPosition,
                  tooltip: 'Get last known position',
                  child: const Icon(Icons.bookmark),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) return;

    try {
      final position = await _geo.getCurrentPosition();
      _addItem(_PositionItemType.position, position.toString());
    } catch (e) {
      _addItem(_PositionItemType.log, 'Error getting current position: $e');
    }
  }

  Future<void> _getLastKnownPosition() async {
    try {
      final position = await _geo.getLastKnownPosition();
      if (position != null) {
        _addItem(_PositionItemType.position, position.toString());
      } else {
        _addItem(_PositionItemType.log, 'No last known position available');
      }
    } catch (e) {
      _addItem(_PositionItemType.log, 'Error getting last known position: $e');
    }
  }

  Future<bool> _handlePermission() async {
    final serviceEnabled = await _geo.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _addItem(_PositionItemType.log, _locationServicesDisabled);
      return false;
    }

    var permission = await _geo.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geo.requestPermission();
      if (permission == LocationPermission.denied) {
        _addItem(_PositionItemType.log, _permissionDenied);
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _addItem(_PositionItemType.log, _permissionDeniedForever);
      return false;
    }

    _addItem(_PositionItemType.log, _permissionGranted);
    return true;
  }

  void _addItem(_PositionItemType type, String value) {
    _items.add(_PositionItem(type, value));
    if (mounted) setState(() {});
  }

  bool _isListening() => !(_positionSub == null || _positionSub!.isPaused);

  Color _determineButtonColor() => _isListening() ? Colors.green : Colors.red;

  void _listenServiceStatus() {
    if (_serviceStatusSub != null) return;

    _serviceStatusSub = _geo.getServiceStatusStream().handleError((_) {
      _serviceStatusSub?.cancel();
      _serviceStatusSub = null;
    }).listen((status) {
      if (status == ServiceStatus.enabled) {
        if (_positionStreamStarted) _toggleListening();
        _addItem(_PositionItemType.log, 'Location service has been enabled');
      } else {
        _positionSub?.cancel();
        _positionSub = null;
        _addItem(_PositionItemType.log, 'Position Stream has been canceled');
        _addItem(_PositionItemType.log, 'Location service has been disabled');
      }
    });
  }

  void _toggleListening() {
    if (_positionSub == null) {
      _positionSub = _geo.getPositionStream().handleError((error) {
        _positionSub?.cancel();
        _positionSub = null;
      }).listen((position) => _addItem(_PositionItemType.position, position.toString()));
      // start paused so user controls resume/pause
      _positionSub?.pause();
    }

    if (!mounted) return;

    setState(() {
      if (_positionSub == null) return;

      final wasPaused = _positionSub!.isPaused;
      if (wasPaused) {
        _positionSub!.resume();
        _addItem(_PositionItemType.log, 'Listening for position updates resumed');
      } else {
        _positionSub!.pause();
        _addItem(_PositionItemType.log, 'Listening for position updates paused');
      }
    });
  }

  Future<void> _getLocationAccuracy() async {
    try {
      final status = await _geo.getLocationAccuracy();
      _handleLocationAccuracyStatus(status);
    } catch (e) {
      _addItem(_PositionItemType.log, 'Error reading location accuracy: $e');
    }
  }

  Future<void> _requestTemporaryFullAccuracy() async {
    try {
      final status = await _geo.requestTemporaryFullAccuracy(purposeKey: 'TemporaryPreciseAccuracy');
      _handleLocationAccuracyStatus(status);
    } catch (e) {
      _addItem(_PositionItemType.log, 'Error requesting temporary full accuracy: $e');
    }
  }

  void _handleLocationAccuracyStatus(LocationAccuracyStatus status) {
    final value = switch (status) {
      LocationAccuracyStatus.precise => 'Precise',
      LocationAccuracyStatus.reduced => 'Reduced',
      _ => 'Unknown',
    };

    _addItem(_PositionItemType.log, '$value location accuracy granted.');
  }

  Future<void> _openAppSettings() async {
    final opened = await _geo.openAppSettings();
    _addItem(_PositionItemType.log, opened ? 'Opened Application Settings.' : 'Error opening Application Settings.');
  }

  Future<void> _openLocationSettings() async {
    final opened = await _geo.openLocationSettings();
    _addItem(_PositionItemType.log, opened ? 'Opened Location Settings' : 'Error opening Location Settings');
  }
}

enum _PositionItemType { log, position }

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}
