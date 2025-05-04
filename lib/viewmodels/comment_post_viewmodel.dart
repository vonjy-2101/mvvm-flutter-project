import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/core/di/service_locator.dart';
import 'package:mvvm/models/comment_model.dart';

import '../core/log.dart';
import '../service/api/comment_api_service.dart';

final commentPostProvider = ChangeNotifierProvider((ref){
    return CommentPostViewmodel(getIt<CommentApiService>());
});

class CommentPostViewmodel extends ChangeNotifier {

    final CommentApiService _commentApiService; 
    CommentPostViewmodel(this._commentApiService);
    
    bool _isSendLoading = false;
    String? erreur;
    CommentModel? _lastComment ;

    bool get isSendLoading => _isSendLoading;

    formSendCheck({
        required BuildContext context, 
        required int idPost, 
        required TextEditingController emailController, 
        required TextEditingController titleController, 
        required TextEditingController bodyController}
    )
    {
        if(emailController.text == "")
        {
            return;
        }

        if(titleController.text == "")
        {
            return;
        }

        if(bodyController.text == "")
        {
            return;
        }
        
        _sendNewComment(
            context, 
            idPost, {
                "name" : titleController.text,
                "email" : emailController.text,
                "body" : bodyController.text,
            }
        );
    }

    _sendNewComment(BuildContext context, int idPost, Map<String,dynamic> comment) async
    {
        _isSendLoading = true;
        erreur = null;
        notifyListeners();

        try{
            _lastComment = await _commentApiService.sendCommentPost(idPost, comment);
            //console("OKOKOKOK");
            console(_lastComment);
            GoRouter.of(context).pop({ 'newComment' :  _lastComment});
        }catch(e)
        {
            erreur = "Erreur lors de la récupération des données";
            console(e);
        }finally{
            _isSendLoading = false;
            notifyListeners();
        }
    }

}