import 'package:basic_task_list/ui/widget/widget_exporter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expandableController = ExpandableController(
      initialExpanded: false,
    );

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
            _buildList(),
          ],
        ),
      ),
    );
  }

  _buildList() {
    return Column(
      children: List.generate(
        5,
        (index) => ListTileWidget(
            textList:
                "Tomar cafe con @Jessica #Developer cuyo correo es jgarcia@gmail.com visitar para mas información www.google.com o tambien www.google.com"
                    .split(" ")),
      ),
    );
  }
}
