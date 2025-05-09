import 'package:dio/dio.dart';

import '../../core/di/network_exception.dart';
import '../../models/comment_model.dart';

class CommentApiService {

    final Dio _dio;
    CommentApiService(this._dio);

    Future <List<CommentModel>> getCommentByPost(int idPost)
    async {
        try{
            final response = await _dio.get('/comments?postId=$idPost');
            return (response.data as List).map((e) => CommentModel.fromJson(e)).toList(); 
        }on DioException catch(e){
            final message = handleDioError(e);
            throw 'Erreur de connexion : $message';
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }
    }

    Future<CommentModel> sendCommentPost(int idPost, Map<String, dynamic> dataComment) async
    {
        try{
            final response = await _dio.post(
                "/comments",
                data: {
                    "postId" : idPost,
                    "name" : dataComment['name'],
                    "email" : dataComment['email'],
                    "body" : dataComment['body'],
                }
            );
            return CommentModel.fromJson(response.data);            
            
        }on DioException catch(e){
            final message = handleDioError(e);
            throw 'Erreur de connexion : $message';
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }
    }

}
