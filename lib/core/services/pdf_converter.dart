import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:docflow/core/constants/strings.dart';

class PDFConverterService {
  final String baseUrl = AppStrings.baseUrl;

  Future<File> convertToPDF(File file) async {
    try {
      final uri = Uri.parse(baseUrl);
      final request = http.MultipartRequest(AppStrings.httpPost, uri);

      request.files.add(
        await http.MultipartFile.fromPath(AppStrings.kitParam, file.path),
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        final bytes = await response.stream.toBytes();
        final tempDir = await Directory.systemTemp.createTemp();
        final outputFile =
            File('${tempDir.path}/${AppStrings.convertedPdfName}');
        await outputFile.writeAsBytes(bytes);
        return outputFile;
      }

      throw Exception(AppStrings.conversionError);
    } catch (e) {
      throw Exception('${AppStrings.conversionErrorWithDetails}$e');
    }
  }
}
