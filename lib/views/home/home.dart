import 'package:flutter/material.dart';
import 'package:food_panda/data/response/status.dart';
import 'package:food_panda/views/business_owner/add_restaurant.dart';
import 'package:food_panda/views/home/skeletons/restaurant_ske.dart';
import 'package:food_panda/views/home/viewmodels/restaurant_vm.dart';

import 'package:food_panda/views/home/widgets/drawer.dart';
import 'package:food_panda/views/home/widgets/restaurant_card.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20)
  );

  var _restaurantViewModel = RestaurantViewModel();

  @override
  void initState() {
    super.initState();
    _restaurantViewModel.getAllRestaurant();

    //Remove this method to stop OneSignal Debugging
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize("69f1942a-d5b2-4173-bdfc-2ee69038e5ca");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.Notifications.requestPermission(true);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2 St 24'),
            Text(
              'Phnom Penh',
              style: TextStyle(fontSize: 12),
            ),
          ],

        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AddRestaurant(isFromUpdate: false)
                )
            );
          }, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
        ],
        backgroundColor: Colors.pinkAccent,

      ),
      drawer: const myDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Delivery
            Container(
              margin: const EdgeInsets.all(13),
              padding: const EdgeInsets.only(top: 15, bottom: 5, right: 15, left: 15),
              width: double.infinity,
              decoration: boxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Food Delivery', style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const Text('Order food you love', style: TextStyle(
                    fontSize: 13,
                  ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/images/burger.png',
                    fit: BoxFit.contain,
                    width: 100,
                    height: 100,
                    ),
                  ),
                ],

              ),
            ),

            // Second Section
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 12, right: 15, left: 15),
                    margin: const EdgeInsets.only(right: 7.5, top: 0, left: 15),
                    height: 300,
                    decoration: boxDecoration,
                    width: double.infinity,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shops', style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            Text('Groceries and more', style: TextStyle(
                              fontSize: 13,
                            ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('assets/images/burger.png',
                            fit: BoxFit.contain,
                            height: 110,
                            width: 110,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 5, right: 10, left: 20),
                            decoration: boxDecoration,
                            margin: const EdgeInsets.only(right: 15, top: 0, bottom: 7.5, left: 7.5),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                    Text('Pick-up', style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text('Up to 50% off', style: TextStyle(
                                      fontSize: 13,
                                    ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset('assets/images/pickup.png',
                                    fit: BoxFit.contain,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: boxDecoration,
                            margin: const EdgeInsets.only(right: 15, top: 7.5, bottom: 0, left: 7.5),
                            padding: const EdgeInsets.only(top: 15, bottom: 5, right: 8, left: 20),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('PandaSend', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text('Express', style: TextStyle(
                                      fontSize: 13,
                                    ),
                                    ),
                                    Text('Delivery', style: TextStyle(
                                      fontSize: 13,
                                    ),
                                    ),

                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset('assets/images/burger.png',
                                    fit: BoxFit.contain,
                                    width: 70,
                                    height: 70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Center(
              child: const Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text('Recommended for you', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
              ),
            ),

            // Top restaurant
              SizedBox(
                height: 350,
                child: ChangeNotifierProvider(
                  create: (context) => _restaurantViewModel,
                  child: Consumer<RestaurantViewModel>(
                    builder: (context, viewModel, _){
                      switch(viewModel.response.status!){
                        case Status.LOADING:
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) => const RestaurantCardSkeleton()
                          );
                        case Status.COMPLETED:
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                print('test: ${viewModel.response}');
                            var restaurant = viewModel.response.data!.data![index];
                                return RestaurantCard(restaurant: restaurant);
                              }
                          );
                        case Status.ERROR:
                          return const Center(child: Text('Error'));
                      }
                    }
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}

