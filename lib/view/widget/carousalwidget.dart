import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:laravel/controller/provider/dataprovider.dart';
import 'package:laravel/size.dart';
import 'package:provider/provider.dart';

class CarousalWidget extends StatefulWidget {
  CarousalWidget({Key? key}) : super(key: key);

  @override
  State<CarousalWidget> createState() => _CarousalWidgetState();
}

class _CarousalWidgetState extends State<CarousalWidget> {

  int changecolor = 0;

  @override
  Widget build(BuildContext context) {
    final img = Provider.of<Dataprovider>(context).carousal;

    var theme = Theme.of(context);
    SizeConfig().init(context);
   

    return Container(
      //width: SizeConfig.width! * 100,
      height: SizeConfig.height! * 30,
      margin: const EdgeInsets.only(top: 2,right: 2,left: 2),
      child: Column(
        children: [
          CarouselSlider(
            items:List.generate(img.length, (index) => Image.network(img[index])),
            options: CarouselOptions(
                onPageChanged: (index, _) {
                  setState(() {
                    changecolor = index;
                  });
                },
                autoPlay: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 5,
                backgroundColor:
                    changecolor == 0 ? theme.primaryColor : Colors.grey[350],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      changecolor == 1 ? theme.primaryColor : Colors.grey[350],
                ),
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor:
                    changecolor == 2 ? theme.primaryColor : Colors.grey[350],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      changecolor == 3 ? theme.primaryColor : Colors.grey[350],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      changecolor == 4 ? theme.primaryColor : Colors.grey[350],
                ),
              ),
               CircleAvatar(
                radius: 5,
                backgroundColor:
                    changecolor == 5 ? theme.primaryColor : Colors.grey[350],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
