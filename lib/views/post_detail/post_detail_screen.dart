import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm/models/comment_model.dart';

import '../../core/routes/app_pages.dart';
import '../../models/post_model.dart';
import '../../viewmodels/post_detail_viewmodel.dart';

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
                appBar: AppBar(
                    title: Text(widget.post.title),
                ),
                body: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12)
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
                                child: Text("Commentaires:"),
                            ),
                            SizedBox(height: 10,),
                            if(commentProvider.isLoading)...[
                                Center(
                                    child: Text("Récupération des commentaires..."),
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
                            OutlinedButton(
                                onPressed: (){
                                    //commentProvider.sendNewComment(widget.post.id);
                                    GoRouter.of(context).push(Routes.postComment, extra: widget.post);
                                },
                                child: (commentProvider.isSendLoading)
                                    ? Center(child: CircularProgressIndicator(),)
                                    : Text("New comment")
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
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(comment.email,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 4,),
                    Text(comment.body),
                    SizedBox(height: 20,),
                ],
            ),
        );

    }

}
