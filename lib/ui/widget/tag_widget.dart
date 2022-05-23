import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final double borderRadius;
  final String tagText;
  final double? size;
  final IconData? icon;
  final bool showIcon;

  const TagWidget({
    Key? key,
    this.backgroundColor = Colors.green,
    this.color = Colors.green,
    this.borderRadius = 20,
    required this.tagText,
    this.icon,
    this.size = 20,
    this.showIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: 2.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: Colors.grey,
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              showIcon
                  ? Icon(
                      icon,
                      color: color,
                      size: size,
                    )
                  : const SizedBox(),
              Text(
                tagText,
                style: TextStyle(
                  color: color,
                  fontSize: size,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
