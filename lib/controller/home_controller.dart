import 'package:get/get.dart';
import 'package:purpledog_repo/model/item.dart';
import 'package:purpledog_repo/repository/itemlist.dart';

class Home_controller extends GetxController {
  static Home_controller get to => Get.find();
  itemlist list = new itemlist();
  RxString title = "홈컨트롤러".obs;
  RxBool isloading = false.obs;
  //1차카테고리 리스트
  var listitem = <int>[].obs;
  //상세내용
  dynamic? itemdetail = null.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isloading(true);
    list.fetchlist('topstories').then((value) {
      listitem(value);
      isloading(false);
    });
  }

  void changelist(String key) {
    isloading(true);
    list.fetchlist(key).then((value) {
      listitem(value);
      isloading(false);
    });
  }

  void getDetail(String key) {
    list.fetchlistDetail(key).then((value) {
      itemdetail(value);
      isloading(false);
    });
  }
}
