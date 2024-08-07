import 'package:flutter/material.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

// textformfield with validation
class Textformfield extends StatelessWidget {
  const Textformfield({
    super.key,
    required this.textfieldWidth,
    required this.hintText,
    required this.hintTextSize,
    required this.controller,
    required this.validator,
  });
  final double textfieldWidth;
  final String hintText;
  final double hintTextSize;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: textfieldWidth,
        // height: screenHeight * 0.06,
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: poppins(const Color.fromARGB(255, 149, 147, 147),
                hintTextSize, FontWeight.w300),
            filled: true,
            fillColor: const Color.fromARGB(255, 227, 228, 229),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

// Textformfield Without  Validation

class TextformfieldWithoutValidation extends StatelessWidget {
  const TextformfieldWithoutValidation({
    super.key,
    required this.textfieldWidth,
    required this.hintText,
    required this.hintTextSize,
    required this.controller,
  });
  final double textfieldWidth;
  final String hintText;
  final double hintTextSize;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: textfieldWidth,
        // height: screenHeight * 0.06,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: poppins(const Color.fromARGB(255, 149, 147, 147),
                hintTextSize, FontWeight.w300),
            filled: true,
            fillColor: const Color.fromARGB(255, 227, 228, 229),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

// Textformfield for password

class TextformfieldPass extends StatefulWidget {
  const TextformfieldPass({
    super.key,
    required this.textfieldWidth,
    required this.hintText,
    required this.hintTextSize,
    required this.controller,
    this.obscureText = false,
    this.validator, // Default value is false
  });

  final double textfieldWidth;
  final String hintText;
  final double hintTextSize;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<TextformfieldPass> createState() => _TextformfieldPassState();
}

class _TextformfieldPassState extends State<TextformfieldPass> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.textfieldWidth,
        // height: screenHeight * 0.06,
        child: TextFormField(
          validator: widget.validator,
          obscureText: _obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color.fromARGB(255, 149, 147, 147),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            hintText: widget.hintText,
            hintStyle: poppins(const Color.fromARGB(255, 149, 147, 147),
                widget.hintTextSize, FontWeight.w300),
            filled: true,
            fillColor: const Color.fromARGB(255, 227, 228, 229),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

// Textformfield With icons

class TextformfieldWithIcons extends StatelessWidget {
  const TextformfieldWithIcons({
    super.key,
    required this.textfieldWidth,
    required this.hintText,
    required this.suffixIcon,
    required this.controller,
  });
  final double textfieldWidth;
  final String hintText;
  final Widget suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: textfieldWidth,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: poppins(
                const Color.fromARGB(255, 149, 147, 147), 15, FontWeight.w400),
            filled: true,
            fillColor: Appcolor.bgColorTextformfield,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

// Textformfield With mutliple line

class TextfieldMultipleLine extends StatelessWidget {
  const TextfieldMultipleLine(
      {super.key,
      required this.hintText,
      required this.hintTextSize,
      required this.controller,
      required this.validator});
  final String hintText;
  final double hintTextSize;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: poppins(const Color.fromARGB(255, 149, 147, 147),
            hintTextSize, FontWeight.w300),
        filled: true,
        fillColor: const Color.fromARGB(255, 227, 228, 229),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide.none,
        ),
      ),
      maxLines: 3,
    );
  }
}
