import 'package:tracking_app/core/service/url_lancher_packege/open_application.dart';


enum Application{
  whats,
  phone
}

class ClickApplicationFactory{
  static  OpenApplication getClickApplication({required Application application }){
    switch (application) {
      case Application.whats:
        return OpenWhatsApp();
      case Application.phone:
        return OpenPhoneApp();
    }
  }
}