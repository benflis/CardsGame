import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'Components/Data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool answerShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Game'),
        backgroundColor: Color(0xFF001a1e),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cardsmanager');
          },
          icon: Icon(Icons.credit_card),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF001a1e),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Recto',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Provider.of<Data>(context).currentDeck.length != 0
                        ? Text(Provider.of<Data>(context)
                            .currentDeck[Provider.of<Data>(context).index]
                                ['Recto']
                            .toString())
                        : null,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Verso',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (Provider.of<Data>(context, listen: false)
                                .currentDeck
                                .length !=
                            0) {
                          answerShown = true;
                        }
                        if (answerShown == true) {
                          return null;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Provider.of<Data>(context).currentDeck.length !=
                                    0 &&
                                answerShown &&
                                Provider.of<Data>(context).index != null
                            ? Colors.white
                            : Color(0xFF617d8b),
                      ),
                      height: 200,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child:
                          Provider.of<Data>(context).currentDeck.length != 0 &&
                                  answerShown &&
                                  Provider.of<Data>(context).index != null
                              ? Text(Provider.of<Data>(context)
                                  .currentDeck[Provider.of<Data>(context).index]
                                      ['Verso']
                                  .toString())
                              : null,
                    ),
                  ),
                ],
              ),
            ),
            BottomBar(
              answerShown: answerShown,
              onTap: () {
                setState(() {
                  Provider.of<Data>(context, listen: false).addHardWord();
                  answerShown = false;
                  Provider.of<Data>(context, listen: false).GenerateNumber();
                });
              },
              onTap2: () {
                setState(() {
                  Provider.of<Data>(context, listen: false).addMediumWord();
                  answerShown = false;
                  Provider.of<Data>(context, listen: false).GenerateNumber();
                });
              },
              onTap3: () {
                setState(() {
                  Provider.of<Data>(context, listen: false).addEasyWord();
                  answerShown = false;
                  Provider.of<Data>(context, listen: false).GenerateNumber();
                });
              },
              onTap4: () {
                setState(() {
                  Provider.of<Data>(context, listen: false).addEffortlessWord();
                  answerShown = false;
                  Provider.of<Data>(context, listen: false).GenerateNumber();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  BottomBar(
      {required this.answerShown,
      required this.onTap,
      required this.onTap2,
      required this.onTap3,
      required this.onTap4});
  void Function()? onTap;
  void Function()? onTap2;
  void Function()? onTap3;
  void Function()? onTap4;
  bool answerShown;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 10,
      right: 10,
      child: answerShown
          ? Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(8, 31, 59, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: onTap,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'icons/List.svg',
                          color: Colors.green,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Hard',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '1 min',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onTap2,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'icons/List.svg',
                          color: Colors.blue,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Medium',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '6 min',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onTap3,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'icons/List.svg',
                          color: Colors.yellow.shade600,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Easy',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '10 min',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onTap4,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'icons/List.svg',
                          color: Colors.orange,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Effortless',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '4 days',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(),
    );
  }
}
