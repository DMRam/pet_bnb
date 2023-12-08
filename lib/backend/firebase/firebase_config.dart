import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC5JdfX51-an9KTjtkYJ5zltlHBhsFftjA",
            authDomain: "ulogic-it-petbnb-tklpne.firebaseapp.com",
            projectId: "ulogic-it-petbnb-tklpne",
            storageBucket: "ulogic-it-petbnb-tklpne.appspot.com",
            messagingSenderId: "176858987512",
            appId: "1:176858987512:web:828e6301e9471c794bb40d"));
  } else {
    await Firebase.initializeApp();
  }
}
