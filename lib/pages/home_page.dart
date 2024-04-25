import 'package:flutter/material.dart';
import 'package:journal/components/journal_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  void openDialogBox ({String? docID}) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: TextField(
        controller: textEditingController,
      ),
    ))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'N I K K I',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: tasks.getTasks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List tasksList = snapshot.data.docs;
            return ListView.builder(
              itemBuilder: (context, index) {
                DocumentSnapshot doc =  tasksList[index];
                return JournalTile(
                  data: doc['task'],)
              }
            )
          }
        }
        children: [JournalTile()],
      ),
      backgroundColor: Color.fromARGB(255, 247, 150, 182),
    );
  }
}
