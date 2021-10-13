import 'package:flutter/material.dart';
import 'item_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansion Panel Widget')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: itemData.length,
        itemBuilder: (context, index) => ExpansionPanelList(
          animationDuration: Duration(milliseconds: 1000),
          elevation: 2,
          expandedHeaderPadding: const EdgeInsets.all(10.0),
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              itemData[index].expanded = !itemData[index].expanded!;
            });
          },
          children: <ExpansionPanel>[
            ExpansionPanel(
              headerBuilder: (context, isExpanded) => Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  itemData[index].headerItem!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: itemData[index].colorItem!,
                  ),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  itemData[index].description!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              isExpanded: itemData[index].expanded!,
              canTapOnHeader: true,
            ),
          ],
        ),
      ),
    );
  }
}

final List<ItemModel> itemData = <ItemModel>[
  ItemModel(
    expanded: false,
    headerItem: 'Flutter',
    description: itemDescription,
    colorItem: Colors.lightBlue,
  ),
  ItemModel(
    expanded: false,
    headerItem: 'Java',
    description: itemDescription,
    colorItem: Colors.redAccent,
  ),
  ItemModel(
    expanded: false,
    headerItem: 'Python',
    description: itemDescription,
    colorItem: Colors.yellow,
  ),
];

const String itemDescription =
    'Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.';
