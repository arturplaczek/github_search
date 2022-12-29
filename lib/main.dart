import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

import 'package:github_search/app/app.dart';

void main() {
  final apiClient = ApiClient();

  runApp(
    App(
      apiClient: apiClient,
    ),
  );
}
