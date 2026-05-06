import 'package:snappis/Domains/Entities/Search_entites.dart';


class UserRepositoryImpl {
  Future<List<UserEntity>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate API

    return List.generate(
      8,
      (_) => UserEntity(
        name: "Riya singh",
        category: "Beauty",
        imageUrl: "https://i.pravatar.cc/150?img=47",
      ),
    );
  }
}
