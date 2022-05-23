// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int taskId;
  final String taskDescription;

  ItemModel({
    required this.taskId,
    required this.taskDescription,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
