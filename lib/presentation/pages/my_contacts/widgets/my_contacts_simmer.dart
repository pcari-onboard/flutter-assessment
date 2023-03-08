import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyContactsSimmer extends StatelessWidget {
  const MyContactsSimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 64.0,
          margin: const EdgeInsets.only(bottom: 12.0),
          padding: const EdgeInsets.only(
            left: 36.0,
            right: 21.0,
          ),
          // color: Colors.amberAccent,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const SizedBox(
                            width: 15.0,
                            height: 14.0,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/Vectorfav_icon.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: 200,
                        height: 10,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    width: 27.0,
                    height: 23.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/f2.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
