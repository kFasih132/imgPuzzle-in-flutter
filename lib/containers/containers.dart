import 'package:flutter/material.dart';

const String blueImg = 'assets/images/download.jpg';
typedef VoidFunction = void Function()?;

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.offset,
    // this  must be an asset image....
    required this.assetName,
    required this.onTap,
    required this.flex,
    required this.opacity,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
  });
  final Radius bottomLeft;
  final Radius bottomRight;
  final Radius topLeft;
  final Radius topRight;
  final String assetName;

  final Offset offset;
  final int flex;
  final VoidFunction onTap;
  final double opacity;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isBlank = false;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (widget.assetName == blueImg) {
        isBlank = true;
      } else {
        isBlank = false;
      }
    });
    return Expanded(
      flex: widget.flex,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Opacity(
          opacity: widget.opacity,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: widget.bottomLeft,
                    bottomRight: widget.bottomRight,
                    topLeft: widget.topLeft,
                    topRight: widget.topRight),
                boxShadow: [
                  BoxShadow(
                      offset: widget.offset,
                      blurRadius: 3,
                      spreadRadius: 2,
                      color: Color.fromARGB(180, 103, 128, 8))
                ],
                image: DecorationImage(
                    image: AssetImage(widget.assetName), fit: BoxFit.fill),
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
