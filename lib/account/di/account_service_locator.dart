import '../../common/di/service_locator.dart';
import '../data/remote/account_remote_source.dart';
import '../data/repository/account_repository_impl.dart';

final accountRemoteSource = AccountRemoteSource(graphQLClient);
final accountRepository = AccountRepositoryImpl(accountRemoteSource);