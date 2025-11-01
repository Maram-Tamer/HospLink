import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medigo/core/extentions/show_dialoges.dart';

Future<String?> uploadFileToCloudinary(
  File imageFile,
  String cloudName,
  String uploadPreset,
  BuildContext context,
) async {
  // 1. Create the upload URL
  final url = Uri.parse(
    'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
  );

  // 2. Create a new multipart request
  final request = http.MultipartRequest('POST', url);

  // 3. Add the upload preset
  request.fields['upload_preset'] = uploadPreset;

  // 4. Add the file to the request
  request.files.add(
    await http.MultipartFile.fromPath(
      'file', // This 'file' key is required by Cloudinary
      imageFile.path,
    ),
  );

  try {
    // 5. Send the request
    final response = await request.send();

    if (response.statusCode == 200) {
      // 6. Read and decode the response
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);

      // 7. Return the secure URL
      log('responseData: $responseData');
      return responseData['secure_url'];
    } else {
      showMyDialog(context, 'حدث خطا اثناء رفع الصورة ');
      return null;
    }
  } catch (e) {
    showMyDialog(context, 'حدث خطا اثناء رفع الصورة ');
    return null;
  }
}
