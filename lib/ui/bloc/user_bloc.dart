import 'package:flutter/material.dart';
import 'package:hackathon_gc/data/model/user.dart';
import 'package:hackathon_gc/data/user_repository.dart';

class UserBloc {

  var repository = new UserRepository();

  Future<UserModel> getCurrentUser() async {
    UserModel user = await repository.getCurrentUser();
    return user;
  }

  Future<UserModel> getUserById(String userId) async {
    UserModel user = await repository.getCurrentUser();
    return user;
  }

}