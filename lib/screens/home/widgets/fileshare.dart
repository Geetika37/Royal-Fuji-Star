import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:royal_fuji_star/services/api_baseurl.dart';
import 'package:share_plus/share_plus.dart';

void shareFile(dynamic brochure) async {
  final brochureLink = '${APIConstants.baseUrl}$brochure';
  // print('brochureLink is #####---------$brochureLink');

  try {
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/brochure.pdf';

    final response = await http.get(Uri.parse(brochureLink));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    await Share.shareXFiles([XFile(filePath)]);
    print('Thank you for sharing the File!');
  } catch (e) {
    print('Error sharing file: $e');
  }
}
