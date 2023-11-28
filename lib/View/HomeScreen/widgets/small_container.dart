import 'package:flutter/material.dart';

class SmallContainer extends StatefulWidget {
  final String text;
  final String image;
  final Color? textColor;
  final Color? color;
  const SmallContainer(
      {super.key,
      required this.text,
      required this.image,
      required this.textColor,
      required this.color});

  @override
  State<SmallContainer> createState() => _SmallContainerState();
}

class _SmallContainerState extends State<SmallContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: widget.color ?? Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.image),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor ?? Colors.black
          ),
        ),
      ],
    );
  }
}
