import 'package:flutter/material.dart';
import 'package:nutrition/time.dart';
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
    getData();
  }

  void getData() async {
    items = await getNutritionData();
    getTimeInfo();
    getIndices(items);
    setState(() {
      this.items = items;
    });
  }
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
                  child: Text("  ${items[index].monday}"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                  child: Text("         ${items[index].mondayCalories}"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
