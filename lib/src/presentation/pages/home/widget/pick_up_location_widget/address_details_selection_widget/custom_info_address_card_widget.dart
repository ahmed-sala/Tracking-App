import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../../core/utilities/style/app_icons.dart';
import '../../../../../../../core/utilities/style/images/cached_network_image _widget.dart';
import '../../../../../../../core/utilities/style/spacing.dart';

class CustomInfoAddressCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final void Function()? onPhoneClick;
  final void Function()? onWhatsappIcon;
  final Color backgroundColor;

  const CustomInfoAddressCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    this.onPhoneClick,
    this.onWhatsappIcon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x55353535),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: CachedNetworkImageWidget(
                    fit: BoxFit.cover,
                    imageUrl:imageUrl ?? "",
                    width: 44.w,
                    height: 44.w,
                  ),
                ),
                horizontalSpace(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppFonts.font13KGrayWeight400,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(4.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16.w,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          horizontalSpace(4.w),
                          Expanded(
                            child: Text(
                              address,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.font13BlackWeight400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: onPhoneClick,
                child: SvgPicture.asset(
                  AppIcons.phoneIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              horizontalSpace(6.w),
              InkWell(
                onTap: onWhatsappIcon,
                child: SvgPicture.asset(
                  AppIcons.whatsappIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
