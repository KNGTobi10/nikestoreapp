import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAmzM6uDuf5OMqe50oKXK5moPphRqzLZ3g",
            authDomain: "nikestore-eb431.firebaseapp.com",
            projectId: "nikestore-eb431",
            storageBucket: "nikestore-eb431.appspot.com",
            messagingSenderId: "836031189433",
            appId: "1:836031189433:web:07b568644cd9b9156b6668"));
  } else {
    await Firebase.initializeApp();
  }
}
