import 'package:flutter/material.dart';
import 'package:snappis/Data/Repositories/User_repositories_impl.dart';
import 'package:snappis/Domains/Entities/Search_entites.dart';


class UserProvider extends ChangeNotifier {
  final repo = UserRepositoryImpl();

  List<UserEntity> users = [];
  bool loading = true;

  UserProvider() {
    loadUsers();
  }

  Future<void> loadUsers() async {
    users = await repo.fetchUsers();
    loading = false;
    notifyListeners();
  }
}
