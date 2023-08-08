import 'package:flutter/material.dart';
import 'package:resellify/src/common_widgets/textFieldType.dart';

class CustomTextField extends StatelessWidget {
  // final InputTypeDto constraints;
  final InputTypeEnum type;
  final int? maxlength;
  final int? minlength;
  final bool? canHaveCapital;
  final bool? canHaveSmall;
  final bool? canHaveSpecial;
  final bool? isRequired;
  final bool? isDesciption;
  final int? max;
  final int? min;
  final bool? canNegititve;
  final String initialValue;
  final String labelText;
  final String? hintText;
  final String? errorText;
  final String? textColor;
  final double? labelFontSize;
  final num? labelFontWeight;
  final num? fontSize;
  final num? fontWeight;
  final double? contentPadding;
  final double? borderRadious;
  final void Function(Map<String, dynamic>)? onSubmitted;

  const CustomTextField({
    this.maxlength,
    this.minlength,
    this.canHaveCapital,
    this.canHaveSmall,
    this.canHaveSpecial,
    this.isRequired,
    this.max,
    this.min,
    this.canNegititve,
    required this.type,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    required this.onSubmitted,
    this.textColor,
    this.labelFontSize,
    this.labelFontWeight,
    this.fontSize,
    this.fontWeight,
    this.borderRadious,
    this.contentPadding,
    super.key,
    this.isDesciption,
  });

  @override
  Widget build(BuildContext context) {
    print("isDesciption=> $isDesciption");
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(bottom: (isDesciption == true) ? 10 : 1),
            width: double.infinity,
            child: Row(
              // label + required icon
              children: [
                Text(
                  labelText,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                (isRequired == true)
                    ? const Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          TextFormField(
            maxLines: (isDesciption == true) ? 5 : 1,
            onChanged: (value) => {},
            onSaved: (newValue) {
              print("entered value => $newValue");
              onSubmitted!({
                "data": newValue,
                "error": "error is their",
              });
            },
            validator: (value) {
              if (isRequired == true) {
                String result = validateValue(value, {
                  "type": type,
                  "maxlength": maxlength,
                  "minlength": minlength,
                  "max": max,
                  "min": min,
                  "canNegititve": canNegititve
                });
                if (result != "") return result;
              }
            },
            onFieldSubmitted: (value) {
              print("onFieldSubmitted");
            },
            onTapOutside: (value) => {
              print("tap outside"),
            },
            initialValue: initialValue ?? "",
            style: const TextStyle(fontSize: 18, color: Colors.black54),
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadious ?? 5)),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: labelFontSize ?? 16,
              ),
              contentPadding: EdgeInsets.all(contentPadding ?? 5),
            ),
          ),
        ],
      ),
    );
  }
}
