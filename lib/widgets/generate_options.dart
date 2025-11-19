import 'package:flutter/material.dart';

class GenerateOptions extends StatelessWidget {
  final String title;
  final List<int> values;
  final Function(int) onSelect;

  const GenerateOptions({super.key,
    required this.title,
    required this.values,
    required this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),),
        SizedBox(height: 8,),
        Wrap(
          spacing: 8,
          children: values
              .map(
                  (v) => ElevatedButton(
                      onPressed:()=> onSelect(v),
                      child: Text('$v'),
                  ),
          ).toList(),
        )
      ],
    );
  }
}
