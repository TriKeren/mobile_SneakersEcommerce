import 'package:flutter/material.dart';
import 'package:sneaker_ecommerce/models/sneaker_model.dart';
import 'package:sneaker_ecommerce/views/shared/appstyle.dart';
import 'package:sneaker_ecommerce/views/shared/new_shoes.dart';
import 'package:sneaker_ecommerce/views/shared/product_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.390,
            child: FutureBuilder<List<Sneakers>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoes = snapshot.data![index];
                          return ProductCard(
                            price: "\Rp.${shoes.price}",
                            category: shoes.category,
                            id: shoes.id,
                            name: shoes.name,
                            image: shoes.imageUrl[0],
                          );
                        });
                  }
                })),
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appstyle(
                        24, Colors.black, FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Show All",
                        style: appstyle(
                            22, Colors.black, FontWeight.w500),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.14,
          child: FutureBuilder<List<Sneakers>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoes = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewShoes(imageUrl: shoes.imageUrl[0]),
                          );
                        });
                  }
                })
        )
      ],
    );
  }
}
