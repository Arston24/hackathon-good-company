import 'package:flutter/material.dart';
import 'package:hackathon_gc/data/model/user.dart';
import 'package:hackathon_gc/data/user_repository.dart';

class Bloc {

  var repository = new UserRepository();

  Future<UserModel> getCurrentUser() async {
    UserModel user = await repository.getCurrentUser();
    return user;
  }

}