import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../model/lorem_model.dart';

final loremViewModelProvider =
StateNotifierProvider<LoremViewModel, LoremModel>((ref) {
  return LoremViewModel();
});

class LoremViewModel extends StateNotifier<LoremModel> {
  LoremViewModel() : super(LoremModel(text: ''));

  static const List<String> _words = [
    'lorem', 'ipsum', 'dolor', 'sit', 'amet',
    'consectetur', 'adipiscing', 'elit', 'sed',
    'do', 'eiusmod', 'tempor', 'incididunt',
    'ut', 'labore', 'et', 'dolore', 'magna',
    'aliqua', 'ut', 'enim', 'ad', 'minim',
    'veniam', 'quis', 'nostrud', 'exercitation'
  ];

  final _rand = Random();

  void generateWords(int count) {
    final words = List.generate(
      count,
          (_) => _words[_rand.nextInt(_words.length)],
    ).join(' ');
    state = LoremModel(text: '${words[0].toUpperCase()}${words.substring(1)}.');
  }

  void generateParagraphs(int count){
    List<String> paragraphs = [];
    for(int i =0; i < count; i++){
      final words = List.generate(80+_rand.nextInt(40), (_)=> _words[_rand.nextInt(_words.length)],
      ).join('');
      paragraphs.add('${words[0].toUpperCase()}${words.substring(1)}.');
    }
    state = LoremModel(text: paragraphs.join('\n\n')
    );
  }

  void clear(){
    state = LoremModel(text: '');
  }

}