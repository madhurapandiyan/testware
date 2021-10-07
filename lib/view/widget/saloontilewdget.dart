import 'package:flutter/material.dart';
import 'package:laravel/size.dart';

class Saloontile extends StatefulWidget {
  final String? url;
  final String? title;
  final String opentime;
  final String closetime;
  final String distance;
  Saloontile(
      this.url, this.title, this.opentime, this.closetime, this.distance);

  @override
  State<Saloontile> createState() => _SaloontileState();
}

class _SaloontileState extends State<Saloontile> {
  @override
  Widget build(BuildContext context) {
    var notfound =
      "https://cdn.dribbble.com/users/1281958/screenshots/4896646/media/55256acfd3d158e6be043910f87c646a.gif";
    var theme = Theme.of(context);
    SizeConfig().init(context);
    return Container(
      child: widget.url==notfound?Center(child: Text("No data Found"),):
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.bottomLeft, children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: SizeConfig.width! * 35,
              height: SizeConfig.height! * 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: SizeConfig.width! * 17,
                height: SizeConfig.height! * 2,
                //padding: EdgeInsets.all(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.primaryColor),
                child: Center(
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        size: 10,
                        color: Colors.white,
                      ),
                      label: const FittedBox(
                          child: Text(
                        "4.5",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))),
                ),
              ),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 0, bottom: 8, right: 5),
                    child: Container(
                      width: SizeConfig.width! * 35,
                      height: SizeConfig.height! * 8,
                      child: Text(
                        widget.title!,
                        style: theme.textTheme.headline1,
                        overflow: TextOverflow.clip,
                        textWidthBasis: TextWidthBasis.parent,
                        softWrap: true,
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.width! * 30,
                    height: SizeConfig.height! * 3,
                    //padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${widget.opentime} AM - ${widget.closetime} PM",
                      style: theme.textTheme.headline2,
                    ),
                  ),
                  Container(
                    width: SizeConfig.width! * 30,
                    height: SizeConfig.height! * 2,
                    child: Text("${widget.distance} KM"),
                  )
                ],
              ),
              RaisedButton(
                onPressed: () {},
                child: const Text(
                  "View",
                  style: TextStyle(color: Colors.white),
                ),
                color: theme.primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
