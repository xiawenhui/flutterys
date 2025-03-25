import 'package:flutter/material.dart';
import 'history.dart';
import 'tabs.dart';

// Add enum definition here, outside of any class
enum AIModel { kimi, deepseek, doubao }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  
  // Remove enum definition from here and just keep the state variable
  AIModel _selectedModel = AIModel.kimi;

  final List<Widget> _pages = [
    const HomeTab(),
    const KnowledgeBaseTab(),
    const NotificationsTab(), 
    const EmailTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant'),
        leading: IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryPage()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          // 添加模型选择器
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: SegmentedButton<AIModel>(
              segments: const [
                ButtonSegment<AIModel>(
                  value: AIModel.kimi,
                  label: Text('Kimi'),
                ),
                ButtonSegment<AIModel>(
                  value: AIModel.deepseek,
                  label: Text('Deepseek'),
                ),
                ButtonSegment<AIModel>(
                  value: AIModel.doubao,
                  label: Text('豆包'),
                ),
              ],
              selected: {_selectedModel},
              onSelectionChanged: (Set<AIModel> newSelection) {
                setState(() {
                  _selectedModel = newSelection.first;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context).colorScheme.primary;
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '请输入搜索内容...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: _pages[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '知识库',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '推送',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: '邮件',
          ),
        ],
      ),
    );
  }
}