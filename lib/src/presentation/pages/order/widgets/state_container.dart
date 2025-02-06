import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';

class StateContainer extends StatelessWidget {
  const StateContainer(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});
  final String title;
  final String value;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.h,
        width: 155.w,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFF9ECF0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            verticalSpace(8),
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 24.w,
                  height: 24.h,
                ),
                horizontalSpace(4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0C1015),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
