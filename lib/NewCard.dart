import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'Components/Data.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController rectoController = TextEditingController();
  TextEditingController versoController = TextEditingController();

  String? recto;
  String? verso;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('New Card'),
        backgroundColor: Color(0xFF001a1e),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF001a1e),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Form(
                  key: _formKey,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field can not be empty";
                            } else {
                              for (int i = 0;
                                  i <
                                      Provider.of<Data>(context, listen: false)
                                          .currentDeck
                                          .length;
                                  i++) {
                                if (value ==
                                    Provider.of<Data>(context, listen: false)
                                        .currentDeck[i]['Recto']) {
                                  return "Duplicate";
                                }
                              }
                            }
                            return null;
                          },
                          onSaved: (newValue) {},
                          onChanged: ((value) => recto = value),
                          controller: rectoController,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Card Text',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        height: 200,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: TextFormField(
                          onSaved: (newValue) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field has to be filled';
                            }
                            return null;
                          },
                          onChanged: ((value) => verso = value),
                          controller: versoController,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Card Text',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 15,
              bottom: 25,
              child: InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<Data>(context, listen: false)
                        .addNewWord(recto!, verso!, 0);

                    rectoController.clear();
                    versoController.clear();
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
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
                        'save',
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
