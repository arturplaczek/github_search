import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_search/app/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver() : super();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  final apiClient = ApiClient();

  Bloc.observer = AppBlocObserver();

  runApp(
    App(
      apiClient: apiClient,
    ),
  );
}
