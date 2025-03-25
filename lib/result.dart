import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Music'),
        backgroundColor: Colors.purple[600],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Image.network(
            'https://picsum.photos/800/400',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            '音乐生成完成！',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}