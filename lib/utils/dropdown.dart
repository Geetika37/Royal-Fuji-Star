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

class DropdownCapacity extends StatefulWidget {
  const DropdownCapacity({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  @override
  State<DropdownCapacity> createState() => _DropdownCapacityState();
}

class _DropdownCapacityState extends State<DropdownCapacity> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = 'select'.tr;
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
            elevation: 40,
            dropdownColor: const Color.fromARGB(255, 227, 228, 229),
            validator: (value) {
              if (value == null || value == 'select'.tr) {
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
                widget.onValueChanged(dropdownValue);
              });
            },
            items: [
              'select'.tr,
              ' 300KG',
              '450KG',
              '630KG',
              '800KG',
              '1000KG',
              'MORE THAN 1000KG'
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
        ],
      ),
    );
  }
}

class DropdownConsultation extends StatefulWidget {
  const DropdownConsultation({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  @override
  State<DropdownConsultation> createState() => _DropdownConsultationState();
}

class _DropdownConsultationState extends State<DropdownConsultation> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = 'select'.tr;
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
            elevation: 40,
            dropdownColor: const Color.fromARGB(255, 227, 228, 229),
            validator: (value) {
              if (value == null || value == 'select'.tr) {
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
                widget.onValueChanged(dropdownValue);
              });
            },
            items: [
              'select'.tr,
              'PLAN TO CONSTRUCT A NEW VILLA ',
              'LOOKING FOR A SUITABLE ELEVATOR FOR YOUR HOME',
              'LOOKING FOR ELEVATOR DETAILS AS PER YOUR AVAILBILE AREA SPECIFICATION ',
              'NEED TO MAKE INSPECTION FOR INSTALLED LIFT ',
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
        ],
      ),
    );
  }
}

class DropdownNumFloor extends StatefulWidget {
  const DropdownNumFloor({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  @override
  State<DropdownNumFloor> createState() => _DropdownNumFloorState();
}

class _DropdownNumFloorState extends State<DropdownNumFloor> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = 'select'.tr;
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
            dropdownColor: const Color.fromARGB(255, 227, 228, 229),
            validator: (value) {
              if (value == null || value == 'select'.tr) {
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
                widget.onValueChanged(dropdownValue);
              });
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
        ],
      ),
    );
  }
}

class DropdownRepair extends StatefulWidget {
  const DropdownRepair({
    super.key,
    required this.title,
    this.textValue = "",
    this.margin = 0,
    required this.onValueChanged,
  });

  final String title, textValue;
  final double margin;
  final ValueChanged<String> onValueChanged;

  @override
  State<DropdownRepair> createState() => _DropdownRepairState();
}

class _DropdownRepairState extends State<DropdownRepair> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = 'select'.tr;
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
            dropdownColor: const Color.fromARGB(255, 227, 228, 229),
            validator: (value) {
              if (value == null || value == 'select'.tr) {
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
                widget.onValueChanged(dropdownValue);
              });
            },
            items: [
              'select'.tr,
              'One Time Repair',
              'Major Repair',
              'Replacement of Controllers and others',
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
        ],
      ),
    );
  }
}
