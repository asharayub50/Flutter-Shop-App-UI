import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(
                () {
                  numOfItems--;
                },
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: () {
            setState(
              () {
                numOfItems++;
              },
            );
          },
        ),
      ],
    );
  }
}

SizedBox buildOutlineButton(
    {required IconData icon, required VoidCallback press}) {
  return SizedBox(
    width: 40,
    height: 32,
    child: OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: press,
      child: Icon(
        icon,
      ),
    ),
  );
}
