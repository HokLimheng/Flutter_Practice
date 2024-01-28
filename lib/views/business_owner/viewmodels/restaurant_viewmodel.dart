import 'package:flutter/foundation.dart';
import 'package:food_panda/data/response/api_response.dart';
import 'package:food_panda/views/home/repository/restaurant_repo.dart';

class RestaurantViewModel extends ChangeNotifier {
  final _restaurantRepo = RestaurantRepository();
  var response = ApiResponse();

  setRestaurantData(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> postRestaurant(data, {isUpdate, id})  async{
    setRestaurantData(ApiResponse.loading());
    await _restaurantRepo.postRestaurant(data, isUpdate: isUpdate, id: id)
        .then((isPosted) => setRestaurantData(ApiResponse.completed(isPosted)))
        .onError((error, stackTrace) => setRestaurantData(ApiResponse.error(stackTrace.toString())));
  }
}