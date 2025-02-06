import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tracking_app/core/extensions/extensions.dart';
import 'package:tracking_app/core/utilities/style/app_colors.dart';
import 'package:tracking_app/core/utilities/style/app_icons.dart';
import 'package:tracking_app/src/presentation/managers/order/pick_up_location/pick_up_location_cubit.dart';
import 'package:tracking_app/src/presentation/managers/order/pick_up_location/pick_up_location_state.dart';

import '../../../../../../../core/common/common_imports.dart';
import 'mark_widget.dart';

class MapBodyWidget extends StatefulWidget {
  const MapBodyWidget({super.key});

  @override
  State<MapBodyWidget> createState() => _MapBodyWidgetState();
}

class _MapBodyWidgetState extends State<MapBodyWidget> {
  @override
  Widget build(BuildContext context) {
    var pickUpLocationViewModel=context.read<PickUpLocationCubit>();
    return     BlocBuilder<PickUpLocationCubit, PickUpLocationState>(
  builder: (context, state) {
    return Expanded(child: Stack(
      children: [
        FlutterMap(
            options: MapOptions(
              initialZoom: 10,
              maxZoom: 18,
              minZoom: 8,
              initialCenter: LatLng(pickUpLocationViewModel.userLatitude,pickUpLocationViewModel.userLongitude ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(markers: [
                Marker(
                  // height: 80,
                  width: 120,
                  point: LatLng(pickUpLocationViewModel.userLatitude,pickUpLocationViewModel.userLongitude ),
                  child:  MarkWidget(
                    text: context.localizations.yourLocation,
                    image: AppIcons.locationLogoIcon,
                  ),
                ),
                Marker(
                  // height: 80,
                  width: 82,
                  point: LatLng(pickUpLocationViewModel.ecommerceLatitude,pickUpLocationViewModel.ecommerceLongitude ),
                  child:  MarkWidget(
                    text: context.localizations.flowery,
                    image: AppIcons.flowerLogoIcon,
                  ),
                ),
              ]),
              pickUpLocationViewModel.routesPoint.isNotEmpty?
              PolylineLayer(
                  polylines: [
                    Polyline(
                      points: pickUpLocationViewModel.routesPoint, // تأكد من أنها List<LatLng>
                      strokeWidth: 3,
                      color: AppColors.mainColor),

                  ]): const SizedBox.shrink()


            ]
        ),
        InkWell(
          onTap:(){
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
          },
          child:  const Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.mainColor,
              child: Icon(Icons.arrow_back_ios_new,color: AppColors.kWhiteBase,
                size: 24,),

            ),
          ),
        ),
      ],
    ));
  },
);
  }


}
