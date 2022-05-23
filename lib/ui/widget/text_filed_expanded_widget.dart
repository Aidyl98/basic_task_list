import 'package:basic_task_list/ui/ui_exporter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class TextFieldExpandeddWidget extends StatefulWidget {
  final ExpandableController expandableController;
  const TextFieldExpandeddWidget({
    Key? key,
    required this.expandableController,
  }) : super(key: key);

  @override
  State<TextFieldExpandeddWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<TextFieldExpandeddWidget> {
  late RichTextController textFieldController;
  bool isTexting = false;

  @override
  void initState() {
    textFieldController = RichTextController(
      patternMatchMap: {
        // Returns every Hashtag with purple color
        RegExpUtils.hashtag: TextStyle(color: Colors.purple.shade600),

        // Returns every Mention with green color.
        RegExpUtils.mention: TextStyle(color: Colors.green.shade600),

        // Returns every email with orange color.
        RegExpUtils.email: const TextStyle(color: Colors.orange),

        // Returns every link with blue color.
        RegExpUtils.link: const TextStyle(color: Colors.blue),
      },
      onMatch: (List<String> matches) {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final showIcons = size.width < 600;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  if (text.isEmpty) {
                    isTexting = false;
                  } else {
                    isTexting = true;
                  }
                });
              },
              controller: textFieldController,
              maxLines: null,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.blue,
                ),
                suffixIcon: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.fill,
                      image: const AssetImage("assets/my_picture.png"),
                      color: isTexting ? null : Colors.grey.withOpacity(0.4),
                      colorBlendMode: isTexting ? null : BlendMode.modulate,
                    ),
                  ),
                ),
                hintText: 'Type to add new task',
                border: InputBorder.none,
              ),
              autofocus: true,
            ),
            Divider(
              color: Colors.blueGrey.shade100,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonListWidget(isDisabled: !isTexting),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Collapses when tapped on
                    showIcons
                        ? const SizedBox(width: 1)
                        : ElevatedButton(
                            onPressed: () {
                              widget.expandableController.toggle();
                            },
                            child: const Text("Cancel"),
                          ),
                    SizedBox(
                        width: showIcons ? size.width / 150 : size.width / 100),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith<
                            EdgeInsetsGeometry?>((s) {
                          if (showIcons) {
                            return EdgeInsets.zero;
                          } // Disabled button color
                          return null; // Enabled button color
                        }),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>((s) {
                          if (s.contains(MaterialState.disabled)) {
                            return Colors.grey;
                          } // Disabled button color
                          return Colors.indigo; // Enabled button color
                        }),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color?>((s) {
                          if (s.contains(MaterialState.disabled)) {
                            return Colors.grey;
                          } // Disabled button color
                          return Colors.white; // Enabled button color
                        }),
                      ),
                      onPressed: () {
                        if (widget.expandableController.expanded) {
                          widget.expandableController.toggle();
                        }
                      },
                      child: showIcons
                          ? Icon(
                              isTexting ? Icons.add : Icons.close,
                              size: size.width / 15,
                            )
                          : isTexting
                              ? const Text("Add")
                              : const Text("Ok"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
