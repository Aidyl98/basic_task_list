import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableWidget extends StatelessWidget {
  final ExpandableController expandableController;
  final Widget collapsed;
  final Widget expanded;

  const ExpandableWidget({
    Key? key,
    required this.expandableController,
    required this.collapsed,
    required this.expanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: expandableController,
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToExpand: true,
          ),
          collapsed: collapsed,
          expanded: expanded,
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(crossFadePoint: 0),
            );
          },
        ),
      ),
    );
  }
}
