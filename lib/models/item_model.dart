class ItemModel {
  ItemModel({
    required this.image,
    required this.name,
    required this.date,
    required this.capacity,
    required this.path,
    required this.type,
  });

  late String image;
  late String name;
  late String date;
  late String capacity;
  late String path;
  late String type;



  ItemModel.fromMap(Map<String,dynamic> data) {
    image = data["image"];
    name = data["name"];
    date = data["date"];
    capacity = data["capacity"];
    path = data["path"];
    type = data["type"];
  }



  Map<String, dynamic> toJson() => {
    "image":image,
    "name":name,
    "date":date,
    "capacity": capacity,
    "path":path,
    "type":type,
  };

}

