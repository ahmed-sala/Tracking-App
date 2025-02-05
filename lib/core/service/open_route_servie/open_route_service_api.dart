import 'package:latlong2/latlong.dart';
import '../../common/apis/api_result.dart';

abstract class OpenRouteServiceApi {
  Future<ApiResult<List<LatLng>>> getRouteMaps({
    required double startLat,
    required double startLog,
    required double endLat,
    required double endLog,
  });
}
