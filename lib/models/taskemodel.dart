class TaskModel{

  String id;
  String title;
  String description;
  int date;
  bool  isDone;

  TaskModel({ this.id="", required this.title,required this.description,required this.date, this.isDone=false});

  TaskModel.fromejson(Map<String,dynamic> json):this(
       id:json['id'],
    title:json['title'],
    description:json['description'],
    date:json['date'],
    isDone:json['isDone']
    );

    Map<String,dynamic> tojson(){
return {
  "id":id,
  "date":date,
  "title":title,
  "description":description,
  "isDone":isDone,

};
    }

}