class Todo {
  static String fetchAll = """query getTodos(\$is_public: Boolean!) {
  todos(where: { is_public: { _eq: \$is_public} },
   order_by: { created_at: desc }) {
    __typename
    id
    title
    is_completed
  }
}""";

  static String addTodo =
      """mutation AddTodo(\$is_public: Boolean!, \$title: String!) {
  insert_todos(objects: {is_public: \$is_public, title: \$title}) {
    returning {
      id
      title
      user_id
    }
  }
}
""";
  static String deleteTodo = """
  mutation deleteTodo(\$id: Int!){
  delete_todos(where: {id:{_eq: \$id}}){
    returning{
      id
    }
  }
}
  """;

  static String getTodosSubscription = """
  subscription{
  todos{
    id,
    title,
  }
}
  """;

  static Map<String, dynamic> addTodoVariables(bool is_public, String title) {
    return {"is_public": is_public, "title": title};
  }

  static Map<String, dynamic> deleteTodoVariables(int id) {
    return {"id": id};
  }
}
