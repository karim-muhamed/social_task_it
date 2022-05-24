// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TxtFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final int lines;

  const TxtFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.hint,
    required this.lines,
  }) : super(key: key);

  @override
  State<TxtFieldWidget> createState() => _TxtFieldWidgetState();
}

class _TxtFieldWidgetState extends State<TxtFieldWidget> {
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: widget.textEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          enableInteractiveSelection: true,
          focusNode: focusNode,
          maxLines: widget.lines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 0.7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 0.7)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 0.7)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 0.7)),
            hintText: widget.hint,
            hintStyle:
                TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
          ),
        ),
        SizedBox(height: size.height * 0.03),
      ],
    );
  }
}
