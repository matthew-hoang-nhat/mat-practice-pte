import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GlobalVariables {
  static final getIt = GetIt.instance;
  static final firestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
