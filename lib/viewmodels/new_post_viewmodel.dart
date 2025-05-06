import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/core/di/service_locator.dart';
import 'package:mvvm/models/post_model.dart';
import 'package:mvvm/service/api/post_api_service.dart';

import '../core/log.dart';

final newPostProvider = ChangeNotifierProvider((ref){
    return NewPostViewmodel(getIt<PostApiService>());
});

class NewPostViewmodel extends ChangeNotifier {

    PostApiService _postApiService;
    NewPostViewmodel(this._postApiService);
    bool _isSendLoading = false;
    String? erreur;

    bool get isSendLoading => _isSendLoading;

    checkFormPost({
        required BuildContext context,
        required TextEditingController title,
        required TextEditingController body
    })
    {

        if(title.text == "")
        {return;}

        if(body.text == "")
        {return;}

        _sendNewPost(
            context,
            {
                "title" : title.text,
                "body" : body.text,
                "userId" : 1,
            }
        );

    }

    _sendNewPost(BuildContext context, Map<String,dynamic> post) async
    {

        _isSendLoading = true;
        notifyListeners();

        try{
            final response = await _postApiService.addNewPost(post);
            GoRouter.of(context).pop({ 'newPost' :  response});
        }catch(e)
        {
            throw 'Erreur de connexion : $e';
        }finally
        {
            _isSendLoading = false;
            notifyListeners();
        }
    }

}