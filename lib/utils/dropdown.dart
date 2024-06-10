import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.textValue = "",
    this.margin = 0,
  });

  final String title, hint, textValue;
  final double margin;
  final IconData icon;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = 'Select';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Stack(children: [
        DropdownButtonFormField<String>(
          validator: (value) {
            if (value == null || value == 'Select') {
              return 'Please select a valid option';
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: Appcolor.buttonColor),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: Appcolor.buttonColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: Appcolor.buttonColor),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: Appcolor.buttonColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: Appcolor.buttonColor),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.only(
              top: 30,
              left: 10,
            ),
          ),
          isExpanded: true,
          value: dropdownValue,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
          ),
          iconSize: 24,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.5),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Select', 'Male', 'Female']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: value == 'Select'
                    ? poppins(Colors.black12, 14, FontWeight.w400)
                    : poppins(
                        Appcolor.bgColorTextformfield, 14, FontWeight.w400),
              ),
            );
          }).toList(),
        ),
        Positioned(
          top: 2,
          left: 10,
          child: Text(
            widget.title,
            style: const TextStyle(color: Appcolor.buttonColor, fontSize: 10),
          ),
        )
      ]),
    );
  }
}
