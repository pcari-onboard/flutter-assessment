import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePageShimmer extends StatelessWidget {
  const ProfilePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.white,
              child: Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 125.0,
                          height: 123.0,
                          margin: const EdgeInsets.only(top: 7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5,
                              color: const Color(0XFF32BAA5),
                            ),
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                        ),
                        Container(
                          width: 125.0,
                          height: 123.0,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Text(
                      '',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 91,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0XFFF1F1F1),
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 14.0,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/email2.png',
                            cacheWidth: 44,
                            cacheHeight: 31,
                          ),
                          Container(
                            color: Colors.white,
                            height: 10.0,
                            width: 100.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      fixedSize: const MaterialStatePropertyAll(
                        Size(360.0, 47.0),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0XFF32BAA5),
                      ),
                    ),
                    onPressed: () => {},
                    child: Text(
                      'Send Email',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
