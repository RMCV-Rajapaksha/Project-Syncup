import 'package:flutter/material.dart';
import 'package:project_syncup/commponent_delete/AlbumCard.dart';
import 'package:project_syncup/commponent_delete/theme.dart';
import 'package:project_syncup/pages_delete/qr_generator/Qr_generator.dart';

final _formKey = GlobalKey<FormState>();

class Album extends StatefulWidget {
  const Album({Key? key}) : super(key: key);

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  void _showModalBottomScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.55,
        minChildSize: 0.50,
        maxChildSize: 0.56,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: const QrGenerator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
      ),
      body: Column(
        children: [
          Container(
            child: ClipRRect(
              child: Container(
                height: screenHeight * 0.4,
                width: screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cake.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'eventTitle',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: screenHeight * 0.024,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          const Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          IconButton(
                            onPressed: () => _showModalBottomScreen(context),
                            icon: const Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 2.0,
                      ),
                      Text(
                        'Step into a world of joyous celebration where laughter echoes and happiness blooms with every passing moment. Picture this: a colorful array of decorations dancing in the air, each one whispering tales of merriment and delight. From vibrant balloons soaring high to shimmering streamers cascading down, every corner is adorned with the promise of festivity.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return AlbumCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
