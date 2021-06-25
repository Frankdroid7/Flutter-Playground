import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    uri: 'https://hasura.io/learn/graphql',
  );
  static String _token;

  static final AuthLink authLink = AuthLink(getToken: () => _token);
  static final WebSocketLink webSocketLink = WebSocketLink(
    url: 'wss://hasura.io/learn/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initPayload: () async {
        return {
          'headers': {'Authorization': _token},
        };
      },
    ),
  );
  static final Link link = authLink.concat(httpLink).concat(webSocketLink);

  static String token;
  static ValueNotifier<GraphQLClient> initializeClient(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: link,
      ),
    );
    return client;
  }
}
