import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.label,
    this.hint,
    this.textEditingController,
    this.isFocused = false,
    this.textInputType = TextInputType.text,
    this.textFormatters,
    this.onChange,
    this.maxLength,
    this.maxLine,
    this.textAlign = TextAlign.left,
    this.width,
    this.height,
    this.textInputAction = TextInputAction.done,
    this.suffix,
    this.errorBorder,
    this.errorTxt,
    this.labelColor = TaskamoColors.white,
    this.focusBorder,
    this.enableBorder,
    this.obSecure = false,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextEditingController? textEditingController;
  final bool isFocused;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textFormatters;
  final void Function(String)? onChange;
  final int? maxLength;
  final int? maxLine;
  final TextAlign textAlign;
  final double? height;
  final double? width;
  final TextInputAction textInputAction;
  final Widget? suffix;
  final OutlineInputBorder? focusBorder;
  final OutlineInputBorder? enableBorder;
  final OutlineInputBorder? errorBorder;
  final String? errorTxt;
  final Color labelColor;
  final bool obSecure;
  final Color backgroundColor;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      width: widget.width,
      height: widget.height,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: widget.textEditingController,
        maxLines: widget.maxLine ?? 1,
        maxLength: widget.maxLength,
        enableSuggestions: false,
        autocorrect: false,
        textAlign: widget.textAlign,
        autofocus: widget.isFocused,
        style: Theme.of(context).textTheme.headlineSmall!.apply(
          color: TaskamoColors.white,
        ),
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        inputFormatters: widget.textFormatters,
        onChanged: widget.onChange,
        obscureText: widget.obSecure,
        decoration: InputDecoration(
          errorText: widget.errorTxt,
          errorBorder: widget.errorBorder,
          focusedErrorBorder: widget.errorBorder,
          suffixIcon: widget.suffix,
          labelText: widget.label,
          labelStyle: Theme.of(context).textTheme.headlineSmall!.apply(
                color: widget.labelColor,
              ),
          hintTextDirection: TextDirection.rtl,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelStyle: Theme.of(context).textTheme.headlineSmall!.apply(
                color: widget.labelColor,
              ),
          alignLabelWithHint: true,
          hintText: widget.hint,
          hintStyle: Theme.of(context).textTheme.headlineSmall!.apply(
                color: TaskamoColors.secondaryText,
              ),
          counterText: "",
          enabledBorder: widget.enableBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: TaskamoColors.secondaryText,
                ),
              ),
          focusedBorder: widget.focusBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: TaskamoColors.secondaryText,
                ),
              ),
        ),
      ),
    );
  }
}
