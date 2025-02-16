import 'package:docflow/features/document_scanner/data/repositories/scanner_repository_impl.dart';
import 'package:docflow/features/document_scanner/domain/repositories/scanner_repository.dart';
import 'package:docflow/features/document_scanner/presentation/bloc/scanner_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:docflow/core/services/revenue_cat_service.dart';
import 'package:docflow/core/services/pdf_converter.dart';
import 'package:docflow/features/document_scanner/data/services/metadata_storage_service.dart';
import 'package:docflow/features/document_list/data/repositories/document_repository_impl.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_bloc.dart';
import 'package:docflow/features/subscription/presentation/bloc/subscription_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  final revenueCatService = RevenueCatService();
  await revenueCatService.init();
  sl.registerLazySingleton<RevenueCatService>(() => revenueCatService);

  sl.registerLazySingleton(() => PDFConverterService());
  sl.registerLazySingleton(() => MetadataStorageService(sl()));

  sl.registerLazySingleton(() => DocumentRepository(sl(), sl()));
  sl.registerFactory(() => DocumentListBloc(
        repository: sl(),
        pdfConverter: sl(),
      ));
  sl.registerFactory(() => SubscriptionBloc(sl()));
  sl.registerLazySingleton<DocumentScannerRepository>(
    () => DocumentScannerRepositoryImpl(sl()),
  );

  sl.registerFactory(() => DocumentScannerBloc(
        sl<DocumentScannerRepository>(),
        sl<MetadataStorageService>(),
      ));
}
