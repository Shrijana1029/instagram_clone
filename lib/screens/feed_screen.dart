import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool love = false;
  late double initialChildSize;
  late double minChildSize;
  late double maxChildSize;
  final imagePaths = [
    'assets/img/me.png',
    'assets/img/gun.png',
    'assets/img/insta.png',
    'assets/img/pic.jpg',
    'assets/img/shoes_1.png',
    'assets/img/gun.png',
  ];

  final List<Map<String, dynamic>> items = [
    {'name': 'Add to favourites list', 'icon': FontAwesomeIcons.star},
    {'name': 'Unfollow', 'icon': Icons.person},
    {'name': 'Hide', 'icon': FontAwesomeIcons.eyeSlash},
    {'name': 'About this account', 'icon': Icons.person},
    {'name': 'Report', 'icon': FontAwesomeIcons.exclamationCircle},
    {'name': 'Why you are seeing thus post', 'icon': FontAwesomeIcons.info},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/img/insta.png',
            width: 150,
          ),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.heart),
              onPressed: () {},
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.comment))
          ],
        ),
        body: ListView.builder(
          itemCount: 6, // Dummy data count for posts////////////////
          itemBuilder: (context, index) {
            return Column(
              children: [
                // Post header (User Info + Follow Button)///////////////////
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/img/avatar.png'), // Replace with your image
                  ),
                  title: Text(
                    'shrijana $index',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall, // Use bodyText1 or any other style
                  ),
                  subtitle: Text('Siddhipur,Lalitpur'),
                  trailing: IconButton(
                    icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return actionSection();
                          });
                    },
                  ),
                ),
                // Post Image//////////////////
                Container(
                  height: 300,
                  color: Colors.black12,
                  child: Image.asset(
                    imagePaths[index],
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                // Post actions (Like, Comment, Share)/////////////
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Row(
                    children: [
                      IconButton(
                          icon: love
                              ? const Icon(FontAwesomeIcons.heart)
                              : const Icon(
                                  FontAwesomeIcons.solidHeart,
                                  color: Colors.red,
                                ),
                          onPressed: () {
                            setState(() {
                              love = !love;
                            });
                          }),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return commentSection();
                              },
                            );
                          },
                          icon: const Icon(FontAwesomeIcons.comment)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.send))
                    ],
                  ),
                ),
                // Post caption and comments////////////////////
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text('Liked by user1 and others'),
                      Spacer(),
                      // Text('10 minutes ago'),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'I am happy for what i have right noe hehe, Welcome to my instagram')
                      ],
                    ),
                  ),
                ),
                /////////////time
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        '10  minutes ago',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }

/////////////////////ALL CALLED WIDGETS///////////////////
  Widget commentSection() {
    ///draggable helps to adjust height acc to its requrement
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.25,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            //keyboard may overlap the textfeld widget so, we use this ///
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom // Adjust for keyboard
                ),
            child: Column(
              children: [
                const Divider(
                  thickness: 4.4,
                  indent: 109.5,
                  endIndent: 109.5,
                  // endIndent: 9.5,
                ),
                const Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/img/avatar.png'),
                        ),
                        title: Text('User 1'),
                        subtitle: Text('This is a comment'),
                      );
                    }),
                const Divider(),
                //////////commenting write section

                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Write a comment...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  //////////triple dot acton section//////

  Widget actionSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const Divider(
          thickness: 4.4,
          indent: 109.5,
          endIndent: 109.5,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/save-instagram.png',
                      height: 30,
                      width: 30,
                    )),
                const Text('Save'),
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/qr-code.png',
                      height: 30,
                      width: 30,
                    )),
                const Text('Qr Code'),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.builder(
                // shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    onTap: () {},
                    title: Text('${item['name']}'),
                    leading: Icon(item['icon']),
                  );
                })),
        const Divider(),
      ]),
    );
  }

  Widget threeDots(IconData icon, String name) {
    return ListTile(
      onTap: () {},
      title: Text('$name'),
      leading: Icon(icon),
    );
  }
}
