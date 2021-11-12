import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/GraphQLPlayground/Config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data/todo.dart';

class GraphQLPlayground extends StatefulWidget {
  @override
  _GraphQLPlaygroundState createState() => _GraphQLPlaygroundState();
}

class _GraphQLPlaygroundState extends State<GraphQLPlayground> {
  String userTodo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GraphQLProvider(
          client: Config.initializeClient(token),
          child: Column(
            children: [
              SizedBox(height: 40),
              Query(
                options: QueryOptions(
                    document: gql(Todo.fetchAll),
                    variables: {"is_public": false}),
                builder: (QueryResult result,
                    {VoidCallback refetch, FetchMore fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }
                  if (result.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.tealAccent),
                      ),
                    );
                  }
                  final List todos = (result.data['todos'] as List<dynamic>);
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final responseData = todos[index];
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: ListTile(
                            visualDensity: VisualDensity.compact,
                            leading: Text(
                              responseData['id'].toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            title: Text(
                              responseData['title'],
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                            trailing: Mutation(
                              options: MutationOptions(
                                documentNode: gql(Todo.deleteTodo),
                                onCompleted: (dynamic responseData) {
                                  setState(() {});
                                },
                              ),
                              builder: (RunMutation runMutation,
                                  QueryResult result) {
                                return InkWell(
                                  onTap: () {
                                    runMutation(Todo.deleteTodoVariables(
                                        responseData['id']));
                                  },
                                  child: Text(
                                    'DELETE TODO',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: TextField(
                    onChanged: (value) => userTodo = value,
                    decoration: InputDecoration(
                      hintText: 'Enter your todo...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Mutation(
                options: MutationOptions(
                    documentNode: gql(Todo.addTodo),
                    update: (GraphQLDataProxy cache, QueryResult result) {
                      return cache;
                    },
                    onCompleted: (dynamic resultData) {
                      setState(() {});
                    }),
                builder: (RunMutation runMutation, QueryResult result) {
                  return Builder(
                    builder: (context) => RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        if (userTodo != null) {
                          runMutation(Todo.addTodoVariables(false, userTodo));
                        } else {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Enter your TODO.')));
                        }
                      },
                      child: Text('ADD TODO'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String token =
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpYnVrdW5vbGFkaXBvMjAxNUBnbWFpbC5jb20iLCJuYW1lIjoiaWJ1a3Vub2xhZGlwbzIwMTUiLCJpYXQiOjE2MzY3MTUwOTkuMTI4LCJpc3MiOiJodHRwczovL2hhc3VyYS5pby9sZWFybi8iLCJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS11c2VyLWlkIjoiaWJ1a3Vub2xhZGlwbzIwMTVAZ21haWwuY29tIiwieC1oYXN1cmEtZGVmYXVsdC1yb2xlIjoidXNlciIsIngtaGFzdXJhLXJvbGUiOiJ1c2VyIn0sImV4cCI6MTYzNjgwMTQ5OX0.6zMW-gXJkCfkyH0_zL2uKCrWLuBYgvq6Lx9lWR226uQ';
