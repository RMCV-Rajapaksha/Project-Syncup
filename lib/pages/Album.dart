import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';

final _formKey = GlobalKey<FormState>();

class Album extends StatefulWidget {
  const Album({Key? key}) : super(key: key);

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Template(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      theChild: Column(
        children: [
          Container(
            child: ClipRRect(
              child: Container(
                height: screenHeight * 0.4,
                width: screenWidth,
                decoration: BoxDecoration(
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
                          Icon(
                            Icons.message, // Use the icon you prefer
                            color:
                                Colors.white, // Customize the color if needed
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
              ),
              itemCount: 10, // Number of items in your grid
              itemBuilder: (BuildContext context, int index) {
                // You can return any widget you want for each grid item
                return AlbumCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Example background color
      child: Center(
        child: Text('Item $index'),
      ),
    );
  }
}
