// ignore_for_file: depend_on_referenced_packages

import 'package:basic_task_list/app_exporter.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemService itemRepository;
  bool isFetching = false;
  ItemBloc({
    required this.itemRepository,
  }) : super(ItemInitial());

  void fetch() {
    isFetching = true;
    add(const ItemFetchEvent());
  }

  void create(String task) {
    add(
      ItemCreateEvet(task),
    );
    fetch();
  }

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is ItemFetchEvent) {
      try {
        yield ItemLoadingState(message: 'Loading Characters');
        isFetching = true;
        final response = await itemRepository.getAllItems();
        isFetching = false;
        yield ItemSuccessState(
          item: response.toList(),
        );
      } on Exception catch (exc) {
        isFetching = false;
        yield ItemErrorState(
          error: exc.toString().replaceAll("Exception: ", ""),
        );
      }
    }
    if (event is ItemCreateEvet) {
      itemRepository.addItem(event.task);
    }
  }
}
