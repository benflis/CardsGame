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
          icon: SvgPicture.asset(
            'Icons/Card.svg',
            color: Colors.white,
            height: 24,
            width: 24,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF001a1e),
        child: Padding(
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
                child: Provider.of<Data>(context).theWord.length != 0
                    ? Text(Provider.of<Data>(context)
                        .theWord[0]['Verso']
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
                            .theWord
                            .length !=
                        0) {
                      answerShown = true;
                      print(answerShown);
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Provider.of<Data>(context).theWord.length != 0 &&
                            answerShown
                        ? Colors.white
                        : Color(0xFF617d8b),
                  ),
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Provider.of<Data>(context).theWord.length != 0 &&
                          answerShown
                      ? Text(Provider.of<Data>(context)
                          .theWord[0]['Verso']
                          .toString())
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
