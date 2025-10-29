import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  // Pastikan binding Flutter telah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  runApp(
    MaterialApp(
      title: 'Material Camera App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: CameraScreen(
        cameras: cameras,
      ),
    ),
  );
}

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({
    super.key,
    required this.cameras,
  });

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int _selectedCameraIndex = 0;

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
      ResolutionPreset.high,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();

    // Refresh UI jika controller diinisialisasi ulang
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Wajib dispose controller saat widget tidak lagi digunakan
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

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Foto disimpan di: $savedPath'),
        ),
      );
    } catch (e) {
      print("Error mengambil gambar: $e");
    }
  }

  void _onSwitchCameraPressed() {
    if (widget.cameras.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hanya satu kamera tersedia.'),
        ),
      );
      return;
    }

    _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
    
    // Dispose controller lama dan inisialisasi yang baru
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
            // Tampilkan preview kamera di tengah
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CameraPreview(_controller),
              ),
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