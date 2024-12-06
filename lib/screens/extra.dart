// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: InstagramProfile(),
//     );
//   }
// }

// class InstagramProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Icon(Icons.lock, color: Colors.black),
//         title: Text(
//           "shree__735",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           Icon(Icons.add_circle_outline, color: Colors.black),
//           SizedBox(width: 10),
//           Icon(Icons.menu, color: Colors.black),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Information Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage('assets/profile.jpg'),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             _buildStatColumn("5", "Posts"),
//                             _buildStatColumn("522", "Followers"),
//                             _buildStatColumn("379", "Following"),
//                           ],
//                         ),
//                         SizedBox(height: 12),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             _buildButton("Edit profile"),
//                             SizedBox(width: 10),
//                             _buildButton("Share profile"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Bio Section
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Shrijana Maharjan",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text("Let everything be balanced"),
//                 ],
//               ),
//             ),
//             // Highlights Section
//             Container(
//               height: 100,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   _buildHighlight("assets/highlight1.jpg"),
//                   _buildHighlight("assets/highlight2.jpg"),
//                   _buildHighlight("assets/highlight3.jpg"),
//                 ],
//               ),
//             ),
//             Divider(),
//             // Posts Section
//             GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 2,
//                 mainAxisSpacing: 2,
//               ),
//               itemCount: 6, // Adjust this for the number of images
//               itemBuilder: (context, index) {
//                 return Container(
//                   color: Colors.grey[300],
//                   child: Image.asset(
//                     'assets/post${index + 1}.jpg', // Replace with your image paths
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Column _buildStatColumn(String number, String label) {
//     return Column(
//       children: [
//         Text(
//           number,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//         Text(label),
//       ],
//     );
//   }

//   Widget _buildButton(String text) {
//     return Expanded(
//       child: OutlinedButton(
//         onPressed: () {},
//         child: Text(text),
//       ),
//     );
//   }

//   Widget _buildHighlight(String imagePath) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundImage: AssetImage(imagePath),
//           ),
//           SizedBox(height: 4),
//           Text(
//             "Highlight",
//             style: TextStyle(fontSize: 12),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
