import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('首页内容'),
    );
  }
}

class KnowledgeBaseTab extends StatelessWidget {
  const KnowledgeBaseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('知识库内容'),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('推送内容'),
    );
  }
}

class EmailTab extends StatelessWidget {
  const EmailTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('邮件内容'),
    );
  }
}