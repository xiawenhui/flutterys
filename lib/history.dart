import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('历史记录'),
      ),
      body: ListView.builder(
        itemCount: 10, // 示例数据
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text('搜索记录 ${index + 1}'),
            subtitle: Text('2024-01-${index + 1}'),
            onTap: () {
              // 处理点击事件
            },
          );
        },
      ),
    );
  }
}