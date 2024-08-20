import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class NumberInput extends StatelessWidget {
  const NumberInput(
      {super.key,
      required this.countryCodeController,
      required this.phoneController});
  final TextEditingController countryCodeController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.8,
      color: const Color.fromARGB(255, 227, 228, 229),
      child: Row(
        children: [
          CountryCodePicker(
            textStyle: poppins(
                const Color.fromARGB(255, 149, 147, 147), 15, FontWeight.w300),
            onChanged: (countryCode) {
              countryCodeController.text = countryCode.dialCode ?? '';
            },
            initialSelection: 'AE',
            favorite: const [
              '+971',
              'AE',
              '+966',
              'SA',
              '+965',
              'KW',
              '+973',
              'BH',
              '+974',
              'QA',
              '+968',
              'OM'
            ],
            showCountryOnly: false,
            alignLeft: false,
            onInit: (countryCode) {
              countryCodeController.text = countryCode?.dialCode ?? '+971';
            },
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: TextFormField(
              // maxLength: 10,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-15]')),
                LengthLimitingTextInputFormatter(15),
              ],
              style: poppins(Appcolor.black, 15, FontWeight.w300),
              controller: phoneController,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 227, 228, 229),
                filled: true,
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: "hintphone".tr,
                border: InputBorder.none,
                hintStyle: poppins(
                  const Color.fromARGB(255, 149, 147, 147),
                  15,
                  FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
