import 'package:flutter/material.dart';
import 'package:laravel/controller/provider/saloonprovider.dart';
import 'package:laravel/controller/provider/serviceprovider.dart';
import 'package:laravel/size.dart';
import 'package:provider/provider.dart';

class Serviceswidget extends StatefulWidget {
  Serviceswidget({Key? key}) : super(key: key);

  @override
  _ServiceswidgetState createState() => _ServiceswidgetState();
}

class _ServiceswidgetState extends State<Serviceswidget> {
  @override
  Widget build(BuildContext context) {
    final servicelist = Provider.of<serviceprovider>(context).servicename;
    

    var theme = Theme.of(context);
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(servicelist.length, (i) {
          //var colorchange = servicelist[i].change;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  Provider.of<Saloonprovider>(context, listen: false)
                      .postdata(servicelist[i].id);
                 servicelist[i].change = !servicelist[i].change;
                });
                servicelist[i].change;
              },
              child: Container(
                width: SizeConfig.width! * 40,
                height: SizeConfig.height! * 5,
                decoration: BoxDecoration(
                    color: servicelist[i].change == true
                        ? theme.primaryColor
                        : null,
                    border: Border.all(width: 1, color: theme.accentColor),
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text(
                    servicelist[i].servicename,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
