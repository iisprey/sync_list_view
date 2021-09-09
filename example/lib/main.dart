import 'package:flutter/material.dart';
import 'package:sync_list_view/sync_list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

const cats = [
  'Romance',
  'Mystery',
  'Thriller',
  'Science Fiction',
  'Fantasy',
  "Children's Book",
  'Biographies',
  'Suspense'
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SyncListView'),
      ),
      body: SyncListView(
        children: List.generate(
          cats.length,
          (index) {
            return SyncTab(
              tab: (isActive) => Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  cats[index],
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black,
                  ),
                ),
              ),
              title: Center(
                child: Text(
                  cats[index],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) => Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('$i'),
                  ),
                ),
                itemCount: 7,
              ),
            );
          },
        ),
      ),
    );
  }
}
