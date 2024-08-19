import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yMMMMd').format(DateTime.now());
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(204, 204, 204, 1),
              ),
              height: 50,
              width: 50,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text(
                        formattedDate,
                        style: GoogleFonts.syne(
                          fontSize: 13,
                          color: const Color.fromRGBO(170, 170, 170, 1),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text('Hello, ',
                            style: GoogleFonts.sora(
                              fontSize: 15,
                              color: const Color.fromRGBO(102, 102, 102, 1),
                              fontWeight: FontWeight.w500,
                            )),
                        const Text(
                          'Aryam',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  width: 1.0,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: Color.fromARGB(255, 164, 157, 157), size: 30),
                onPressed: () {
                  // todo
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}