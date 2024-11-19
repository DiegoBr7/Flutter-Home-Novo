import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Widget> carouselItems = [
    // Primeiro item do carrossel
    Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Sombreamento abaixo
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Center(child: Text('Item 1', style: TextStyle(color: Colors.white))),
    ),
    // Segundo item do carrossel
    Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Center(child: Text('Item 2', style: TextStyle(color: Colors.white))),
    ),
    // Terceiro item do carrossel
    Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Center(child: Text('Item 3', style: TextStyle(color: Colors.white))),
    ),
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoadorPage(carouselItems: carouselItems), // Passa carouselItems como parâmetro
    );
  }
}

class DoadorPage extends StatefulWidget {
  final List<Widget> carouselItems; // Adiciona carouselItems como atributo

  const DoadorPage({super.key, required this.carouselItems}); // Construtor

  @override
  _DoadorPageState createState() => _DoadorPageState();
}

class _DoadorPageState extends State<DoadorPage> {
  int _currentIndex = 0; // Índice atual do carrossel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrossel com Indicador'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Carrossel
              CarouselSlider(
                items: widget.carouselItems,
                options: CarouselOptions(
                  height: 250,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index; // Atualiza o índice atual do carrossel
                    });
                  },
                ),
              ),
              
              // Indicador de página
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SmoothPageIndicator(
                  controller: PageController(),
                  count: widget.carouselItems.length,
                  effect: WormEffect( // Efeito de transição do indicador
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
