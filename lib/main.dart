import 'package:flutter/material.dart';
import 'package:flutter_puzzle_game/containers/Containers.dart';
import 'package:flutter_puzzle_game/custom_text_feild/custom_textfeild.dart';
import 'package:flutter_puzzle_game/swap_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  static const bgImage = "assets/images/bgImage.jpg";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  double opacity = 1;
  double opacityDecBy = 0.003;
  bool isPuzzleComplete() {
    if (images[0] == blueImg &&
        images[1] == img1 &&
        images[2] == img2 &&
        images[3] == img3 &&
        images[4] == img4 &&
        images[5] == img5 &&
        images[6] == img6 &&
        images[7] == img7 &&
        images[8] == img8) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
          content:
              Text("Puzzle Completed by ${controller.text} in $count moves")));
      count = 0;
      opacity = 1;
      return true;
    } else if (opacity < 0.25) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
          content: Text(
              "failed to complete the puzzle by ${controller.text} in $count moves because of low opacity")));
      count = 0;
      opacity = 1;
      return true;
    } else {
      count++;
      opacity -= opacityDecBy;

      return false;
    }
  }

  // static const img9 = "assets/images/1.jpg";
  static const img8 = "assets/images/2.png";
  static const img7 = "assets/images/3.png";
  static const img6 = "assets/images/4.png";
  static const img5 = "assets/images/5.png";
  static const img4 = "assets/images/6.png";
  static const img3 = "assets/images/7.png";
  static const img2 = "assets/images/8.png";
  static const img1 = "assets/images/9.png";
  static final List<String> images = [
    blueImg,
    img1,
    img2,
    img3,
    img4,
    img5,
    img6,
    img7,
    img8,
  ];
  late FocusNode focusNode = FocusNode();
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    images.shuffle();
    controller = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(MyHomePage.bgImage), fit: BoxFit.fill)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  Flexible(
                    flex: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 10,
                        ),
                        CustomContainer(
                            opacity: opacity,
                            offset: Offset(1.5, 1.5),
                            assetName: "assets/images/puzzle.jpg",
                            onTap: () {
                              setState(() {
                                images.shuffle();
                                opacity = 1;
                                count = 0;
                              });
                            },
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            flex: 30),
                        Spacer(
                          flex: 5,
                        ),
                        Expanded(
                          flex: 40,
                          child: CustomsTextFeild(
                            textInputType: TextInputType.text,
                            focusNode: focusNode,
                            controller: controller,
                            labelText: 'Name',
                          ),
                        ),
                        Spacer(
                          flex: 10,
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Expanded(
                      flex: 60,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: const Color.fromARGB(140, 255, 255, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(
                                flex: 4,
                              ),
                              Rows(
                                opacity: opacity,
                                flex: 30,
                                img1: images[1],
                                img2: images[2],
                                img3: images[3],
                                onTap1: () {
                                  if (images[2] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 1, to: 2, images: images);
                                    });
                                  } else if (images[4] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();
                                      swapImage(from: 1, to: 4, images: images);
                                    });
                                  }
                                },
                                onTap2: () {
                                  if (images[3] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();
                                      swapImage(from: 2, to: 3, images: images);
                                    });
                                  } else if (images[1] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 2, to: 1, images: images);
                                    });
                                  } else if (images[5] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 2, to: 5, images: images);
                                    });
                                  }
                                },
                                onTap3: () {
                                  opacity -= opacityDecBy;
                                  if (images[2] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 3, to: 2, images: images);
                                    });
                                  } else if (images[6] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 3, to: 6, images: images);
                                    });
                                  }
                                },
                                offset1: Offset(-1.5, -1.5),
                                offset2: Offset(0, -1.5),
                                offset3: Offset(1.5, -1.5),
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Rows(
                                opacity: opacity,
                                flex: 30,
                                img1: images[4],
                                img2: images[5],
                                img3: images[6],
                                onTap1: () {
                                  if (images[5] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 4, to: 5, images: images);
                                    });
                                  } else if (images[7] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 4, to: 7, images: images);
                                    });
                                  } else if (images[1] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 4, to: 1, images: images);
                                    });
                                  }
                                },
                                onTap2: () {
                                  if (images[6] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 5, to: 6, images: images);
                                    });
                                  } else if (images[8] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 5, to: 8, images: images);
                                    });
                                  } else if (images[2] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 5, to: 2, images: images);
                                    });
                                  } else if (images[4] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 5, to: 4, images: images);
                                    });
                                  }
                                },
                                onTap3: () {
                                  if (images[3] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 6, to: 3, images: images);
                                    });
                                  } else if (images[5] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 6, to: 5, images: images);
                                    });
                                  } else if (images[0] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 6, to: 0, images: images);
                                    });
                                  }
                                },
                                offset1: Offset(-1.5, 0),
                                offset2: Offset(0, 0),
                                offset3: Offset(1.5, 0),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Rows(
                                opacity: opacity,
                                flex: 30,
                                img1: images[7],
                                img2: images[8],
                                img3: images[0],
                                onTap1: () {
                                  if (images[8] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 7, to: 8, images: images);
                                    });
                                  } else if (images[4] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 7, to: 4, images: images);
                                    });
                                  }
                                },
                                onTap2: () {
                                  if (images[0] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 8, to: 0, images: images);
                                    });
                                  } else if (images[5] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 8, to: 5, images: images);
                                    });
                                  } else if (images[7] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 8, to: 7, images: images);
                                    });
                                  }
                                },
                                onTap3: () {
                                  if (images[6] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 0, to: 6, images: images);
                                    });
                                  } else if (images[8] == blueImg) {
                                    setState(() {
                                      isPuzzleComplete();

                                      swapImage(from: 0, to: 8, images: images);
                                    });
                                  }
                                },
                                offset1: Offset(-1.5, 1.5),
                                offset2: Offset(0, 1.5),
                                offset3: Offset(1.5, 1.5),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              const Spacer(
                                flex: 4,
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}

class Rows extends StatefulWidget {
  const Rows({
    super.key,
    required this.flex,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.offset1,
    required this.offset2,
    required this.offset3,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.opacity,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
  });
  final int flex;
  final String img1;
  final String img2;
  final String img3;
  final Offset offset1;
  final Offset offset2;
  final Offset offset3;
  final Radius bottomLeft;
  final Radius bottomRight;
  final Radius topLeft;
  final Radius topRight;
  final VoidFunction onTap1;
  final VoidFunction onTap2;
  final VoidFunction onTap3;
  final double opacity;

  @override
  State<Rows> createState() => _RowsState();
}

class _RowsState extends State<Rows> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: widget.flex,
        //1First Row
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 20,
            ),
            CustomContainer(
              opacity: widget.opacity,
              onTap: widget.onTap1,
              topLeft: widget.topLeft,
              bottomLeft: widget.bottomLeft,
              offset: widget.offset1,
              assetName: widget.img1,
              flex: 306,
            ),
            const Spacer(
              flex: 20,
            ),
            CustomContainer(
              opacity: widget.opacity,
              onTap: widget.onTap2,
              offset: widget.offset2,
              assetName: widget.img2,
              flex: 306,
            ),
            const Spacer(
              flex: 20,
            ),
            CustomContainer(
              opacity: widget.opacity,
              onTap: widget.onTap3,
              topRight: widget.topRight,
              bottomRight: widget.bottomRight,
              offset: widget.offset3,
              assetName: widget.img3,
              flex: 306,
            ),
            const Spacer(
              flex: 20,
            ),
          ],
        ));
  }
}
