import '../../user/domain/model/user.dart';

abstract class AccountRepository {

  Future<User> getUser (String username, String password);
}