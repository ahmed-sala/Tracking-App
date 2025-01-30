import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';

class StatusRowWidget extends StatelessWidget {
  const StatusRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
