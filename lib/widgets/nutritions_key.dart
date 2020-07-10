import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/nutrition_list.dart';

class NutritionKey extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final nutriList  = Provider.of<NutritionList>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Keys'),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: nutriList.nutritionList.map((nutri) {
              return ListTile(
                leading: CircleAvatar(backgroundColor: nutri.color,),
                title: Text(nutri.title),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}


