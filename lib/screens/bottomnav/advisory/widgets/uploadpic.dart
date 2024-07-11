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
  final Function(List<File>) onImageSelected;

  @override
  State<UploadPicBoxRectangle> createState() => UploadPicBoxRectangleState();
}

class UploadPicBoxRectangleState extends State<UploadPicBoxRectangle> {
  final List<File> _images = [];
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
        _images.addAll(croppedImages);
        // print('Selected images: $_images');
      });
      widget.onImageSelected(_images);
    }
  }

  bool isImageSelected() {
    return _images.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.15,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 227, 228, 229),
            borderRadius: BorderRadius.circular(0),
          ),
          child: isImageSelected()
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _images.map((image) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          image,
                          width: widget.deviceWidth * 0.15,
                          height: widget.deviceWidth * 0.15,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),

// children: _images.asMap().entries.map((entry) {
//                       int index = entry.key;
//                       File image = entry.value;

//                       return Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.file(
//                               image,
//                               width: widget.deviceWidth * 0.15,
//                               height: widget.deviceWidth * 0.15,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Positioned(
//                             // top: 5,
//                             right: 0,
//                             child: IconButton(
//                               icon: Icon(Icons.close),
//                               onPressed: () {
//                                 setState(() {
//                                   _images.removeAt(index);
//                                 });
//                                 widget.onImageSelected(_images);
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
                  ),
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
        isImageSelected()
            ? Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: _pickAndCropImage,
                  icon: const Icon(
                    Icons.upload,
                    color: Appcolor.buttonColor,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
