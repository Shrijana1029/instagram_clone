import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final imagePaths = [
    'assets/img/me.png',
    'assets/img/me.png',
    'assets/img/gun.png',
    'assets/img/insta.png',
    'assets/img/pic.jpg',
    'assets/img/shoes_1.png',
    'assets/img/gun.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(FontAwesomeIcons.lock, color: Colors.black),
        title: Text(
          "shree__735",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(FontAwesomeIcons.plusCircle, color: Colors.black),
          const SizedBox(width: 24),
          Icon(FontAwesomeIcons.bars, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            // Profile Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/avatar.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatColumn("5", "Posts"),
                            _buildStatColumn("522", "Followers"),
                            _buildStatColumn("379", "Following"),
                          ],
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bio Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shrijana Maharjan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Let everything be balanced"),
                ],
              ),
            ),
///////EDIT SECTION//////
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildButton('Edit Profile'),
                    const SizedBox(
                      width: 20,
                    ),
                    _buildButton('Share Profile'),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Highlights Section
            Container(
              height: 100,
              //listview for presenting in horizontal list
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildHighlight("assets/img/me.png", 'me'),
                  _buildHighlight("assets/img/pic.jpg", 'You'),
                  _buildHighlight("assets/img/me.png", 'Love'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            // Posts Section
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 6, // Adjust this for the number of images
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child: Image.asset(
                    imagePaths[index], // Replace with your image paths
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 3, horizontal: 3)),
            minimumSize: MaterialStateProperty.all(Size(50, 30)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  Widget _buildHighlight(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 4),
          Text(
            '$label',
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
