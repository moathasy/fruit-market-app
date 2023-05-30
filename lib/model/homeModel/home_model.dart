class HomeModel{
  String ? image;
  String ? name;
  String ? price;
  String ? description;

  HomeModel({
    required this.image, required this.name,required this.price, this.description
  });

  
}


// HomeModel.fromJson(Map<String,dynamic>json){
  //   image = json["image"];
  //   name =  json["name"];
  //   price = json["price"];
  // }