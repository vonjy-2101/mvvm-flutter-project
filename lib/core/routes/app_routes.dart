
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/models/post_model.dart';

import '../../views/comment_post/comment_post_screen.dart';
import '../../views/new_post/new_post_screen.dart';
import '../../views/post_detail/post_detail_screen.dart';
import '../../views/post_list/post_list_screen.dart';
import 'app_pages.dart';

final pagesRoutes = GoRouter(
    initialLocation: Routes.initial,
    routes: 
        [
            GoRoute(
                path: Routes.initial,
                builder: (context,state){
                    return PostListScreen();
                }
            ),
            GoRoute(
                path: Routes.detailPost,
                pageBuilder: (context,state){
                    final post = state.extra as PostModel;
                    return CupertinoPage(child: PostDetailScreen(post: post,));
                }
            ),
            GoRoute(
                path: Routes.postComment,
                pageBuilder: (context,state){
                    final post = state.extra as PostModel;
                    return CupertinoPage(child: CommentPostScreen(post: post,));
                }
            ),
            GoRoute(
                path: Routes.newPost,
                pageBuilder: (context,state){
                    return CupertinoPage(child: NewPostScreen());
                }
            ),
        ]
);
