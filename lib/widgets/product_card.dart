import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    Key? key, 
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Stack(
        children: [
          Align(
            // alignment: Alignment.center,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                "${product.picture}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.black.withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            "${product.name}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            "${product.price}",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}