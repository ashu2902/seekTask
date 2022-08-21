import 'dart:developer';

import 'package:flutter/material.dart';

List<Widget> savedCards = [
  AddCardWidget(),
];

addPaymentMethodBottomSheet(context, setState) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final double ht = MediaQuery.of(context).size.height;
        final double wd = MediaQuery.of(context).size.width;
        return Container(
            clipBehavior: Clip.hardEdge,
            height: ht / 1.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back))),
                        const Text(
                          'Add Payment Method',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: wd / 4,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 18),
                      child: Column(
                        children: savedCards,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      });
}

addCardBottomSheet(context, setState) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      });
}

class AddCardWidget extends StatefulWidget {
  const AddCardWidget({Key? key}) : super(key: key);

  @override
  State<AddCardWidget> createState() => _AddCardWidgetState();
}

class _AddCardWidgetState extends State<AddCardWidget> {
  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wd = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const CardDetails();
            });
      },
      child: SizedBox(
        height: ht / 4,
        width: wd / 1.2,
        // color: Colors.black.withOpacity(0.1),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
          color: Colors.grey.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Icon(Icons.add), Text('Add Card')],
          ),
        ),
      ),
    );
  }
}

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  bool front = true;
  TextEditingController _carNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _expDateController = TextEditingController();
  TextEditingController _securityCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.of(context).size.height;
    final double wd = MediaQuery.of(context).size.width;
    return Container(
      clipBehavior: Clip.hardEdge,
      height: ht / 1.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back))),
                  const Text(
                    'Add Card',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: wd / 4,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Start typing to add your credit card details.Everything will upadate according to your data.",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 14),
                    ),
                    SizedBox(
                      height: ht / 30,
                    ),
                    Visibility(
                      visible: front,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            front = !front;
                          });
                        },
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: Image.asset('assets/products/cardFront.png'),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !front,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            front = !front;
                          });
                        },
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: Image.asset('assets/products/cardBack.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ht / 30,
                    ),
                    TextField(
                      controller: _carNumberController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          focusColor: Colors.black,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2))),
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.4)),
                          hintText: 'Card Number'),
                    ),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          focusColor: Colors.black,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2))),
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.4)),
                          hintText: 'Name on Card'),
                    ),
                    TextField(
                      controller: _expDateController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          focusColor: Colors.black,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2))),
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.4)),
                          hintText: 'Expiry Date'),
                    ),
                    TextField(
                      controller: _securityCodeController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          focusColor: Colors.black,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2))),
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.4)),
                          hintText: 'Security Code'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: _nameController.text == '' ||
                                _carNumberController.text == '' ||
                                _expDateController.text == '' ||
                                _securityCodeController.text == ''
                            ? Container(
                                height: ht / 15,
                                width: wd / 2.5,
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.7)),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    savedCards.add(
                                      Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        elevation: 10,
                                        child: Image.asset(
                                            'assets/products/cardFront.png'),
                                      ),
                                    );
                                  });
                                  log(savedCards.length.toString());
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  addPaymentMethodBottomSheet(
                                      context, setState);
                                },
                                child: Container(
                                  color: Colors.blue[900],
                                  height: ht / 15,
                                  width: wd / 2.5,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
