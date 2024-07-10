import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';
import 'package:royal_fuji_star/utils/image_helper.dart';

class UploadPicBoxRectangle extends StatefulWidget {
  const UploadPicBoxRectangle({
    super.key,
    required this.deviceWidth,
    required this.onImageSelected,
  });

  final double deviceWidth;
  final VoidCallback onImageSelected;
  @override
  State<UploadPicBoxRectangle> createState() => UploadPicBoxRectangleState();
}

class UploadPicBoxRectangleState extends State<UploadPicBoxRectangle> {
  List<File> _images = [];
  final ImageHelper _imageHelper = ImageHelper();

  Future<void> _pickAndCropImage() async {
    // Pick multiple images
    List<XFile> pickedFiles = await _imageHelper.pickImage(multiple: true);
    if (pickedFiles.isNotEmpty) {
      List<File> croppedImages = [];

      for (XFile pickedFile in pickedFiles) {
        // Crop the image
        CroppedFile? croppedFile = await _imageHelper.crop(file: pickedFile);

        // Add the cropped image to the list
        if (croppedFile != null) {
          croppedImages.add(File(croppedFile.path));
        }
      }

      setState(() {
        _images = croppedImages;
      });
      widget.onImageSelected();
    }
  }

  bool isImageSelected() {
    return _images.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 227, 228, 229),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: isImageSelected()
            ? Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _images.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      image,
                      width: widget.deviceWidth * 0.3,
                      height: widget.deviceWidth * 0.3,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              )
            : GestureDetector(
                onTap: _pickAndCropImage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/upload.svg'),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      'Drop items here',
                      style: poppins(Appcolor.black, 10, FontWeight.w300),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}



// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:royal_fuji_star/constants/size.dart';
// import 'package:royal_fuji_star/constants/textstyle.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';
// import 'package:royal_fuji_star/utils/image_helper.dart';

// class UploadPicBoxRectangle extends StatefulWidget {
//   const UploadPicBoxRectangle({
//     super.key,
//     required this.deviceWidth,
//     required this.onImageSelected,
//   });

//   final double deviceWidth;
//   final VoidCallback onImageSelected;
//   @override
//   State<UploadPicBoxRectangle> createState() => UploadPicBoxRectangleState();
// }

// class UploadPicBoxRectangleState extends State<UploadPicBoxRectangle> {
//   File? _image;
//   final ImageHelper _imageHelper = ImageHelper();

//   Future<void> _pickAndCropImage() async {
//     // Pick an image
//     List<XFile> pickedFiles = await _imageHelper.pickImage(multiple: false);
//     if (pickedFiles.isNotEmpty) {
//       XFile pickedFile = pickedFiles.first;

//       // Crop the image
//       CroppedFile? croppedFile = await _imageHelper.crop(file: pickedFile);

//       // Set the cropped image to the state
//       if (croppedFile != null) {
//         setState(() {
//           _image = File(croppedFile.path);
//         });
//         widget.onImageSelected();
//       }
//     }
//   }

//   bool isImageSelected() {
//     return _image != null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: screenWidth,
//         height: screenHeight * 0.15,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 227, 228, 229),
//             borderRadius: BorderRadius.circular(0)),
//         child: Center(
//           child: _image != null
//               ? ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.file(
//                     _image!,
//                     width: double.infinity,
//                     height: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 )
//               : GestureDetector(
//                   onTap: _pickAndCropImage,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset('assets/svg/upload.svg'),
//                       SizedBox(
//                         height: screenHeight * 0.01,
//                       ),
//                       Text(
//                         'Drop items here',
//                         style: poppins(Appcolor.black, 10, FontWeight.w300),
//                       )
//                     ],
//                   ),
//                 ),
//         ));
//   }
// }
