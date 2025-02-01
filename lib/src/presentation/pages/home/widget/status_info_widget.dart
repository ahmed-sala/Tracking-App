import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';

class StatusInfoWidget extends StatelessWidget {
  const StatusInfoWidget({
    super.key,
    required this.status,
    required this.orderId,
    required this.createdAt,
  });
  final String? status;
  final String orderId;
  final String createdAt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF9ECF0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Status : $status",
            style: TextStyle(
              color: Colors.green,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(8),
          Text(
            "Order ID : # $orderId",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(8),
          Text(
            createdAt,
            style: TextStyle(
              color: Color(0xFF535353),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
