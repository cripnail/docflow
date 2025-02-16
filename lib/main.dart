import 'package:docflow/core/di/injection_container.dart' as di;
import 'package:docflow/features/core/screens/loader_screen.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_event.dart';
import 'package:docflow/features/subscription/presentation/bloc/subscription_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentListBloc>(
          create: (context) =>
              di.sl<DocumentListBloc>()..add(const LoadDocuments()),
        ),
        BlocProvider<SubscriptionBloc>(
          create: (context) => di.sl<SubscriptionBloc>(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoaderScreen(), // Use LoaderScreen as initial route
      ),
    );
  }
}
