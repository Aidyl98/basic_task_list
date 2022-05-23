import 'package:basic_task_list/app_exporter.dart';
import 'package:basic_task_list/repository/repository_exporter.dart';
import 'package:dio/dio.dart';

class ItemServiceImplementation extends ItemService {
  static final Dio _dio = Dio();

  @override
  Future<List<ItemModel>> getAllItems() async {
    try {
      List<Map<String, dynamic>> allItems = [];

      // Get object info.
      var response = await _dio.get(ApiConstants.findAll);

      allItems.addAll(List<Map<String, dynamic>>.from(response.data));

      return List<ItemModel>.from(allItems.map((x) => ItemModel.fromJson(x)));
    } on DioError catch (exc) {
      if (exc.response != null) {
        if (exc.response!.statusCode == 404) {
          throw Exception("You have reached the end of the tasks.");
        } else {
          throw Exception(
              "${exc.response!.statusCode}: ${exc.response!.statusMessage}");
        }
      } else {
        throw Exception("Couldn't fetch tasks. Is the device online?");
      }
    }
  }

  @override
  void addItem(String newTask) async {
    ItemModel item = ItemModel(taskId: 0, taskDescription: newTask);

    // Post object info.
    await _dio.post(ApiConstants.addItem, data: item.toJson());
  }

  @override
  void editItem(ItemModel item, String text) async {
    // Put object info.
    ItemModel itemTask = ItemModel(taskId: item.taskId, taskDescription: text);
    await _dio.put(ApiConstants.editItem, data: itemTask.toJson());
  }
}
