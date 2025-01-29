import 'package:shimmer/shimmer.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';

import '../../../../core/common/common_imports.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Shimmer.fromColors(
        baseColor: AppColors.baseShimmer,
        highlightColor: AppColors.highlightShimmer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Placeholder
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.kGray,
              ),
            ),
            verticalSpace(24),
            // First Name & Last Name Fields
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.h,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50.h,
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(24),
            // Email Field
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            verticalSpace(24),
            // Phone Number Field
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            verticalSpace(24),
            // Password Field
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            verticalSpace(24),
            // Gender Options
            Row(
              children: [
                Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                horizontalSpace(16),
                Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            verticalSpace(40),
            // Update Button
            Center(
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
