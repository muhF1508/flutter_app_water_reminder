import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_water_reminder/models/drink.dart';
import 'package:flutter_app_water_reminder/src/global_blocs/app_bloc.dart';
import 'package:flutter_app_water_reminder/src/widgets/buttons/circle_water_button.dart';
import 'package:flutter_app_water_reminder/src/widgets/water_entry_tile.dart';
import 'package:flutter_app_water_reminder/src/widgets/water_today_label.dart';

class DrinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drinkBloc = Provider.of<AppBloc>(context).drinkBloc;
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WaterTodayLabel(),
              CircleButton(),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: StreamBuilder<List<Drink>>(
            stream: drinkBloc.outDrinks,
            initialData: [],
            builder: (context, snapshot) {
              final drinks = snapshot.data;
              return ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  final drink = drinks[index];
                  return WaterEntryTile(drink: drink);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}