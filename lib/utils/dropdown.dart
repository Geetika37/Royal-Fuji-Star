import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_fuji_star/constants/size.dart';
import 'package:royal_fuji_star/constants/textstyle.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
  });

  final String title, textValue;
  final double margin;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: poppins(Appcolor.black, 12, FontWeight.w400),
          ),
          SizedBox(height: screenHeight * 0.01),
          DropdownButtonFormField<String>(
            validator: (value) {
              if (value == null || value == 'Select') {
                return 'Please select a valid option';
              }
              return null;
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 227, 228, 229),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                borderSide: BorderSide.none,
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
                      : poppins(Colors.grey.shade700, 14, FontWeight.w400),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class DropdownCapacity extends StatelessWidget {
  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  DropdownCapacity({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final RxString dropdownValue = 'select'.tr.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppins(Appcolor.black, 12, FontWeight.w400),
          ),
          SizedBox(height: screenHeight * 0.01),
          Obx(
            () => DropdownButtonFormField<String>(
              elevation: 40,
              dropdownColor: const Color.fromARGB(255, 227, 228, 229),
              validator: (value) {
                if (value == null || value == 'select'.tr) {
                  return 'validation16'.tr;
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 227, 228, 229),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide.none,
                ),
              ),
              isExpanded: true,
              value: dropdownValue.value,
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
                if (newValue != null) {
                  dropdownValue.value = newValue;
                  onValueChanged(newValue);
                }
              },
              items: [
                'select'.tr,
                '300KG',
                '450KG',
                '630KG',
                '800KG',
                '1000KG',
                'validation26'.tr,
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: value == 'select'.tr
                        ? poppins(Colors.black12, 14, FontWeight.w400)
                        : poppins(Colors.grey.shade700, 14, FontWeight.w400),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownConsultation extends StatelessWidget {
  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  DropdownConsultation({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final RxString dropdownValue = 'select'.tr.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppins(Appcolor.black, 12, FontWeight.w400),
          ),
          SizedBox(height: screenHeight * 0.01),
          Obx(
            () => DropdownButtonFormField<String>(
              elevation: 40,
              dropdownColor: const Color.fromARGB(255, 227, 228, 229),
              validator: (value) {
                if (value == null || value == 'select'.tr) {
                  return 'validation16'.tr;
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 227, 228, 229),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide.none,
                ),
              ),
              isExpanded: true,
              value: dropdownValue.value,
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
                if (newValue != null) {
                  dropdownValue.value = newValue;
                  onValueChanged(newValue);
                }
              },
              items: [
                'select'.tr,
                'validation22'.tr,
                'validation23'.tr,
                'validation24'.tr,
                'validation25'.tr,
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: value == 'select'.tr
                        ? poppins(Colors.black12, 14, FontWeight.w400)
                        : poppins(Colors.grey.shade700, 14, FontWeight.w400),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownNumFloor extends StatelessWidget {
  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  DropdownNumFloor({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final RxString dropdownValue = 'select'.tr.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppins(Appcolor.black, 12, FontWeight.w400),
          ),
          SizedBox(height: screenHeight * 0.01),
          Obx(
            () => DropdownButtonFormField<String>(
              dropdownColor: const Color.fromARGB(255, 227, 228, 229),
              validator: (value) {
                if (value == null || value == 'select'.tr) {
                  return 'validation16'.tr;
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 227, 228, 229),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide.none,
                ),
              ),
              isExpanded: true,
              value: dropdownValue.value,
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
                if (newValue != null) {
                  dropdownValue.value = newValue;
                  onValueChanged(newValue);
                }
              },
              items: [
                'select'.tr,
                ...List.generate(200, (index) => (index + 1).toString())
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: value == 'select'.tr
                        ? poppins(Colors.black12, 14, FontWeight.w400)
                        : poppins(Colors.grey.shade700, 14, FontWeight.w400),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// class DropdownRepair extends StatefulWidget {

class DropdownRepair extends StatelessWidget {
  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  DropdownRepair({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final RxString dropdownValue = 'select'.tr.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppins(Appcolor.black, 12, FontWeight.w400),
          ),
          SizedBox(height: screenHeight * 0.01),
          Obx(
            () => DropdownButtonFormField<String>(
              dropdownColor: const Color.fromARGB(255, 227, 228, 229),
              validator: (value) {
                if (value == null || value == 'select'.tr) {
                  return 'validation16'.tr;
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 227, 228, 229),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide.none,
                ),
              ),
              isExpanded: true,
              value: dropdownValue.value,
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
                if (newValue != null) {
                  dropdownValue.value = newValue;
                  onValueChanged(newValue);
                }
              },
              items: [
                'select'.tr,
                'validation18'.tr,
                'validation19'.tr,
                'validation20'.tr,
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: value == 'select'.tr
                        ? poppins(Colors.black12, 14, FontWeight.w400)
                        : poppins(Colors.grey.shade700, 14, FontWeight.w400),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
