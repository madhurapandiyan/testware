import 'package:flutter/material.dart';
import 'package:laravel/controller/provider/dataprovider.dart';
import 'package:laravel/controller/provider/saloonprovider.dart';

import 'package:laravel/controller/provider/serviceprovider.dart';
import 'package:laravel/view/widget/saloonwidget.dart';
import 'package:laravel/view/widget/serviceswidget.dart';
import 'package:provider/provider.dart';
import '../widget/carousalwidget.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var isinit = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (isinit) {
      super.didChangeDependencies();
      Provider.of<serviceprovider>(context).gettingdata();
      Provider.of<Dataprovider>(context).gettingdata();
      Provider.of<Saloonprovider>(context, listen: false).gettingdata().then(
          (_) =>
              Provider.of<Saloonprovider>(context, listen: false).getalldata());
    }

    isinit = false;
  }

  BottomNavigationBarItem items(IconData ico, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          ico,
          color: Colors.black,
        ),
       label: label);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Provider.of<Saloonprovider>(context, listen: false)
                    .getalldata();
              },
              icon: Icon(
                Icons.menu,
                color: theme.accentColor,
              )),
          title: Center(
            child: Text(
              "Top Salon",
              style: theme.textTheme.headline1,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<Saloonprovider>(context, listen: false)
                      .getalldata();
                },
                icon: Icon(
                  Icons.search,
                  color: theme.accentColor,
                ))
          ],
        ),
        body: isinit == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () {
                  return Provider.of<Saloonprovider>(context, listen: false)
                      .getalldata();
                },
                child: SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Provider.of<Saloonprovider>(context).getalldata();
                    },
                    child: Column(
                      children: [
                        CarousalWidget(),
                        Serviceswidget(),
                        Saloonwidget()
                      ],
                    ),
                  ),
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          //showSelectedLabels: true,
          //selectedItemColor: Colors.pink,
          items: [
            items(Icons.home, "Home"),
            items(Icons.near_me, "Near by"),
            items(Icons.shopping_bag_outlined, "Products"),
            items(Icons.shopping_cart, "Cart"),
            items(Icons.manage_accounts, "Proile")
          ],
        ),
      ),
    );
  }
}
