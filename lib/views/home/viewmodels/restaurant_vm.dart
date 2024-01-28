import 'package:flutter/foundation.dart';
import 'package:food_panda/data/response/api_response.dart';
import 'package:food_panda/views/home/models/restaurant.dart';
import 'package:food_panda/views/home/repository/restaurant_repo.dart';

class RestaurantViewModel extends ChangeNotifier{
  final _restaurantRepo = RestaurantRepository();
  ApiResponse<dynamic> response = ApiResponse.loading();
  // var deleteResponse = ApiResponse();

  setRestaurantList(response){
    this.response = response;
    notifyListeners();
  }

  // setDeleteResponse(response){
  //   deleteResponse = response;
  //   notifyListeners();
  // }
  //
  // Future<dynamic> deleteRestaurant(id) async{
  //   await _restaurantRepo.deleteRestaurant(id)
  //       .then((data) => setDeleteResponse(ApiResponse.completed(data)))
  //       .onError((error, stackTrace) => setDeleteResponse(ApiResponse.error(stackTrace.toString())));
  // }

  Future<dynamic> getAllRestaurant() async{
    await _restaurantRepo.getAllRestaurants()
        .then((restaurant) => setRestaurantList(ApiResponse.completed(restaurant)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(stackTrace.toString())));
  }


}