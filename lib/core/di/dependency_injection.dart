import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../networking/dio_helper.dart';
import '../networking/ticketmaster_api.dart';
import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repos/home_repository.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/event/data/data_sources/events_remote_data_source.dart';
import '../../features/event/data/repos/events_repository.dart';
import '../../features/event/data/entities/event_query.dart';
import '../../features/event/logic/cubit/events_list_cubit.dart';
import '../../features/event/logic/cubit/event_details_cubit.dart';
import '../../features/event/logic/cubit/search_cubit.dart';
import '../../features/auth/data/services/auth_service.dart';
import '../../features/auth/logic/login/login_cubit.dart';
import '../../features/auth/logic/signup/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt
    ..registerLazySingleton<Dio>(DioHelper.createDio)
    ..registerLazySingleton<TicketmasterApi>(() => TicketmasterApi(getIt<Dio>()))
    
    // Auth Feature
    ..registerLazySingleton<AuthService>(() => AuthService())
    ..registerFactory<LoginCubit>(() => LoginCubit(getIt()))
    ..registerFactory<SignupCubit>(() => SignupCubit(getIt()))

    // Home Feature
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()))
    ..registerFactory(() => HomeCubit(getIt()))

    // Event Feature
    ..registerLazySingleton<EventsRemoteDataSource>(
      () => EventsRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<EventsRepository>(
      () => EventsRepositoryImpl(getIt()),
    )
    ..registerFactory(() => SearchCubit(getIt()))
    ..registerFactory(() => EventDetailsCubit(getIt()))
    ..registerFactoryParam<EventsListCubit, EventListMode, void>(
      (mode, _) => EventsListCubit(getIt(), mode: mode),
    );
}
