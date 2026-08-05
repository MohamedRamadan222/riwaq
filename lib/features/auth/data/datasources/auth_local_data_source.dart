import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:riwaq/features/auth/data/models/user_model.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);

  Future<UserModel> getCacheUser();

  Future<void> clearUser();
}

const String userBoxName = 'userBox';

const String cachedUserKey = 'CACHED_USER';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box box;

  AuthLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheUser(UserModel user) async {
    await box.put(cachedUserKey, jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel> getCacheUser() async {
    final jsonString = box.get(cachedUserKey);
    if (jsonString == null) {
      throw CacheException('لا يوجد بيانات مستخدم مخزنة');
    }
    return UserModel.formJson(jsonDecode(jsonString));
  }

  @override
  Future<void> clearUser() async {
    await box.delete(cachedUserKey);
  }
}
