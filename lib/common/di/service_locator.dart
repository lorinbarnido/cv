import 'package:graphql_flutter/graphql_flutter.dart';

final httpLink = HttpLink('https://black-market-prof-goals2022.herokuapp.com/graphql');
  
final GraphQLClient graphQLClient = 
  GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink
  );
