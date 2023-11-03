import 'package:flutter/material.dart';
import 'package:notes_test/style/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: appbarColor,
      leadingWidth: MediaQuery.of(context).size.width,
      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 19, left: 32),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/pic.png',
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hello Jhon',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto-Bold',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 221,
                  child: Text(
                    'What are your plans for today?',
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      toolbarHeight: 123,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(123);
}
