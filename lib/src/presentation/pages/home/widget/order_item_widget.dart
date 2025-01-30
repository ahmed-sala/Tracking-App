import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/spacing.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget(
      {super.key,
      required this.orderPrice,
      required this.orderTitle,
      required this.orderImage,
      required this.orderQuantity});

  final String orderPrice;
  final String orderTitle;
  final String orderImage;
  final int orderQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Light shadow color
            blurRadius: 10, // Makes the shadow softer
            spreadRadius: 2, // Controls how far the shadow spreads
            offset: const Offset(2, 4), // Moves the shadow slightly
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 22,
              backgroundColor: Colors.purple[100],
              backgroundImage: NetworkImage(orderImage)
              // Fallback image
              ),
          horizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns text left
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  orderTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF535353),
                  ),
                ),
                verticalSpace(2), // Reduces extra space

                Flexible(
                  child: Text(
                    orderPrice,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: const Color(0xFF0C1015),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'x$orderQuantity',
            style: TextStyle(
              color: const Color(0xFF0C1015),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
