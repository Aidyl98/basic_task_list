part of 'item_bloc.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoadingState extends ItemState {
  final String message;

  ItemLoadingState({
    required this.message,
  });
}

class ItemSuccessState extends ItemState {
  final List<ItemModel> item;

  ItemSuccessState({
    required this.item,
  });
}

class ItemErrorState extends ItemState {
  final String error;

  ItemErrorState({
    required this.error,
  });
}
