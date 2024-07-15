import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper({
    ImagePicker? imagePicker,
    ImageCropper? imageCropper,
  })  : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<List<XFile>> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    if (multiple) {
      return await _imagePicker.pickMultiImage(imageQuality: imageQuality) ??
          [];
    } else {
      final file = await _imagePicker.pickImage(
        source: source,
        imageQuality: imageQuality,
      );
      if (file != null) return [file];
      return [];
    }
  }

  Future<CroppedFile?> crop({
    required XFile file,
    CropStyle cropStyle = CropStyle.rectangle,
  }) async {
    return await _imageCropper.cropImage(
      sourcePath: file.path,
      cropStyle: cropStyle,
      compressQuality: 100,
      uiSettings: [
        IOSUiSettings(
          title: 'Crop Image',
        ),
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepPurple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:mime/mime.dart';

// class ImageHelper {
//   ImageHelper({
//     ImagePicker? imagePicker,
//     ImageCropper? imageCropper,
//   })  : _imagePicker = imagePicker ?? ImagePicker(),
//         _imageCropper = imageCropper ?? ImageCropper();

//   final ImagePicker _imagePicker;
//   final ImageCropper _imageCropper;

//   Future<List<XFile>> pickImage({
//     ImageSource source = ImageSource.gallery,
//     int imageQuality = 100,
//     bool multiple = false,
//   }) async {
//     if (multiple) {
//       return await _imagePicker.pickMultiImage(imageQuality: imageQuality) ?? [];
//     } else {
//       final file = await _imagePicker.pickImage(
//         source: source,
//         imageQuality: imageQuality,
//       );
//       if (file != null) return [file];
//       return [];
//     }
//   }

//   Future<CroppedFile?> crop({
//     required XFile file,
//     CropStyle cropStyle = CropStyle.rectangle,
//   }) async {
//     CroppedFile? croppedFile = await _imageCropper.cropImage(
//       sourcePath: file.path,
//       cropStyle: cropStyle,
//       compressQuality: 100,
//       uiSettings: [
//         IOSUiSettings(
//           title: 'Crop Image',
//         ),
//         AndroidUiSettings(
//           toolbarTitle: 'Crop Image',
//           toolbarColor: Colors.deepPurple,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false,
//         ),
//       ],
//     );

//     // Ensure the cropped file is saved with the correct extension
//     if (croppedFile != null) {
//       String? mimeType = getMimeType(croppedFile.path);
//       String newPath = _updateFileExtension(croppedFile.path, mimeType);
//       File(croppedFile.path).renameSync(newPath);
//       return CroppedFile(newPath);
//     }
//     return croppedFile;
//   }

//   String? getMimeType(String path) {
//     return lookupMimeType(path);
//   }

//   String _updateFileExtension(String path, String? mimeType) {
//     if (mimeType == null) return path;
    
//     String newExtension;
//     if (mimeType == 'image/jpeg') {
//       newExtension = '.jpg';
//     } else if (mimeType == 'image/png') {
//       newExtension = '.png';
//     } else if (mimeType == 'image/gif') {
//       newExtension = '.gif';
//     } else {
//       newExtension = '.jpg'; // Default to JPG if unknown
//     }

//     String newPath = path.replaceAll(RegExp(r'\.\w+$'), newExtension);
//     return newPath;
//   }

//   Future<void> exampleUsage() async {
//     // Pick an image
//     List<XFile> pickedFiles = await pickImage(
//       source: ImageSource.gallery,
//       multiple: false,
//     );

//     if (pickedFiles.isNotEmpty) {
//       XFile pickedFile = pickedFiles.first;

//       // Get the MIME type of the picked file
//       String? pickedFileMimeType = getMimeType(pickedFile.path);
//       print('Picked file MIME type: $pickedFileMimeType');

//       // Crop the image
//       CroppedFile? croppedFile = await crop(file: pickedFile);

//       if (croppedFile != null) {
//         // Get the MIME type of the cropped file
//         String? croppedFileMimeType = getMimeType(croppedFile.path);
//         print('Cropped file MIME type: $croppedFileMimeType');
//       }
//     }
//   }
// }

