import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/app_button.dart';
import '../shared/app_header.dart';
import '../shared/app_input_text.dart';

class NewPostScreen extends ConsumerWidget {

    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController titleController = TextEditingController(text: '');
    TextEditingController bodyController = TextEditingController(text: '');
    
    @override
    Widget build(BuildContext context, WidgetRef ref) {
        // TODO: implement build
        return Scaffold(
            appBar: AppHeader(titlePage: "Add new post"),
            body: Container(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                            SizedBox(height: 10),
                            Container(
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                children: [
                                    Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 15), child: AppInputText(controller: emailController, hintText: "your@email.com")),
                                    Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 5), child: AppInputText(controller: titleController, hintText: "Title")),
                                    Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 15), child: AppInputText(controller: bodyController, hintText: "Write your comment here...", max: 3)),
                                    SizedBox(height: 10),
                                    AppButton(
                                    onPressed: () {
                                        //commentPost.formSendCheck(context: context, idPost: post.id, emailController: emailController, titleController: titleController, bodyController: bodyController);
                                    },
                                    title: "Publish",
                                    ),
                                    SizedBox(height: 15),
                                ],
                                ),
                            ),

                            SizedBox(height: 10),
                        ],
                    ),
                ),
            ),
        );
    }
    
}