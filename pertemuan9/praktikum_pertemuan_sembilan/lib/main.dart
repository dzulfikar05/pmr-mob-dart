import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  runApp(MaterialApp(
    title: 'Material Camera App',
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.dark,
    ),
    home: CameraScreen(cameras: cameras),
  ));
}

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int _selectedCameraIndex = 0;
  String? _lastImagePath;

  @override
  void initState() {
    super.initState();
    if (widget.cameras.isEmpty) {
      print("Tidak ada kamera ditemukan!");
      return;
    }
    _initializeCamera(widget.cameras[_selectedCameraIndex]);
  }

  void _initializeCamera(CameraDescription cameraDescription) {
    _controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium, // gunakan resolusi proporsional
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onTakePicturePressed() async {
    try {
      await _initializeControllerFuture;

      final XFile imageFile = await _controller.takePicture();
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = p.basename(imageFile.path);
      final String savedPath = '${appDir.path}/$fileName';
      await imageFile.saveTo(savedPath);

      setState(() {
        _lastImagePath = savedPath;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Foto disimpan di: $savedPath')),
      );
    } catch (e) {
      print("Error mengambil gambar: $e");
    }
  }

  void _onSwitchCameraPressed() {
    if (widget.cameras.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hanya satu kamera tersedia.')),
      );
      return;
    }

    _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
    _controller.dispose();
    _initializeCamera(widget.cameras[_selectedCameraIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Material Camera'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.flip_camera_ios_outlined),
            onPressed: _onSwitchCameraPressed,
            tooltip: 'Ganti Kamera',
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                // 📷 Preview Kamera dengan rasio proporsional
                Expanded(
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.previewSize!.height,
                          height: _controller.value.previewSize!.width,
                          child: CameraPreview(_controller),
                        ),
                      ),
                    ),
                  ),
                ),

                // 🖼️ Jika sudah ada hasil foto, tampilkan
                if (_lastImagePath != null)
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: FileImage(File(_lastImagePath!)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTakePicturePressed,
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
