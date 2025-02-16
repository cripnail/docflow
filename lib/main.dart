import 'package:docflow/core/di/injection_container.dart' as di;
import 'package:docflow/core/services/revenue_cat_service.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_event.dart';
import 'package:docflow/features/subscription/presentation/bloc/subscription_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_bloc.dart';
import 'package:docflow/features/document_list/data/repositories/document_repository_impl.dart';
import 'package:docflow/core/services/pdf_converter.dart';
import 'package:docflow/features/document_scanner/data/services/metadata_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initDependencies();

  final prefs = await SharedPreferences.getInstance();
  final metadataStorage = MetadataStorageService(prefs);
  final pdfConverter = PDFConverterService();
  final documentRepository = DocumentRepository(pdfConverter, metadataStorage);

  runApp(MyApp(
    documentRepository: documentRepository,
    pdfConverter: pdfConverter,
  ));
}

class MyApp extends StatelessWidget {
  final DocumentRepository documentRepository;
  final PDFConverterService pdfConverter;

  const MyApp({
    super.key,
    required this.documentRepository,
    required this.pdfConverter,
  });

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
        home: const OnboardingScreen(),
      ),
    );
  }
}
