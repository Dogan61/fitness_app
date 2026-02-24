import 'package:dio/dio.dart';
import 'package:fitness_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fitness_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:fitness_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:fitness_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:fitness_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fitness_app/feature/home/data/datasources/home_remote_data_source.dart';
import 'package:fitness_app/feature/home/data/repositories/home_repository_impl.dart';
import 'package:fitness_app/feature/home/domain/repositories/home_repository.dart';
import 'package:fitness_app/feature/home/domain/usecases/get_articles_usecase.dart';
import 'package:fitness_app/feature/home/domain/usecases/get_exercises_usecase.dart';
import 'package:fitness_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:fitness_app/feature/profile/data/datasources/profile_local_data_source.dart';
import 'package:fitness_app/feature/profile/data/repositories/profile_repository_impl.dart';
import 'package:fitness_app/feature/profile/domain/repositories/profile_repository.dart';
import 'package:fitness_app/feature/profile/domain/usecases/get_profile_usecase.dart';
import 'package:fitness_app/feature/profile/domain/usecases/update_profile_usecase.dart';
import 'package:fitness_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fitness_app/feature/setup/data/datasources/setup_local_data_source.dart';
import 'package:fitness_app/feature/setup/data/repositories/setup_repository_impl.dart';
import 'package:fitness_app/feature/setup/domain/repositories/setup_repository.dart';
import 'package:fitness_app/feature/setup/domain/usecases/save_user_profile_usecase.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // ─── External ─────────────────────────────────────────────────────────────
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    ),
  );

  // ─── Auth ─────────────────────────────────────────────────────────────────
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<Dio>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => RegisterUseCase(sl<AuthRepository>()));
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
    ),
  );

  // ─── Setup ────────────────────────────────────────────────────────────────
  sl.registerLazySingleton<SetupLocalDataSource>(
    () => SetupLocalDataSourceImpl(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<SetupRepository>(
    () => SetupRepositoryImpl(sl<SetupLocalDataSource>()),
  );
  sl.registerLazySingleton(
    () => SaveUserProfileUseCase(sl<SetupRepository>()),
  );
  sl.registerFactory(
    () => SetupCubit(
      saveUserProfileUseCase: sl<SaveUserProfileUseCase>(),
    ),
  );

  // ─── Home ─────────────────────────────────────────────────────────────────
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(sl<HomeRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => GetExercisesUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => GetArticlesUseCase(sl<HomeRepository>()));
  sl.registerFactory(
    () => HomeCubit(
      getExercisesUseCase: sl<GetExercisesUseCase>(),
      getArticlesUseCase: sl<GetArticlesUseCase>(),
    ),
  );

  // ─── Profile ──────────────────────────────────────────────────────────────
  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl<ProfileLocalDataSource>()),
  );
  sl.registerLazySingleton(() => GetProfileUseCase(sl<ProfileRepository>()));
  sl.registerLazySingleton(
    () => UpdateProfileUseCase(sl<ProfileRepository>()),
  );
  sl.registerFactory(
    () => ProfileCubit(
      getProfileUseCase: sl<GetProfileUseCase>(),
      updateProfileUseCase: sl<UpdateProfileUseCase>(),
    ),
  );
}
