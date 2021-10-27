import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    
    if( productsService.isLoading ) return LoadingScreen();


    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Listing'),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'settings');
              },
              child: Container(
                width: 55,
                padding: EdgeInsets.all(8),
                child: ClipOval(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
        ],
        leading: IconButton(
          icon: Icon( Icons.login_outlined ),
          onPressed: () {

            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');

          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400, crossAxisSpacing: 6, mainAxisSpacing: 0, ),
        itemCount: productsService.products.length,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 7),
            child: ProductCard(
              product: productsService.products[index],
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

          productsService.selectedProduct = new Product(
            available: false, 
            name: '', 
            price: 0
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
   );
  }
}