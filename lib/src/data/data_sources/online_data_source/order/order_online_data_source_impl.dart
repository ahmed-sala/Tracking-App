import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/helpers/firestore/firestore_services.dart';

import 'order_online_data_source.dart';

@Injectable(as: OrderOnlineDataSource)
class AuthOnlineDataSourceImpl implements OrderOnlineDataSource {
  final FirestoreService _firestoreService;
  AuthOnlineDataSourceImpl(this._firestoreService);

  @override
  Future<void> putData() {
    var data = {'name': 'John Doe', 'email': ''};
    return _firestoreService.addDocument('users', data);
  }
}
