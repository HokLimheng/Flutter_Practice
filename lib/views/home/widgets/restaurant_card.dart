import 'package:flutter/material.dart';
import 'package:food_panda/views/business_owner/add_restaurant.dart';
import 'package:food_panda/views/home/models/restaurant.dart';
import 'package:food_panda/views/home/repository/restaurant_repo.dart';
import 'package:provider/provider.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({
    required this.restaurant,
  });

  Datum? restaurant;
  static String baseUrl = "https://cms.istad.co";

  @override
  Widget build(BuildContext context) {

    // var restaurantViewModel = RestaurantViewModel();


    return InkWell(
      // onLongPress: (){
      //   showModalBottomSheet(
      //       context: context,
      //       builder: (context){
      //         return Container(
      //           width: double.infinity,
      //           height: 150,
      //           color: Colors.pinkAccent.shade100,
      //           child: Column(
      //             children: [
      //               const Text('Are you sure to remove this Restaurant?',
      //               style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20),
      //               ),
      //               TextButton(onPressed: (){
      //                 // restaurantViewModel.deleteRestaurant(restaurant!.id);
      //               }, child: const Text('Yes')),
      //               TextButton(onPressed: (){}, child: const Text('No')),
      //             ],
      //           ),
      //         );
      //       },
      //   );
      // },

      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddRestaurant(isFromUpdate: true, restaurant: restaurant)),
        );
      },
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
                  // child: restaurant.attributes!.picture!.data!.attributes!.formats!= null  && restaurant.attributes!.picture!.data!.attributes!.formats!.medium!=null && restaurant.attributes!.picture!.data!.attributes!.formats!.medium!.url!=null? Image.network('https://cms.istad.co${restaurant.attributes!.picture!.data!.attributes!.formats!.medium!.url!}'):Image.asset('assets/images/chicken.png'),
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Image.network(
                      '$baseUrl${restaurant!.attributes!.picture!.data!.attributes!.url!}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 18,
                  child: Container(
                    padding: const EdgeInsets.only(right: 12, top: 8, left: 8, bottom: 8),
                    decoration: const BoxDecoration(
                        color: Colors.black87,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )
                    ),
                    child: Text('${restaurant!.attributes!.deliveryTime.toString()} min', style: const TextStyle(
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
            Text(restaurant!.attributes!.name.toString(),overflow: TextOverflow.ellipsis, maxLines: 1 , style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 5),
            Text('\$\$\$ ${restaurant!.attributes!.category!}'),
            const SizedBox(height: 5),
            Text('\$${restaurant!.attributes!.deliveryFee.toString()} delivery fee', style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
          ],
        ),
      ),
    );
  }
}

