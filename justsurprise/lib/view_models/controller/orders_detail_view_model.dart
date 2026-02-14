import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justsurprise/view_models/controller/add_product_review_view_model.dart';
import '../../model/order_detail_response-model.dart';
import '../../repository/ApiRepository.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import 'orders_fragment_view_model.dart';

class OrdersDetailViewModel extends GetxController {
  final _api = ApiRepository();
  RxBool isConnected = false.obs;
  RxString deliveryDate = 'Select Delivery Date'.obs;
  RxString deliveryTime = 'Time'.obs;
  final ordersVM = Get.find<OrdersFragmentViewModel>();
  final addProductReviewsVM = AddProductReviewsViewModel().obs;
  final orderDetailResponseData = OrderDetailResponseModel().obs;
  int index = 0;
  RxDouble Rating1 = 0.0.obs;
  final TitleController = TextEditingController().obs;
  final DescriptionController1 = TextEditingController().obs;

  void setOrderDeatil(OrderDetailResponseModel responseModel){
    orderDetailResponseData.value = responseModel;
  }

  void setAddProductReviews(AddProductReviewsViewModel responseModel){
    addProductReviewsVM.value = responseModel;
  }



  void filePicker() async {
    FilePickerResult? Results = await FilePicker.platform.pickFiles();
    print(Results?.files);
  }

  Future<void> orderDetailApi(BuildContext context, String orderid) async {
    Map data = {
    "order_id" : orderid,
  };
    _api.orderDetailApi(data).then((value) {
      setOrderDeatil(value);
      Utils.flushBarErrorMessage(value.message!, context);
      Get.toNamed(RoutesName.ordersDetailScreen);
    },).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
    },);

  }

  Future<void> addProductReviewsApi(BuildContext context ,String category_id, String product_id, String rating, var image, String title, String description, String delivery,String occasion) async {
    Map data = {
      "category_id" : category_id,
      "product_id" : product_id,
      "rating" : rating,
      "image" : image,
      "title" : title,
      "description" : description,
      "delivery" : delivery,
      "occasion" : occasion,
    };
    _api.addProductReviewsApi(data).then((value) {
        setAddProductReviews(value);
      Utils.flushBarErrorMessage(value.message!, context);
      print(value.message);
    },).onError((error, stackTrace) {
      print(error);
      // Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }

}


class ImagePickerController extends GetxController{

  RxString imapgePath = "".obs;

  Future getImage()async{
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      imapgePath.value = image.path.toString();
    }
  }
// FileImage(File(imagePicker.imapgePath.value)),

}
