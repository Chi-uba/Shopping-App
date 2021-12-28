import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/app_theme.dart';
import 'AppData.dart';


class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text(
          'MY CART',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<ItemsOnSale>(
        builder: (context, lists, child) {
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MyCartListTile(item: lists.my_cart_list[index]);
                },
                itemCount: lists.my_cart_list.length,
                scrollDirection: Axis.vertical,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 30,
                child: Row(
                  children: [
                    Text('TOTAL PRICE :  '),
                    Spacer(flex: 1,),
                    Text('PRICE'),
                  ],
                ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

class MyCartListTile extends StatelessWidget {
  Items? item;
   MyCartListTile({
    required this.item,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 8.0,),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
              width: 5,
              color: Colors.white
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        height: 80,
        child: Row(
          children: [
            Container(
              child: Image.asset('assets/${item!.image}'),
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item!.name.toString()),
                Text('Category : ${item!.category.toString()}'),
                SizedBox(height: 10,),
                Text('Price : ${item!.price}')
              ],
            ),
            Spacer(flex: 1,),
            SizedBox(width: 10.0,),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                  onPressed: () {
                    Provider.of<ItemsOnSale>(context,listen: false).removeFromCart(item!);
                  },
                  icon: Icon(Icons.delete)),
            ),
          ],
        ),
      ),
    );
  }
}
