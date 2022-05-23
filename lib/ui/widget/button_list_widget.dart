import 'package:flutter/material.dart';

class ButtonListWidget extends StatelessWidget {
  final bool isDisabled;
  const ButtonListWidget({
    Key? key,
    required this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final showIcons = size.width < 600;
    final iconSize = showIcons ? size.width / 15 : size.width / 37;
    final boxSize = showIcons ? size.width / 150 : size.width / 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        showIcons
            ? ElevatedButton(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Open" button press.
                      },
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                          (s) {
                    if (showIcons) {
                      return EdgeInsets.zero;
                    } // Disabled button color
                    return null; // Enabled button color
                  }),
                ),
                child: Icon(
                  Icons.open_in_full_sharp,
                  size: iconSize,
                ),
              )
            : ElevatedButton.icon(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Open" button press.
                      },
                icon: Icon(
                  Icons.open_in_full_sharp,
                  size: iconSize,
                ),
                label: const Text("Open"),
              ),
        SizedBox(width: boxSize),
        showIcons
            ? IconButton(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Open" button press.
                      },
                icon: Icon(
                  Icons.calendar_today,
                  size: iconSize,
                ),
                padding: EdgeInsets.zero,
              )
            : OutlinedButton.icon(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Today" button press.
                      },
                icon: Icon(
                  Icons.calendar_today,
                  size: iconSize,
                ),
                label: const Text("Today"),
              ),
        SizedBox(width: boxSize),
        showIcons
            ? IconButton(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Open" button press.
                      },
                icon: Icon(
                  Icons.lock_open_sharp,
                  size: iconSize,
                ),
                padding: EdgeInsets.zero,
              )
            : OutlinedButton.icon(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Today" button press.
                      },
                icon: Icon(
                  Icons.lock_open_sharp,
                  size: iconSize,
                ),
                label: const Text("Public"),
              ),
        SizedBox(width: boxSize),
        showIcons
            ? IconButton(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Open" button press.
                      },
                icon: Icon(
                  Icons.wb_sunny_outlined,
                  size: iconSize,
                ),
                padding: EdgeInsets.zero,
              )
            : OutlinedButton.icon(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Normal" button press.
                      },
                icon: Icon(
                  Icons.wb_sunny_outlined,
                  size: iconSize,
                ),
                label: const Text("Normal"),
              ),
        SizedBox(width: boxSize),
        showIcons
            ? IconButton(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Open" button press.
                      },
                icon: Icon(
                  Icons.circle,
                  size: iconSize,
                ),
                padding: EdgeInsets.zero,
              )
            : OutlinedButton.icon(
                onPressed: isDisabled
                    ? null
                    : () {
                        //TODO: Respond to "Estimation" button press.
                      },
                icon: Icon(
                  Icons.circle,
                  size: iconSize,
                ),
                label: const Text("Estimation"),
              ),
      ],
    );
  }
}
