import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_4/services/request_http.dart';
import 'package:flutter_application_4/views/test_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getProduct();

    return Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
        ),
        body: FutureBuilder(
          future: getProduct(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TestView(title: snapshot.data[index]['title'],
                        description: snapshot.data[index]['description'], price: snapshot.data[index]['price'], brand: snapshot.data[index]['brand'],
                        images: snapshot.data[index]['images'], category: snapshot.data[index]['category']),));
                      },
                      child: Card(
                        elevation: 10,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Image.network('${snapshot.data[index]['thumbnail']}', width: 300, height: 100, fit: BoxFit.cover),
                            SizedBox(height: 10,),
                            Text('${snapshot.data[index]['title']}'),
                            Text('R\$${snapshot.data[index]['price']}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return Text('${snapshot.data}');
          },
        ));
  }
}
