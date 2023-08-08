import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _selectedBrandModel = "car";
  late int _selectedYear;
  late int _kmDriven;
  late String _title;
  late String _description;

  final List<String> _brandModels = [
    'Brand 1',
    'Brand 2',
    'Brand 3'
  ]; // Replace with your brand/model options

  void _submitForm() {
    print('Brand/Model: $_selectedBrandModel');
    print('Year: $_selectedYear');
    print('Kilometers Driven: $_kmDriven');
    print('Title: $_title');
    print('Description: $_description');
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Perform form submission logic or data processing here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // DropdownButtonFormField<String>(
          //   value: _selectedBrandModel,
          //   items: _brandModels.map((brandModel) {
          //     return DropdownMenuItem<String>(
          //       value: brandModel,
          //       child: Text(brandModel),
          //     );
          //   }).toList(),
          //   onChanged: (value) {
          //     setState(() {
          //       _selectedBrandModel = value!;
          //     });
          //   },
          //   validator: (value) {
          //     if (value == null) {
          //       return 'Please select a brand/model';
          //     }
          //     return null;
          //   },
          //   decoration: const InputDecoration(
          //     labelText: 'Brand or Model',
          //   ),
          // ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Year'),
            validator: (value) {
              if (value == null) {
                return 'Please enter the year';
              }
              // Add additional validation if needed
              return null;
            },
            onSaved: (value) {
              print("year $value");
              _selectedYear = int.parse(value!);
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Kilometers Driven'),
            validator: (value) {
              print("km $value");
              if (value == null) {
                return 'Please enter the kilometers driven';
              }
              // Add additional validation if needed
              return null;
            },
            onSaved: (value) {
              _kmDriven = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Title'),
            validator: (value) {
              print("title $value");
              if (value == null) {
                return 'Please enter a title';
              }
              // Add additional validation if needed
              return null;
            },
            onSaved: (value) {
              _title = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (value) {
              print("desc $value");
              if (value == null) {
                return 'Please enter a description';
              }
              // Add additional validation if needed
              return null;
            },
            onSaved: (value) {
              _description = value!;
            },
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
