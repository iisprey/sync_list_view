# SyncListView

A ListView that allows you to sync tabs with contents

## Screenshot


## Basic Usage
```dart
SyncListView(
        children: List.generate(
          10,
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
                  '$index',
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.white,
                  ),
                ),
              ),
              title: Center(
                child: Text(
                  'TITLE: $index',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) => Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('$i'),
                  ),
                ),
                itemCount: 10,
              ),
            );
          },
        ),
      ),
```

class SyncTab {
  final Widget Function(bool isActive) tab;
  final Widget title;
  final ScrollView body;

  SyncTab({
    required this.tab,
    required this.title,
    required this.body,
  }) : assert(body.shrinkWrap && body.physics is NeverScrollableScrollPhysics);
}
