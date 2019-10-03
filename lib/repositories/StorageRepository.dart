import 'dart:io';

import 'package:blabla/providers/StorageProvider.dart';
import 'package:blabla/repositories/BaseRepository.dart';

class StorageRepository extends BaseRepository{
  StorageProvider storageProvider = StorageProvider();
  Future<String> uploadFile(File file, String path) => storageProvider.uploadFile(file, path);

  @override
  void dispose() {
storageProvider.dispose();
  }
}