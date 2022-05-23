part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {
  const ItemEvent();
}

class ItemFetchEvent extends ItemEvent {
  const ItemFetchEvent();
}
