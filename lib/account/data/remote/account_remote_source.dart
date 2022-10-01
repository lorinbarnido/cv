import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../user/domain/model/user.dart';

class AccountRemoteSource {
  const AccountRemoteSource(this._client);

  final GraphQLClient _client;

  final String _getUser =
    r'''
      query GetUser($userName: String!) {
        getUser(userName: $userName) {
          userId
          userName
          email
        }
      }
    ''';
  
  Future<User> getUser({required String username, String? password}) async {
    final options = QueryOptions(
      document: gql(_getUser),
      variables: {
        'userName': username,
        'password': password
      },
    );
    final response = await _client.query(options);

    if (!response.hasException) {
      return User.fromJson(response.data!['getUser']);
    }
    throw Exception('Invalid username or password!');
  }
}