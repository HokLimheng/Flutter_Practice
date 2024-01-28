import 'package:flutter/foundation.dart';
import 'package:food_panda/data/response/api_response.dart';
import 'package:food_panda/views/business_owner/repository/image_repo.dart';

class ImageViewModel extends ChangeNotifier {
  final _imageRepo = ImageRepository();
  ApiResponse<dynamic> response = ApiResponse();

  setImageData(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> uploadingImage(image) async {
    setImageData(ApiResponse.loading());
    await _imageRepo.uploadImage(image)
        .then((images) => setImageData(ApiResponse.completed(images)))
        .onError((error, stackTrace) => setImageData(ApiResponse.error(stackTrace.toString())));
  }


}