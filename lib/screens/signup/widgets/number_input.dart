import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royal_fuji_star/constants/size.dart';

class NumberInput extends StatelessWidget {
  const NumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController countryCodeController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              height: screenHeight * 0.065,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  CountryCodePicker(
                    flagDecoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(152, 151, 151, 1),
                    ),
                    onChanged: (countryCode) {
                      countryCodeController.text = countryCode.dialCode ?? '';
                    },
                    initialSelection: 'GB',
                    favorite: const ['+44', 'GB'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    countryFilter: const ['GB', 'IN'],
                    onInit: (countryCode) {
                      countryCodeController.text = countryCode?.dialCode ?? '';
                    },
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: TextFormField(
                      maxLength: 10,
                      cursorColor: const Color.fromRGBO(152, 151, 151, 1),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a mobile number';
                        }
                        if (value.length != 10) {
                          return 'Mobile number must be 10 digits';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(152, 151, 151, 1)),
                      controller: phoneController,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                        counterText: '',
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintText: "Enter your number",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(152, 151, 151, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
