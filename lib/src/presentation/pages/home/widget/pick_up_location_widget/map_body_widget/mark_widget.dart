import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/utilities/style/app_fonts.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';

import '../../../../../../../core/common/common_imports.dart';

class MarkWidget extends StatelessWidget {
  final  String text;
  final String image;
  const MarkWidget({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return   Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
          color: const Color(0xFFD21E6A), borderRadius: BorderRadius.circular(50)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          horizontalSpace(5),
          Text(
            text,
            style:
            AppFonts.font10KWightWeight400Font
          )
        ],
      ),
    );
  }
}
