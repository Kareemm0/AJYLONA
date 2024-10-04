import 'package:ageal/core/constants/end_point.dart';
import 'package:ageal/core/network/dio/base_dio.dart';
import 'package:ageal/core/network/dio/dio_client.dart';
import 'package:ageal/core/network/dio/dio_interceptor.dart';
import 'package:ageal/data/repo/auth/login_repo_impl.dart';
import 'package:ageal/data/repo/home_repo_impl.dart';
import 'package:ageal/data/repo/news/news_repo_impl.dart';
import 'package:ageal/data/repo/platform/episodes_repo_impl.dart';
import 'package:ageal/data/repo/platform/play_list_and_episodes_repo_impl.dart';
import 'package:ageal/data/source/source_base/auth/login_source.dart';
import 'package:ageal/data/source/source_base/auth/register_source.dart';
import 'package:ageal/data/source/source_base/home_source.dart';
import 'package:ageal/data/source/source_base/news/news_source.dart';
import 'package:ageal/data/source/source_base/platform/episodes_source.dart';
import 'package:ageal/data/source/source_base/platform/playlist_and_episodes_source.dart';
import 'package:ageal/data/source/source_impl/events_source_impl.dart';
import 'package:ageal/data/source/source_impl/home_source_impl.dart';
import 'package:ageal/data/source/source_impl/news/news_source_impl.dart';
import 'package:ageal/data/source/source_impl/platform/episodes_source_impl.dart';
import 'package:ageal/data/source/source_impl/platform/playlist_and_episodes_spurce_impl.dart';
import 'package:ageal/domain/repo/home_repo.dart';
import 'package:ageal/domain/repo/news/news_repo.dart';
import 'package:ageal/domain/repo/paltform/episodes_repo.dart';
import 'package:ageal/domain/repo/paltform/playlist_and_episodes_repo.dart';
import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_cubit.dart';
import 'package:ageal/presentation/cubit/home/home_cubit.dart';
import 'package:ageal/presentation/cubit/login/login_cubit.dart';
import 'package:ageal/presentation/cubit/news/news_cubit.dart';
import 'package:ageal/presentation/cubit/platform/episodes/episodes_cubit.dart';
import 'package:ageal/presentation/cubit/platform/playlist/play_list_cubit.dart';
import 'package:ageal/presentation/cubit/register/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/repo/auth/register_repo_impl.dart';
import 'data/repo/events_repo_impl.dart';
import 'data/repo/profile/user_data_repo_impl.dart';
import 'data/source/source_base/events_source.dart';
import 'data/source/source_base/profile/user_data_source.dart';
import 'data/source/source_impl/auth/login_source_impl.dart';
import 'data/source/source_impl/auth/register_source_impl.dart';
import 'data/source/source_impl/profile/user_data_source_impl.dart';
import 'domain/repo/auth/login_repo.dart';
import 'domain/repo/auth/register_repo.dart';
import 'domain/repo/events_repo.dart';
import 'domain/repo/profile/user_data_repo.dart';
import 'presentation/cubit/events/cubit/events_cubit.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  BaseOptions options = BaseOptions(
      baseUrl: EndPoint.baseUrl,
      followRedirects: false,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30));

  getIt.registerSingleton<BaseDio>(DioClient(
      options: options, dio: Dio(), interceptors: [DioInterceptor()]));
  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerDataSources() {
  getIt.registerSingleton<HomeSource>(HomeSourceImpl(baseDio: getIt()));
  getIt.registerSingleton<RegisterSource>(RegisterSourceImpl(baseDio: getIt()));
  getIt.registerSingleton<LoginSource>(LoginSourceImpl(dio: getIt()));
  getIt.registerSingleton<EventsSource>(EventsSourceImpl(baseDio: getIt()));
  getIt.registerSingleton<NewsSource>(NewsSourceImpl(getIt()));
  getIt.registerSingleton<EpisodesSource>(EpisodesSourceImpl(getIt()));
  getIt.registerSingleton<PlaylistAndEpisodesSource>(
      PlaylistAndEpisodesSpurceImpl(getIt()));
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl(baseDio: getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(homeSource: getIt()));
  getIt.registerSingleton<RegisterRepo>(RegisterRepoImpl(getIt()));
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(getIt()));
  getIt.registerSingleton<EventsRepo>(EventsRepoImpl(eventsSource: getIt()));
  getIt.registerSingleton<NewsRepo>(NewsRepoImpl(getIt()));
  getIt.registerSingleton<EpisodesRepo>(EpisodesRepoImpl(getIt()));
  getIt.registerSingleton<PlaylistAndEpisodesRepo>(
      PlayListAndEpisodesRepoImpl(getIt()));
  getIt.registerSingleton<UserDataRepo>(
      UserDataRepoImpl(settingSource: getIt()));
}

void _registerFactory() {
  getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepo: getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<EventsCubit>(() => EventsCubit(eventsRepo: getIt()));
  getIt.registerFactory<NewsCubit>(() => NewsCubit(getIt()));
  getIt.registerFactory<EpisodesCubit>(() => EpisodesCubit(getIt()));
  getIt.registerFactory<PlayListCubit>(() => PlayListCubit(getIt()));
  getIt.registerFactory<UserDataCubit>(
      () => UserDataCubit(settingRepo: getIt()));
}
