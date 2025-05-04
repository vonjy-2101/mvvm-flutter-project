import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_theme.dart';
import '../../core/routes/app_pages.dart';
import '../../models/post_model.dart';
import '../../viewmodels/post_list_viewmodel.dart';
import '../shared/app_button.dart';
import '../shared/app_header.dart';
import '../shared/app_input_text.dart';

class PostListScreen extends ConsumerWidget{

    TextEditingController newPostController = TextEditingController(text: '');

    @override
    Widget build(BuildContext context, WidgetRef ref) {

        final postProvider = ref.watch(postListViewModel);

        return Scaffold(
            appBar: AppHeader(titlePage: "Post App",),
            body: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                    children: [
                        SizedBox(height: 10,),
                        //Input text
                        Container(  
                            width: MediaQuery.sizeOf(context).width,
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: AppInputText(controller: newPostController,max: 3,),
                        ),

                        // List post
                        Expanded(
                            child: postProvider.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : (postProvider.error != null)
                                ? Center(
                                    child: Text(postProvider.error!),
                                )
                                : ListView.builder(
                                    itemCount: postProvider.listPost.length,
                                    itemBuilder: (_,index){
                                        return PostContent(post: postProvider.listPost[index],);
                                })
                        )
                    ],
                )
            )
        );

    }

}

class PostContent extends StatelessWidget{

    PostModel post;
    PostContent({required this.post});

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: () {
                GoRouter.of(context).push(Routes.detailPost, extra: post);
            },
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(post.title,style: GoogleFonts.abrilFatface(fontSize: 18,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10),
                        Text(post.body),
                    ],
                ),
            ),
        );
    }

}