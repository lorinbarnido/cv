import 'package:flutter_mini_project/user/domain/model/user.dart';

import '../../domain/account_repository.dart';
import '../remote/account_remote_source.dart';

class AccountRepositoryImpl implements AccountRepository {
  const AccountRepositoryImpl(
    this._accountRemoteSource,
  );

  final AccountRemoteSource _accountRemoteSource;

  @override
  Future<User> getUser(String username, String password) {
    return _accountRemoteSource.getUser(username: username, password: password);
  }
}