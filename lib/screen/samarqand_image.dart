import 'package:flutter/material.dart';

class SamarqandImage extends StatefulWidget {
  const SamarqandImage({super.key});

  @override
  State<SamarqandImage> createState() => _SamarqandImageState();
}

class _SamarqandImageState extends State<SamarqandImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text(
            'Samarqand',
            style: TextStyle(fontSize: 25, color: Colors.black),
          )),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset(
                'ims/sam1.jpg',
                fit: BoxFit.cover,
              ),
              color: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam4.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam5.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam6.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam7.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam8.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam9.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                'ims/sam10.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
