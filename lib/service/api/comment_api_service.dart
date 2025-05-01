import 'package:dio/dio.dart';

import '../../models/comment_model.dart';

class CommentApiService {

    final Dio _dio;
    CommentApiService(this._dio);

    Future <List<CommentModel>> getCommentByPost(int idPost)
    async {
        try{
            final response = await _dio.get('/comments?postId=$idPost');
            return (response.data as List).map((e) => CommentModel.fromJson(e)).toList(); 
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }
    }

}