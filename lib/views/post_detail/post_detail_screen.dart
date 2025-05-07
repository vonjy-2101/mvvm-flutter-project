import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm/models/comment_model.dart';

import '../../core/log.dart';
import '../../core/routes/app_pages.dart';
import '../../models/post_model.dart';
import '../../viewmodels/post_detail_viewmodel.dart';
import '../shared/app_button.dart';
import '../shared/app_header.dart';
import '../shared/app_shimmer_comment.dart';

class PostDetailScreen extends ConsumerStatefulWidget{

    PostModel post;
    PostDetailScreen({super.key, required this.post});
    @override
    _PostDetailScreenState createState() => _PostDetailScreenState();

}

class _PostDetailScreenState extends ConsumerState<PostDetailScreen> {

    @override
    void initState() {
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(postDetailViewModel).getCommentByPost(widget.post.id);
        });
    }

    
    @override
    Widget build(BuildContext context) {
        
        final commentProvider = ref.watch(postDetailViewModel);

        return Scaffold(
                appBar: AppHeader(titlePage: "Post Details",),
                body: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            SizedBox(height: 10,),
                            Container(
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
                                        Text(widget.post.title,style: GoogleFonts.abrilFatface(fontSize: 18,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10),
                                        Text(widget.post.body),
                                    ],
                                ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                child: Text("Comments:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            // List comment
                            if(commentProvider.isLoading)...[
                                SizedBox(
                                    height: 550,
                                    child: ListView.builder(
                                        itemCount: 10,
                                        itemBuilder: (_,index){
                                            return AppShimmerComment();
                                        }
                                    )
                                )
                            ]else...[
                                if(commentProvider.erreur != null)...[
                                    Center(
                                        child: Text(commentProvider.erreur!),
                                    )
                                ]else...[
                                    Container(
                                        height: 550,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black26)
                                        ),
                                        child: ListView.builder(
                                            itemCount: commentProvider.commentPost.length,
                                            itemBuilder: (_,index){
                                                return _CommentWidget(commentProvider.commentPost[index]);
                                            }
                                        )
                                    )
                                ],
                            ],
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                child: AppButton(
                                    onPressed: (){
                                        GoRouter.of(context).push(Routes.postComment, extra: widget.post).then((res) {
                                            if(res != null)
                                            {
                                                final dataReturn = res as Map<String,dynamic>;
                                                console("RETURN DATA : ${dataReturn['newComment']}");
                                                commentProvider.updateListComment(dataReturn['newComment']);
                                            }
                                        });
                                    },
                                    title: "Add comment",
                                ),
                            )
                            
                        ],
                    ),
                ),
            );

    }

}

class _CommentWidget extends StatelessWidget{

    CommentModel comment;
    _CommentWidget(this.comment);

    @override
    Widget build(BuildContext context) {
        
        return Container(
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
                    Text(comment.email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                    SizedBox(height: 4,),
                    Text(comment.body),
                    SizedBox(height: 4,),
                    Text("By: ${comment.email}",style: TextStyle(color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white54 : Colors.black45,))
                ],
            ),
        );

    }

}
