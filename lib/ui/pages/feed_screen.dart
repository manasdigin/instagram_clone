import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Map<String, String>> stories = [
    {
      "name": "My Story",
      "image": "assets/images/boy.jpg",
      "likes": "30",
      "caption": "Having a great time!",
      "comments": "5",
      "minutes": "15"
    },
    {
      "name": "Manas D",
      "image": "assets/images/boy2.jpg",
      "likes": "90",
      "caption": "Enjoying the sunset.",
      "comments": "12",
      "minutes": "25"
    },
    {
      "name": "Story 1",
      "image": "assets/images/boy3.jpg",
      "likes": "80",
      "caption": "Just chilling.",
      "comments": "8",
      "minutes": "35"
    },
    {
      "name": "Story 2",
      "image": "assets/images/boy4.jpg",
      "likes": "70",
      "caption": "New adventures!",
      "comments": "10",
      "minutes": "45"
    },
    {
      "name": "Story 3",
      "image": "assets/images/boy5.jpg",
      "likes": "550",
      "caption": "Love this place.",
      "comments": "50",
      "minutes": "55"
    },
    {
      "name": "Story 4",
      "image": "assets/images/boy6.jpg",
      "likes": "800",
      "caption": "Great day!",
      "comments": "70",
      "minutes": "65"
    },
  ];
  ScrollController? _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController?.addListener(() {
      if (_scrollViewController?.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController?.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController?.dispose();
    _scrollViewController?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.black,
            floating: true,
            expandedHeight: 0,
            pinned: true,
            snap: true,
            title: SvgPicture.asset(
              "assets/insta/ic_instagram.svg",
              color: Colors.white,
              semanticsLabel: 'Image',
              fit: BoxFit.fitWidth,
              height: 40,
              width: 40,
            ),
            actions: const [
              FaIcon(
                FontAwesomeIcons.heart,
                color: Colors.white,
              ),
              SizedBox(
                width: 30,
              ),
              FaIcon(
                FontAwesomeIcons.message,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 85, // Adjust this to the height of your images
              child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: stories.length, // 8 images + 1 add icon
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Image.asset(
                                    "assets/images/boy.jpg",
                                    fit: BoxFit.cover,
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "My Story",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.purpleAccent,
                                Colors.red,
                                Colors.yellowAccent,
                              ],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage(stories[index]["image"]!),
                          ),
                        )),
                        Text(
                          stories[index]["name"]!,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
        body: ListView.builder(
          padding: EdgeInsets.only(top: 8.0),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.purpleAccent,
                                Colors.red,
                                Colors.yellowAccent,
                              ],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage(stories[index]["image"]!),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${stories[index]["name"]}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(stories[index]["image"]!),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          FaIcon(
                            FontAwesomeIcons.comment,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          FaIcon(
                            FontAwesomeIcons.share,
                            color: Colors.white,
                          )
                        ],
                      ),
                      FaIcon(
                        FontAwesomeIcons.save,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${stories[index]["likes"]} likes",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${stories[index]["name"]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${stories[index]["caption"]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "view ${stories[index]["comments"]} comment",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${stories[index]['minutes']} minutes ago",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Gradient gradient;

  GradientBorderPainter({
    required this.strokeWidth,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final radius = (size.width / 2) - (strokeWidth / 2);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
