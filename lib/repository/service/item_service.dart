import 'package:basic_task_list/repository/repository_exporter.dart';

abstract class ItemService {
  Future<List<ItemModel>> getAllItems();
  void addItem(String newTask);
}
