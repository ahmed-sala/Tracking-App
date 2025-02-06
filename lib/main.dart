import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/src/tracking_app.dart';

import 'core/di/di.dart';
import 'core/helpers/shared_pref/shared_pref_keys.dart';
import 'core/routes/initial_page_route.dart';
import 'core/utilities/bloc_observer/my_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.clearPersistence();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
    sslEnabled: true,
    host: 'firestore.googleapis.com',
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  String? token =
      await getIt<FlutterSecureStorage>().read(key: SharedPrefKeys.tokeKey);
  if (token != null) {
   // token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2Nzc5NGUyYjlmMzg4NGIzNDA1YzRlNjAiLCJpYXQiOjE3MzgxMTM5MjN9.IYA0NPhUiMADLxLtWLcpPGU_QPzMGPepMuqk-yjvZbc";
    getIt<Dio>().options.headers['Authorization'] = 'Bearer $token';
  }
  final initialPageRoute = InitialPageRoute.getInstance();
  await initialPageRoute.initializeData();

  Bloc.observer = MyBlocObserver();
  runApp(const TrackingApp());
}
