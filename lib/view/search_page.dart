import 'package:flutter/material.dart';
import 'package:text_highlighter/widget/text_widget.dart';
// Ensure your TextHighlighter widget is imported correctly

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  final List<String> _allItems = List.generate(100, (index) => 'Item $index');
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
    controller.addListener(_filterSearchResults);
  }

  void _filterSearchResults() {
    setState(() {
      _filteredItems = _allItems
          .where((item) =>
              item.toLowerCase().contains(controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search and Highlight')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: TextHighlighter(
                    text: _filteredItems[index],
                    textToHighlight: controller.text,
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    highlightStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
