import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:resellify/ReusableWidget/textFieldType.dart';

class customDropDownField extends StatelessWidget {
  final String labelText;
  final bool? isRequired;
  final List<String> option;
  final String selectedOption;
  const customDropDownField({
    super.key,
    required this.labelText,
    this.isRequired,
    required this.option,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            width: double.infinity,
            child: Row(
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
          DropdownButtonFormField<String>(
            value: selectedOption,
            items: option.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            validator: (value) {
              if (isRequired == true) {
                String result = validateValue(value, {});
                if (result != "") return result;
              }
            },
            onChanged: (String? value) {
              print(value);
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
