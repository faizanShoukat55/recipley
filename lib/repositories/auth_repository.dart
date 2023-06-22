import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipley/models/auth_model.dart';

import '../main.dart';

class AuthRepository {
  final _db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  ///
  /// Register User
  ///
  registerUser(AuthenticationModel user) async {
    try {
      await _db.collection('recipley_users').doc(user.uID).set(user.toJson());
    } catch (e) {
      throw Exception("$e");
    }
  }

  ///
  /// Get User
  ///
  Future<AuthenticationModel?> getUser(id) async {
    try {
      logger.e("AuthIssue id:${id}");
      final snapshot = await _db.collection('recipley_users').doc(id).get();
      logger.e("AuthIssue SnapShots :${snapshot.data()}");
      return AuthenticationModel.fromJson(snapshot.data() as Map<String, dynamic>, snapshot.id);
    } catch (e) {
      throw Exception("$e");
    }
  }
}