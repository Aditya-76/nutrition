import 'package:flutter/material.dart';
import 'nutrition.dart';

class NutritionScreen extends StatefulWidget {
  NutritionScreen({Key? key}) : super(key: key);

  @override
  _NutritionScreenState createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State {
  List<NutritionData> items = List<NutritionData>.empty();

  @override
  void initState() {
    super.initState();

    getNutritionData().then((items) {
      setState(() {
        this.items = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nutrition Data"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.fastfood),
                Expanded(
                  child: Text("  ${items[index].dish}"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                  child: Text("         ${items[index].calories}"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
