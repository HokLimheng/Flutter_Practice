import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_panda/data/response/status.dart';
import 'package:food_panda/views/business_owner/models/request/restaurantRequest.dart';
import 'package:food_panda/views/business_owner/viewmodels/image_viewmodel.dart';
import 'package:food_panda/views/business_owner/viewmodels/restaurant_viewmodel.dart';
import 'package:food_panda/views/home/models/restaurant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRestaurant extends StatefulWidget {
  AddRestaurant({this.isFromUpdate, this.restaurant});

  bool? isFromUpdate;
  Datum? restaurant;

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {

  bool? isPicked;
  var imageFile;
  final _imageViewModel = ImageViewModel();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final discountController = TextEditingController();
  final deliveryTimeController = TextEditingController();
  final deliveryFeeController = TextEditingController();
  final _restaurantViewModel = RestaurantViewModel();
  var imageId;
  var restaurantId;

  @override
  void initState() {
    super.initState();
    checkIfFromUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){_getImageFromSource(source: 'camera');}, icon: Icon(Icons.camera_alt_outlined)),
                          IconButton(onPressed: (){_getImageFromSource(source: 'gallery');}, icon: Icon(Icons.photo)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: ChangeNotifierProvider(
                        create: (context) => _imageViewModel,
                        child: Consumer<ImageViewModel>(
                          builder: (ctx, viewModel, _){

                            if(widget.isFromUpdate!){

                              return InkWell(
                                  onTap: () {
                                    _getImageFromSource(source: 'camera');
                                  },
                                child: Image.network(
                                  'https://cms.istad.co${widget.restaurant!.attributes!.picture!.data!.attributes!.url}',
                                  fit: BoxFit.contain,
                                ),
                              );
                            }

                            if(viewModel.response.status == null){
                              return Image.network('https://images.freeimages.com/images/large-previews/cfd/picture-frame-1230741.jpg', fit: BoxFit.contain,);
                            }
                            switch(viewModel.response.status!){
                              case Status.LOADING:
                                return const Center(child: CircularProgressIndicator(),
                                );
                              case Status.COMPLETED:
                                imageId = viewModel.response.data[0].id;
                                return InkWell(
                                  onTap: () {
                                    _getImageFromSource(source: 'camera');
                                  },
                                  child: SizedBox(
                                    width: 300,
                                    height: 200,
                                    child: Image.network("https://cms.istad.co${viewModel.response.data[0].url!}"),
                                  ),
                                );
                              case Status.ERROR:
                                return Text(viewModel.response.message!);
                            }
                          },
                        ),
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                        ),
                      ),
                    ),
                    // Category
                    const SizedBox(height: 10),
                    TextField(
                      controller: categoryController,
                      decoration: InputDecoration(
                        hintText: 'Category',
                        border: OutlineInputBorder(
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Discount
                    TextField(
                      controller: discountController,
                      decoration: InputDecoration(
                        hintText: 'Discount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Delivery Time
                    TextField(
                      controller: deliveryTimeController,
                      decoration: InputDecoration(
                        hintText: 'Time',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Delivery fee
                    TextField(
                      controller: deliveryFeeController,
                      decoration: InputDecoration(
                        hintText: 'deliveryFee',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => _restaurantViewModel,
                      child: Consumer<RestaurantViewModel>(
                        builder: (ctx, viewModel, _){

                          if(viewModel.response.status == null){
                            return ElevatedButton(
                              onPressed: (){
                                _saveRestaurant();
                              },
                              child: widget.isFromUpdate! ?  const Text('Update') :  const Text('Save'),
                            );
                          }

                          switch(viewModel.response.status!){
                            case Status.LOADING:
                              return const Center(child: CircularProgressIndicator());
                            case Status.COMPLETED:
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Post Success')),
                                );
                              });
                              return ElevatedButton(
                                onPressed: (){
                                  _saveRestaurant();
                                  },
                              child: const Text('save'),
                              );
                            case Status.ERROR:
                              return Text(viewModel.response.message!);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getImageFromSource({source}) async {

    XFile? pickedFile = await ImagePicker().pickImage(
        source: source == 'gallery' ? ImageSource.gallery : ImageSource.camera,
    );
    if(pickedFile != null){
      // uploading image to server
      _imageViewModel.uploadingImage(pickedFile.path);
      // setState(() {
      //   isPicked = true;
      //   imageFile = File(pickedFile.path);
      // });
    }
  }

  void _saveRestaurant() {
    var restaurantRequest = RestaurantRequest(
      data: DataRequest(
        name: nameController.text,
        category: categoryController.text,
        discount: int.parse(discountController.text),
        deliveryTime: int.parse(deliveryTimeController.text),
        deliveryFee: double.parse(deliveryFeeController.text),
        picture: imageId.toString()
      )
    );
    _restaurantViewModel.postRestaurant(restaurantRequest,
          isUpdate: widget.isFromUpdate,
          id: restaurantId
    );
  }

  void checkIfFromUpdate(){
    if(widget.isFromUpdate!){
      nameController.text = widget.restaurant!.attributes!.name!;
      categoryController.text = widget.restaurant!.attributes!.category!;
      discountController.text = widget.restaurant!.attributes!.discount!.toString();
      deliveryTimeController.text = widget.restaurant!.attributes!.deliveryTime!.toString();
      deliveryFeeController.text = widget.restaurant!.attributes!.deliveryFee!.toString();
      imageId = widget.restaurant!.attributes!.picture!.data!.id;
      restaurantId = widget.restaurant!.id;
    }
  }
}
