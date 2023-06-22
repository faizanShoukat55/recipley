
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../models/auth_model.dart';
import '../repositories/auth_repository.dart';
import '../routes/app_routes.dart';


class FirebaseProvider extends GetxService {
  final _authRepository = AuthRepository();
  final _auth = FirebaseAuth.instance;

  Future<FirebaseProvider> init() async {
   return this;
  }


  Future<AuthenticationModel> loginWithEmailPassword({email, password}) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      AuthenticationModel authModel=AuthenticationModel();
      if (credentials.user != null) {
        authModel = (await _authRepository.getUser(credentials.user!.uid))!;
        Get.offAllNamed(Routes.dashboard);
      }else{
        AuthenticationModel registerUser=AuthenticationModel(email: email,password: password);
        signUpWithEmailPassword(registerUser);
      }

      return authModel;
    } catch (e) {
      throw Exception("$e");
    }

  }


  Future<AuthenticationModel> signUpWithEmailPassword(AuthenticationModel user) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(email: user.email!, password: user.password!);

      AuthenticationModel authModel=AuthenticationModel();


      if (credentials.user != null) {
        await _authRepository.registerUser(user);
        loginWithEmailPassword(email: user.email,password: user.password);
      }

      return authModel;
    } catch (e) {
      throw Exception("$e");
    }

  }


}
