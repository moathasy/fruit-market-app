import 'package:flutter/material.dart';


class SingleProduct extends StatelessWidget {

  final String ? image;
  final String ? price;
  final String ? name;
  
  const SingleProduct({this.image,this.name,this.price ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          height: 250,
          width: 180,
          child: Column(
            children: [
              Container(
                height: 190,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image!))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('\$ ${price.toString()}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('${name}', style: const TextStyle(fontSize: 15)),
            ],
          )),
    );
  }
}