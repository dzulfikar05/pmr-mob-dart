import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class FileService {
  static Future<String> _path() async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/data.json";
  }

  static Future<void> saveData(Map<String, dynamic> data) async {
    final file = File(await _path());
    await file.writeAsString(jsonEncode(data));
  }

  static Future<Map<String, dynamic>> readData() async {
    final file = File(await _path());
    if (!await file.exists()) return {};
    return jsonDecode(await file.readAsString());
  }
}
