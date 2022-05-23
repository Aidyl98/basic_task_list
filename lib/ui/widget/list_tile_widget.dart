import 'package:basic_task_list/ui/utils/reg_exp_utils.dart';
import 'package:basic_task_list/ui/widget/tag_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  final List<String> textList;
  int email = 1;
  int link = 1;

  ListTileWidget({
    Key? key,
    required this.textList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Wrap(
        spacing: 8.0, // Gap between adjacent chips.
        runSpacing: 4.0, // Gap between lines.
        children: <Widget>[
          ...textList
              .map((tag) => _getWidget(
                    tag,
                  ))
              .toList(),
        ],
      ),
      value: false,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      onChanged: (value) {},
    );
  }

  _getWidget(String text) {
    if (RegExpUtils.isHashtag(text)) {
      return TagWidget(
        tagText: text,
        backgroundColor: Colors.purple.shade100,
        color: Colors.purple.shade600,
      );
    } else if (RegExpUtils.isMention(text)) {
      return TagWidget(
        tagText: text,
        backgroundColor: Colors.green.shade100,
        color: Colors.green.shade600,
      );
    } else if (RegExpUtils.isEmail(text)) {
      return TagWidget(
        tagText: ' Email ${email++}',
        backgroundColor: Colors.orange.shade100,
        color: Colors.orange,
        icon: Icons.email_outlined,
        showIcon: true,
      );
    } else if (RegExpUtils.isLink(text)) {
      return TagWidget(
        tagText: ' Link ${link++}',
        backgroundColor: Colors.blue.shade100,
        color: Colors.blue,
        icon: Icons.link,
        showIcon: true,
      );
    } else {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      );
    }
  }
}
