import 'package:flutter_svg/svg.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_icons.dart';
import '../../../../../../core/utilities/style/spacing.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.address,
      required this.onCall,
      required this.onWhatsApp});
  final String? name;
  final String address;
  final String? image;
  final void Function()? onCall;
  final void Function()? onWhatsApp;

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
            backgroundImage: NetworkImage(image!),
          ),
          horizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns text left
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF535353),
                  ),
                ),
                verticalSpace(2), // Reduces extra space

                Row(
                  children: [
                    Stack(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        const Positioned(
                          left: 1,
                          top: 1,
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    horizontalSpace(4),
                    Flexible(
                      child: Text(
                        address,
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
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: onCall,
                child: SvgPicture.asset(
                  AppIcons.phoneIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              horizontalSpace(6),
              InkWell(
                onTap: onWhatsApp,
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
