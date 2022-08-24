class GeneralData {

  String? id;
  String? name;
  String? description;
  String? imageUrl;


  GeneralData(this.id, this.name, this.description, this.imageUrl);

  GeneralData.fromJson(Map<String, dynamic> json) {

    id = json['productId']; //todo
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}