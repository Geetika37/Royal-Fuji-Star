import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';

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
            // backgroundColor: Colors.green,
            // boxDecoration: const BoxDecoration(
            //   color: Appcolor.buttonColor,
            // ),
            // flagDecoration: const BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(5)),
            // ),
            textStyle: poppins(
                const Color.fromARGB(255, 149, 147, 147), 15, FontWeight.w300),
            onChanged: (countryCode) {
              countryCodeController.text = countryCode.dialCode ?? '';
            },

            initialSelection: 'GB',
            favorite: const ['+44', 'GB'],
            showCountryOnly: false,
            // showOnlyCountryWhenClosed: false,
            alignLeft: false,
            // countryFilter: const ['GB', 'IN'],
            onInit: (countryCode) {
              countryCodeController.text = countryCode?.dialCode ?? '';
            },
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: TextFormField(
              maxLength: 10,
              // cursorColor: const Color.fromRGBO(152, 151, 151, 1),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(10),
              ],

              style: poppins(const Color.fromARGB(255, 149, 147, 147), 15,
                  FontWeight.w300),
              controller: phoneController,
              decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 227, 228, 229),
                  filled: true,
                  counterText: '',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: "Enter your number",
                  border: InputBorder.none,
                  hintStyle: poppins(const Color.fromARGB(255, 149, 147, 147),
                      15, FontWeight.w300)),
            ),
          ),
        ],
      ),
    );
  }
}
