import 'package:equatable/equatable.dart';

class CommentModel extends Equatable
{

    final int id;
    final int postId;
    final String name;
    final String body;
    final String email;

    const CommentModel({ required this.id,required this.postId,required this.name,required this.body,required this.email });

    factory CommentModel.fromJson(Map<String, dynamic> json)
    {
        return CommentModel(
            id: json['id'], 
            postId: json['postId'], 
            name: json['name'], 
            body: json['body'], 
            email: json['email']
        );
    }

    Map<String,dynamic> toMap()
    {
        return {
            'id' : id,
            'postId' : postId,
            'name' : name,
            'body' : body,
            'email' : email
        };
    }

    CommentModel copyWith(Map<String, dynamic> json)
    {
        return CommentModel(
            id: json['id'] ?? id, 
            postId: json['postId'] ?? postId, 
            name: json['name'] ?? name, 
            body: json['body'] ?? body, 
            email: json['email'] ?? email
        );
    }
    
    @override
    // TODO: implement props
    List<Object?> get props => [id,postId,name,body,email];

}