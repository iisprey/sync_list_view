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
          10,
          (index) {
            return SyncTab(
              tab: (isActive) => Container(
                color: isActive ? Colors.green : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Text('$index'),
              ),
              title: Center(
                  child: Text(
                'TITLE: $index',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) => Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('$i'),
                  ),
                ),
                itemCount: 5,
              ),
            );
          },
        ),
      ),
    );
  }
}
