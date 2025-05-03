import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/core/di/service_locator.dart';

import '../core/log.dart';
import '../models/comment_model.dart';
import '../service/api/comment_api_service.dart';

final postDetailViewModel = ChangeNotifierProvider((ref){
    return PostDetailViewmodel(getIt<CommentApiService>());
});

class PostDetailViewmodel extends ChangeNotifier {

    final CommentApiService _commentApiService; 
    PostDetailViewmodel(this._commentApiService);

    bool _isLoading = false;
    bool _isSendLoading = false;
    
    List<CommentModel> _commentPost = [];
    CommentModel? _lastComment ;
    String? erreur;

    bool get isLoading => _isLoading;
    bool get isSendLoading => _isSendLoading;
    List<CommentModel> get commentPost => _commentPost;
    CommentModel? get getLastComment => _lastComment;

    _initData()
    {
        _isLoading = true;
        _commentPost = [];
        erreur = null;
        notifyListeners();
    }

    getCommentByPost(int idPost)
    async {

        _initData();

        try{
            _commentPost = await _commentApiService.getCommentByPost(idPost);
            console(_commentPost);
        }catch(e)
        {
            erreur = "Erreur lors de la récupération des données";
        }finally{
            _isLoading = false;
            notifyListeners();
        }
    }

    sendNewComment(int idPost) async
    {
        _isSendLoading = true;
        erreur = null;
        notifyListeners();

        try{
            _lastComment = await _commentApiService.sendCommentPost(idPost, {
                "name" : "Test",
                "email" : "test@test.com",
                "body" :  "Loresm ipsulem"
            });
            
        }catch(e)
        {
            erreur = "Erreur lors de la récupération des données";
        }finally{
            _isSendLoading = false;
            notifyListeners();
        }

    }

}
