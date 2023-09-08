import 'package:book/model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Poem extends StatefulWidget {
  const Poem({super.key});

  @override
  State<Poem> createState() => _PoemState();
}

class _PoemState extends State<Poem> {
  PageController pageController = PageController(viewportFraction: 1);
  var _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      
      body: Container(
        margin:const EdgeInsets.all(10),
        decoration:const BoxDecoration(color: Colors.blueAccent),
        child: PageView.builder(
            controller: pageController,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              ProductList product = productList[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Lottie.network(
                      product.image,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        product.name,
                        textAlign: TextAlign.center,
                        style:const TextStyle(
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.description,
                          style: const TextStyle(letterSpacing: 1, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
