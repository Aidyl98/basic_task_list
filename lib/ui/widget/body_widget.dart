import 'package:basic_task_list/app_exporter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ItemModel> items = [];
    final Size size = MediaQuery.of(context).size;
    final expandableController = ExpandableController(
      initialExpanded: false,
    );

    return BlocConsumer<ItemBloc, ItemState>(
      listener: (context, itemState) {
        // Loading Data.
        if (itemState is ItemLoadingState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: WidgetUtils.buildInfoText(
                text: itemState.message,
                context: context,
                size: size,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
          );
          // Get Data, end of the list.
        } else if (itemState is ItemSuccessState && itemState.item.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: WidgetUtils.buildInfoText(
                text: 'No more characters',
                context: context,
                size: size,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
          );
          // Get Data Error.
        } else if (itemState is ItemErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: WidgetUtils.buildInfoText(
                text: itemState.error,
                context: context,
                size: size,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
          );
        }
        return;
      },
      builder: (context, itemState) {
        // Loading Data
        if (itemState is ItemInitial ||
            itemState is ItemLoadingState && items.isEmpty) {
          return WidgetUtils.buildCircularProgressIndicator(context);
          // Add the fetched data to the list.
        } else if (itemState is ItemSuccessState) {
          items.clear();
          items.addAll(itemState.item);
          ScaffoldMessenger.of(context).clearSnackBars();
          // Error View.
        } else if (itemState is ItemErrorState && items.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Reload recuest.
              IconButton(
                iconSize: size.width / 5,
                color: Theme.of(context).colorScheme.secondary,
                splashColor: Theme.of(context).colorScheme.background,
                tooltip: "Try to fetch the data.",
                onPressed: () {
                  BlocProvider.of<ItemBloc>(context).fetch();
                },
                icon: const Icon(
                  Icons.refresh,
                ),
              ),
              // Show text error.
              const SizedBox(height: 15),
              WidgetUtils.buildInfoText(
                text: itemState.error,
                context: context,
                size: size,
                textAlign: TextAlign.center,
              ),
            ],
          );
        }
        return SingleChildScrollView(
          child: ExpandableNotifier(
            controller: expandableController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                    ),
                    collapsed: const TextFieldCollapsedWidget(),
                    expanded: TextFieldExpandeddWidget(
                      expandableController: expandableController,
                      functionCreate: (text) =>
                          BlocProvider.of<ItemBloc>(context).create(text),
                    ),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                  ),
                ),
                Column(
                  children: List.generate(
                    items.length,
                    (index) => ListTileWidget(
                        textList: items[index].taskDescription.split(" ")),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
