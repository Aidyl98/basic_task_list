part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {
  const ItemEvent();
}

class ItemFetchEvent extends ItemEvent {
  const ItemFetchEvent();
}

class ItemCreateEvet extends ItemEvent {
  final String task;
  const ItemCreateEvet(this.task);
}
