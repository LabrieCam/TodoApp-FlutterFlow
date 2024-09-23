import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD9eLCg_taTMw1auv2MQvUCIe_cIq0vmBw",
            authDomain: "todo-qaddtk.firebaseapp.com",
            projectId: "todo-qaddtk",
            storageBucket: "todo-qaddtk.appspot.com",
            messagingSenderId: "939923419134",
            appId: "1:939923419134:web:ce5ca7b9bcaf5a825e1aaf"));
  } else {
    await Firebase.initializeApp();
  }
}
