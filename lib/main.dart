import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mindchoises_test_app/firebase_options.dart';

import 'app.dart';
import 'core/di/injector.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await dotenv.load(fileName: '.env');
    setupLocator();


    runApp(const MyApp());
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
