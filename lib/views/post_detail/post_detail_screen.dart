import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/app_pages.dart';
import '../../models/post_model.dart';

class PostDetailScreen extends ConsumerWidget {

    PostModel post;
    PostDetailScreen({required this.post});
    
    @override
    Widget build(BuildContext context, WidgetRef ref) {
        
        return Scaffold(
                appBar: AppBar(
                    title: Text(post.title),
                ),
                body: Container(
                    child: Text("This is post detail : ${post.title}"),
                ),
            );

    }

}