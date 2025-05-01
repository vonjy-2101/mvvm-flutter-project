import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../service/api/comment_api_service.dart';
import '../../service/api/post_api_service.dart';

final getIt = GetIt.instance;

void setupInjection()
{
    //Service
    getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')));
    getIt.registerLazySingleton<PostApiService>(() => PostApiService(getIt<Dio>()));
    getIt.registerLazySingleton<CommentApiService>(() => CommentApiService(getIt<Dio>()));
}