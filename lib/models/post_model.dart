import 'package:equatable/equatable.dart';

class PostModel extends Equatable
{

  final int id;
  //final int userId;
  final String title;
  final String body;

  PostModel({required this.id,  required this.title, required this.body});

  factory PostModel.fromJson(Map<String,dynamic> json){
    return PostModel(
        id: json['id'],
        //userId: json['user_id'],
        title: json['title'],
        body: json['body']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      //'user_id' : userId,
      'title' : title,
      'body' : body
    };
  }

  PostModel copyWith(Map<String,dynamic> json)
  {
    return PostModel(
        id: json['id'] ?? id,
        //userId: json['user_id'] ?? userId,
        title: json['title'] ?? title,
        body: json['body'] ?? body
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,body];

}