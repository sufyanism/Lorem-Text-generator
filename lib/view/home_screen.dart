import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lorem_generator/view_model/lorem_model.dart';
import 'package:lorem_generator/widgets/generate_options.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lorem = ref.watch(loremViewModelProvider);
    final viewModel = ref.read(loremViewModelProvider.notifier);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Lorem Generator'),
        actions: [
          IconButton(
              onPressed: viewModel.clear,
              icon: Icon(Icons.delete_rounded))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GenerateOptions(
                  title: 'Generate by words',
                  values: [20,50,100],
                  onSelect: (count) => viewModel.generateWords(count)),
              SizedBox(height: 16,),
              GenerateOptions(
                  title: 'Generate by paragraphs',
                  values: [1,3,5],
                  onSelect: (count) => viewModel.generateParagraphs(count)),
              SizedBox(height: 24,),
              
              if(lorem.text.isNotEmpty)...[
                Container(
                  width: double.infinity,
                    padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Text(lorem.text,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4
                  ),),
                ),
                SizedBox(height: 16,),
                Center(
                  child: ElevatedButton.icon(
                      onPressed:() {
                        FlutterClipboard.copy(lorem.text);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied to clipboard')));
                    
                  }, icon: Icon(Icons.copy),
                  label: Text('copy text'),),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
