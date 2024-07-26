// import 'package:flutter/widgets.dart';
// import 'package:royal_fuji_star/utils/appcolor.dart';

// class RichtextHistory extends StatelessWidget {
//   const RichtextHistory({
//     super.key,
//     required this.mainTitle,
//     required this.text,
//   });
//   final String mainTitle;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: mainTitle,
//             style: const TextStyle(
//               fontSize: 13,
//               color: Appcolor.black,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           TextSpan(
//             text: text,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Appcolor.black,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w500,
//               overflow: TextOverflow.ellipsis,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/widgets.dart';
import 'package:royal_fuji_star/utils/appcolor.dart';

class RichtextHistory extends StatelessWidget {
  const RichtextHistory({
    super.key,
    required this.mainTitle,
    required this.text,
    this.overflow = TextOverflow.visible,
    this.maxLines,
  });
  final String mainTitle;
  final String text;
  final TextOverflow overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainTitle,
          style: const TextStyle(
            fontSize: 13,
            color: Appcolor.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              text,
              overflow: overflow,
              maxLines: maxLines,
              style: const TextStyle(
                fontSize: 12,
                color: Appcolor.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
