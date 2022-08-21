import 'package:flutter/material.dart';
import 'package:seek_task/Screens/story_screen.dart';
import 'package:seek_task/Widgets/payment_details_bottomsheet.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({this.img, required this.title, Key? key}) : super(key: key);
  dynamic? img;
  final String title;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext buildContext) {
    final double ht = MediaQuery.of(buildContext).size.height;
    final double wd = MediaQuery.of(buildContext).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                color: const Color(0xffCD121F),
                width: wd,
                height: ht / 2.15,
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: ht / 2.15,
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'The stock market for things',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: ht / 40,
                  ),
                  Text(
                    'X-S-Store is the world’s first stock market for things – a live ‘bid/ask’ marketplace. Buyers place bids, sellers place asks and when a bid and ask meet, the transaction happens automatically. Retro Jordans, Nikes, Yeezys and more – now 100% authentic guaranteed.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withOpacity(0.6)),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: wd,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'The Basics',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Anonymity',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Never worry about legit buyers or sellers – we’re in the middle.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Transparency',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Real-time market data for intelligent buying and selling.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Authenticity',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Our experts authenticate every product sold on X-S-Store.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.005),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Buying on X-S-Store',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Bid (Buy)',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Make an offer that any seller can accept; or purchase immediately at the lowest Ask.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Authenticate',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Seller ships to us. We authenticate, then we release funds to the seller.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Prosper',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We ship to you. You sip a daiquiri, knowing you will never get a fake.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          addPaymentMethodBottomSheet(buildContext, setState);
                        },
                        child: Container(
                          height: ht / 20,
                          width: wd / 2.8,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 89, 195, 93),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "Learn More",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selling on X-S-Store',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Ask (Sell)',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'List an item for sale; or sell immediately at the highest Bid.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Authenticate',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ship your item within 2 business days. We authenticate, then we ship to the buyer.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Prosper',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We release funds to you. You sip a daiquiri, knowing you will never get a chargeback.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          addPaymentMethodBottomSheet(buildContext, setState);
                        },
                        child: Container(
                          height: ht / 20,
                          width: wd / 2.8,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "Learn More",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}
