import 'package:tracking_app/core/helpers/shared_pref/shared_pref_helper.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import '../helpers/shared_pref/shared_pref_keys.dart';

class InitialPageRoute {
  String? _token;
  String? _orderId;
  InitialPageRoute._();
  static InitialPageRoute? _instance;
  static InitialPageRoute getInstance() {
    _instance ??= InitialPageRoute._();
    return _instance!;
  }

  Future<void> initializeData() async {
    _token = await _getToken();
    _orderId = await _getOrderId();
  }

  Future<String?> _getToken() async {
    return await SharedPrefHelper.getSecureString(SharedPrefKeys.tokeKey);
  }

  Future<String?> _getOrderId() async {
    return await SharedPrefHelper.getString(SharedPrefKeys.orderId);
  }

  String getInitialPageRouteName() {
    print("token :$_token");
    print("order111 :$_orderId");
    if (_token == null) {
      return PageRoutesName.login;
    } else {
       if(_orderId==null || _orderId!.isEmpty){
         return PageRoutesName.section;
       }else{
         return PageRoutesName.orderDetailsScreen;
       }
    }
  }
}
