import 'package:flutter/material.dart';

typedef ValidateFun = String? Function(String? value)?;

class CustomsTextFeild extends StatefulWidget {
  const CustomsTextFeild({
    super.key,
    required this.textInputType,
    required this.focusNode,
    this.labelText = '',
    required this.controller,
    this.autoFocus = false,
    this.width = 300,
    this.obscureText = false,
    this.borderRadius = 8,
    this.borderColor = Colors.tealAccent,
    this.hintText,
    this.prefix,
    this.suffix,
    this.validator,
    
    // this.onSuffixTap,
  });

  final double width;
  final TextInputType textInputType;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool autoFocus;
  final bool obscureText;
  final double borderRadius;
  final Color? borderColor;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;

  final String labelText;
  final ValidateFun? validator;
 

  // final voidFunction? onSuffixTap;

  static const imgCloud = "assets/images/clouds.png";

  @override
  State<CustomsTextFeild> createState() => _CustomsTextFeildState();
}

class _CustomsTextFeildState extends State<CustomsTextFeild> {
  bool isReadable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: widget.width,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 48),
          child: TextFormField(
            validator: widget.validator,
            obscureText: widget.obscureText,
            obscuringCharacter: '*',
            autofocus: widget.autoFocus,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            readOnly: isReadable,
            onTap: () {
              FocusScope.of(context).requestFocus(widget.focusNode);
            },
            decoration: InputDecoration(
              errorMaxLines: 3,
              prefix: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(child: widget.prefix),
              ),
              suffixIcon: widget.suffix,
              hintText: widget.hintText,
            labelText: widget.labelText,
              fillColor: Colors.tealAccent.shade100,
              focusColor: widget.borderColor,
              hoverColor: widget.borderColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                gapPadding: 10,
                borderSide: BorderSide(
                  color: Colors.tealAccent.shade100,
                  width: 5,
                ),
              ),
            ),
            onFieldSubmitted: (value) {
              isReadable = true;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

class TextLablel extends StatelessWidget {
  const TextLablel({super.key, required this.text, required this.path});
  final String text;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(80, 239, 242, 246),
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: FittedBox(
            child: Row(
          children: [
            Image(
              image: AssetImage(
                path,
              ),
              height: 16,
            ),
            const SizedBox(
              width: 2.5,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(180, 5, 5, 5),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}
