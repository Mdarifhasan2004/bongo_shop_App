import 'package:bango_shop/files_dart/homepage/productinformation.dart';
import 'package:bango_shop/files_dart/product_details/custom_product_details.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class Catagory_Shoes extends StatefulWidget {
  const Catagory_Shoes({Key? key}) : super(key: key);

  @override
  _Catagory_ShoesState createState() => _Catagory_ShoesState();
}

class _Catagory_ShoesState extends State<Catagory_Shoes> {
  productinformation product_data = productinformation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3BB73E),
        title: Text(
          "Shoes",
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: product_data.prouctname.length,
            itemBuilder: (Buildercontext, index){
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(SwipeablePageRoute(
                      canOnlySwipeFromEdge: true,
                      builder: (BuildContext context) =>
                          customproduct_details(
                              product_data.prouctname[index])));
                },
                child: Card(
                  child: ListTile(
                    leading: Image.network(product_data.prouctname[index].imgurl, width: 80,)
                    ,title: Text(product_data.prouctname[index].title, style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),
                    subtitle: Text('''\$'''+product_data.prouctname[index].price.toString(), style: TextStyle(color: Colors.redAccent),),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
