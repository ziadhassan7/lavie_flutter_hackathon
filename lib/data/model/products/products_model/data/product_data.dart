import 'package:la_vie_web/data/model/common_models/general_data.dart';
import 'nested/plant.dart';
import 'nested/seed.dart';
import 'nested/tool.dart';

class ProductData extends GeneralData{

  String? type;
  int? price;
  bool? available;
  Plant? plant;
  Seed? seed;
  Tool? tool;

  ProductData(
  {id,
  name,
  description,
  imageUrl,
  this.type,
  this.price,
  this.available,
  this.plant,
  this.seed,
  this.tool}) : super(id, name, description, imageUrl);


  ProductData.fromJson(Map<String, dynamic> json) : super.fromJson (json)

  {

  type = json['type'];
  price = json['price'];
  available = json['available'];
  plant = json['plant'] != null ? Plant.fromJson(json['plant']) : null;
  seed = json['seed'] != null ? Seed.fromJson(json['seed']) : null;
  tool = json['tool'] != null ? Tool.fromJson(json['tool']) : null;
  }


}