import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_4/views/test_view.dart';

class DetalProducts extends StatefulWidget {
  const DetalProducts({super.key});

  @override
  State<DetalProducts> createState() => _DetalProductsState();
}

class _DetalProductsState extends State<DetalProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Detalhes'),
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TestView(title: 'Nova Página',),));
        },
        child: Text('Ir para segunda parte'),
      ),
    ),
    );
  }
}