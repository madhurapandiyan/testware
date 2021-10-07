import 'package:flutter/material.dart';
import 'package:laravel/controller/provider/dataprovider.dart';
import 'package:laravel/controller/provider/saloonprovider.dart';
import 'package:laravel/controller/provider/serviceprovider.dart';
import 'package:laravel/size.dart';
import 'package:laravel/view/widget/saloontilewdget.dart';
import 'package:provider/provider.dart';

class Saloonwidget extends StatefulWidget {
  Saloonwidget({Key? key}) : super(key: key);

  @override
  _SaloonwidgetState createState() => _SaloonwidgetState();
}

class _SaloonwidgetState extends State<Saloonwidget> {
  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Saloonprovider>(context).items;

    var theme = Theme.of(context);
    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Salon",
                style: theme.textTheme.headline2,
              ),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt),
                  label: Text("Filter"))
            ],
          ),
        ),
        SingleChildScrollView(
            child: Column(
          children: List.generate(
              name.length,
              (i) => Saloontile(name[i].saloonurl, name[i].saloonname,
                  name[i].opentime!, name[i].closetime!, name[i].distance!)),
        ))
      ],
    );
  }
}
