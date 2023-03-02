import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Components/Data.dart';

class CardsManager extends StatefulWidget {
  const CardsManager({super.key});

  @override
  State<CardsManager> createState() => _CardsManager();
}

class _CardsManager extends State<CardsManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Manager'),
        backgroundColor: Color(0xFF001a1e),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF001a1e),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: Provider.of<Data>(context).currentDeck.length,
              itemBuilder: (context, index) {
                return CardModel(index: index);
              },
            ),
            Positioned(
              right: 15,
              bottom: 25,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/addcard');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFF4caf50),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'add card',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardModel extends StatelessWidget {
  CardModel({
    required this.index,
  });
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
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
            child: Text(Provider.of<Data>(context)
                .currentDeck[index]['Recto']
                .toString()),
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
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
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
            child: Text(Provider.of<Data>(context)
                .currentDeck[index]['Verso']
                .toString()),
          ),
          Divider(
            height: 20,
            thickness: 3,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
