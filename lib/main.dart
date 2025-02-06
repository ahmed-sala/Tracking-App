import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/tracking_app.dart';

import 'core/di/di.dart';
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

  final initialPageRoute = InitialPageRoute.getInstance();
  await initialPageRoute.initializeData();

  Bloc.observer = MyBlocObserver();
  runApp(const TrackingApp());
}
