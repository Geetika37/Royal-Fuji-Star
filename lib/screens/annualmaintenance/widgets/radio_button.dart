import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    super.key,
  });

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

List<String> options = ['Comprehensive', 'Non-Comprehensive'];

class _RadioButtonState extends State<RadioButton> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Radio(
                activeColor: Appcolor.buttonColor,
                value: options[0],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
              Text(
                'Comprehensive',
                style: poppins(Appcolor.black, 12, FontWeight.w500),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Radio(
                activeColor: Appcolor.buttonColor,
                value: options[1],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
              Text(
                'Non-Comprehensive',
                style: poppins(Appcolor.black, 12, FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
