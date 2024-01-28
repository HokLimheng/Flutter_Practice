import 'package:food_panda/data/network/api_service.dart';
import 'package:food_panda/res/app_url.dart';
import 'package:food_panda/views/business_owner/models/request/restaurantRequest.dart';
import '../models/restaurant.dart';

class RestaurantRepository {
  var apiService = ApiService();

  Future<dynamic> postRestaurant(data, {isUpdate, id}) async {
    print('restaurant id $id');
    var restaurantRequest = restaurantRequestToJson(data);
    var url = isUpdate ? '${AppUrl.postRestaurant}/$id' : AppUrl.postRestaurant;
    dynamic response = await apiService.postRestaurant(url, restaurantRequest, isUpdate);
    return response;
  }

  Future<Restaurant> getAllRestaurants() async{
    try{
      dynamic response = await apiService.getApi(AppUrl.getAllRestaurant);
      print(restaurantFromJson(response));
      return restaurantFromJson(response);
    } catch(exception){
      rethrow;
    }
  }

  Future<dynamic> deleteRestaurant(id) async{
    dynamic response = await apiService.deleteRestaurant('${AppUrl.postRestaurant}/$id');
    return response;
  }
}