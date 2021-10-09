import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamtod_food/models/food_item.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var items = [
    FoodItem(1, "ข้าวไข่เจียว", 25, "kao_kai_jeaw.jpg"),
    FoodItem(2, "ข้าวหมูแดง", 30, "kao_moo_dang.jpg"),
    FoodItem(3, "ข้าวมันไก่", 25, "kao_mun_kai.jpg"),
    FoodItem(4, "ข้าวหน้าเป็ด", 40, "kao_na_ped.jpg"),
    FoodItem(5, "ข้าวพัด", 30, "kao_pad.jpg"),
    FoodItem(6, "ผัดซีอิ้ว", 30, "pad_sie_eew.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg_05.jpg'), fit: BoxFit.cover),
      ),
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                goDetail(items[index]);
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(

                          child: Image.asset(
                              'assets/images/${items[index].image}',
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover)),
                      SizedBox(width: 8.0,),
                      Text(
                        ' ${items[index].name}  \n ${items[index].price} บาท',
                        style: GoogleFonts.mali(
                            fontSize: 20.0, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void goDetail(FoodItem item) {
    Navigator.pushNamed(
      context,
      "/detail",
      arguments: item,
    );
  }
}
