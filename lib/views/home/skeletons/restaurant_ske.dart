import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RestaurantCardSkeleton extends StatelessWidget {
  const RestaurantCardSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        padding: const  EdgeInsets.only(left: 15, right: 5),
        margin: const EdgeInsets.only(top: 10),
        height: 350,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * .75,
                    height: 228,
                  ),
                ),
                Positioned(
                  top: 18,
                  child: Container(
                    padding: const EdgeInsets.only(right: 12, top: 8, left: 8, bottom: 8),
                    decoration: const BoxDecoration(
                        // color: Colors.black87,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                    ),
                    child: const Text('Top restaurant', style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.only(right: 10, top: 5, left: 10, bottom: 5),
                    decoration: const BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )
                    ),
                    child: const Text('15 min', style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text('TUBE COFFEE TOUL KORK SAMAI SQUARE',overflow: TextOverflow.ellipsis, maxLines: 1 , style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 5),
            const Text('\$\$\$ Tea & Coffee'),
            const SizedBox(height: 5),
            const Text('\$ 0.65 delivery fee', style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

