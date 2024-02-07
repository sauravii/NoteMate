import 'package:flutter/material.dart';
import 'package:note_mate/utils/constants/colors.dart';
import 'package:note_mate/utils/theme/custom_themes/text_themes.dart';
import 'package:note_mate/utils/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NoteMateColors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Notes", style: NoteMateTextTheme.lightTextTheme.headlineLarge),
        centerTitle: true,
        backgroundColor: NoteMateColors.white,
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/img-profile.png'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.0, // Adjust the size as needed
              child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                  );
                },
                suggestionsBuilder: (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Recent Notes",
              style: NoteMateTextTheme.lightTextTheme.headlineMedium,
            ),
            SizedBox(height: 16.0),
            buildNoteGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: NoteMateColors.cardNotes,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.notes),
              onPressed: () {
                _navigateToPage("All notes");
              },
            ),
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                _navigateToPage("Favourite");
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _navigateToPage("Trash");
              },
            ),
            IconButton(
              icon: Icon(Icons.create),
              onPressed: () {
                _navigateToPage("Create note");
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlankPage(category: category),
      ),
    );
  }

  Widget buildNoteGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return buildNoteCard(
          "Tugas ${index + 1}",
          "Laporan B.Indo MTK.",
          "2022-02-0${index + 1}",
        );
      },
    );
  }

  Widget buildNoteCard(String title, String content, String date) {
    return Card(
      elevation: 3.0,
      color: NoteMateColors.cardNotes,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: NoteMateTextTheme.lightTextTheme.headlineMedium,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isLoved ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      isLoved = !isLoved;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              style: NoteMateTextTheme.lightTextTheme.bodyMedium,
            ),
            SizedBox(height: 8.0),
            Text(
              "Created on: $date",
              style: NoteMateTextTheme.lightTextTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  final String category;

  const BlankPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text("This is a blank page for $category"),
      ),
    );
  }
}
