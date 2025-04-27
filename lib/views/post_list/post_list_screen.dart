import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/post_model.dart';
import '../../viewmodels/post_list_viewmodel.dart';

class PostListScreen extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final postProvider = ref.watch(postListViewModel);

    return Scaffold(
        body: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: postProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: postProvider.listPost.length,
                    itemBuilder: (_,index){
                        return PostContent(post: postProvider.listPost[index],);
                })
        )
    );

  }

}

class PostContent extends StatelessWidget{

    PostModel post;
    PostContent({required this.post});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(post.title,style: GoogleFonts.abrilFatface(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text(post.body),
                ],
            ),
        );
    }

}