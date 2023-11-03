import 'package:flutter/material.dart';
import 'package:notes_test/style/colors.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 116,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: bannerColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
            ),
            child: Row(children: [
              Image.asset(
                'assets/icon.png',
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  top: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Go Pro (No Ads)',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        'No fuss, no ads, for only \$1 a month',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        Positioned(
          top: 0,
          right: 30,
          child: Container(
            decoration: const BoxDecoration(color: priceColor),
            height: 71,
            width: 66.1,
            child: const Center(
              child: Text(
                '\$1',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
