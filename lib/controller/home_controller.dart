import 'package:get/get.dart';
import 'package:purpledog_repo/repository/itemlist.dart';

class Home_controller extends GetxController {
  static Home_controller get to => Get.find();

  
  itemlist list = new itemlist();
  //메인리스트 검색
  RxBool isloading = false.obs;

  //1차카테고리 리스트
  var listitem = <int>[].obs;
  //상세내용
  RxMap<String,dynamic> itemdetail = <String,dynamic>{}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isloading(true);
    //1차 카테고리 초기 불러오기
    list.fetchlist('topstories').then((value) {
      listitem(value);
      isloading(false);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    listitem.clear();
    itemdetail.clear();
  }

  //1차 카테고리 불러오기
  void changelist(String key) {
    isloading(true);
    list.fetchlist(key).then((value) {
      listitem(value);
      isloading(false);
    });
  }

  //상세내용 불러오기
  void getDetail(String key) {
    list.fetchlistDetail(key).then((value) {
      itemdetail(value);
      isloading(false);
    });
  }
}
