import 'dart:convert';
import 'package:docflow/core/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/document_metadata.dart';

class MetadataStorageService {
  final SharedPreferences _prefs;
  static const _documentsKey = 'documents_metadata';

  MetadataStorageService(this._prefs);

  Future<void> saveMetadata(DocumentMetadata metadata) async {
    try {
      final documents = await getAllMetadata();
      documents.add(metadata);

      final jsonList = documents.map((doc) => doc.toJson()).toList();
      await _prefs.setString(_documentsKey, jsonEncode(jsonList));
    } catch (e) {
      throw Exception('${AppStrings.errorSavingMetadata}: $e');
    }
  }

  Future<List<DocumentMetadata>> getAllMetadata() async {
    try {
      final jsonString = _prefs.getString(_documentsKey);
      if (jsonString == null) return [];

      final jsonList = jsonDecode(jsonString) as List;
      return jsonList.map((json) => DocumentMetadata.fromJson(json)).toList();
    } catch (e) {
      throw Exception('${AppStrings.errorGettingMetadata}: $e');
    }
  }

  Future<void> deleteMetadata(String id) async {
    try {
      final documents = await getAllMetadata();
      documents.removeWhere((doc) => doc.id == id);

      final jsonList = documents.map((doc) => doc.toJson()).toList();
      await _prefs.setString(_documentsKey, jsonEncode(jsonList));
    } catch (e) {
      throw Exception('${AppStrings.errorDeletingMetadata}: $e');
    }
  }
}
