import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int id;
  final String text;
  final bool isCheck;

  ItemModel({
    required this.id,
    required this.text,
    required this.isCheck,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
