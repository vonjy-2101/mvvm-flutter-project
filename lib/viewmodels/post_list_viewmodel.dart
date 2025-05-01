import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/di/service_locator.dart';
import '../models/post_model.dart';
import '../service/api/post_api_service.dart';

final postListViewModel = ChangeNotifierProvider((ref){
  return PostListViewmodel(getIt<PostApiService>());
});

class PostListViewmodel extends ChangeNotifier
{

    final PostApiService _postApiService;
    PostListViewmodel(this._postApiService) : super(){ getAllBook(); }

    bool _isLoading = false;
    List<PostModel> _listPost = [];
    String? error;

    bool get isLoading => _isLoading;
    List<PostModel> get listPost => _listPost;

    void getAllBook() async
    {
        _isLoading = true;
        notifyListeners();

        try{
            _listPost = await _postApiService.fetchAllPost();
        }catch(e)
        {
            error = "Une erreur est survenue";
        }finally
        {
            _isLoading = false;
            notifyListeners();
        }
    }

}