import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/core/di/service_locator.dart';
import 'package:mvvm/models/post_model.dart';
import 'package:mvvm/service/api/post_api_service.dart';

final postListViewModel = ChangeNotifierProvider((ref){
  return PostListViewmodel(getIt<PostApiService>());
});

class PostListViewmodel extends ChangeNotifier
{

  PostApiService _postApiService;
  PostListViewmodel(this._postApiService) : super(){ getAllBook(); }

  bool _isLoading = false;
  List<PostModel> _listPost = [];

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
      throw 'Une erreur est survenue : $e';
    }finally
    {
      _isLoading = false;
      notifyListeners();
    }
  }

}