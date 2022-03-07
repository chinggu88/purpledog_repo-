import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:purpledog_repo/repository/itemlist.dart';

class Home_controller extends GetxController {
  static Home_controller get to => Get.find();

  itemlist list = new itemlist();
  //메인리스트 로딩유무
  RxBool isloading = false.obs;
  //상세검색 로딩유무
  RxBool detailloading = false.obs;
  //1차카테고리 리스트
  var listitem = <int>[].obs;
  //상세내용
  RxMap<String, dynamic> itemdetail = <String, dynamic>{}.obs;
  //선택1차 카테고리 선택목록
  RxInt selectindex = (-1).obs;
  //1차 카테고리
  RxString selectString = "topstories".obs;
  //listview controller
  IndexedScrollController viewscroll = IndexedScrollController();
  //스크롤위치
  RxDouble scrollloc = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //1차 카테고리 초기 리스트 불러오기
    changelist('topstories');
    //리스트뷰 컨트롤로 등록
    event();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    listitem.clear();
    itemdetail.clear();
    selectindex(-1);
    viewscroll.dispose();
    selectString('topstories');
  }

  event() {
    viewscroll.addListener(() {
      //사용자가 사용중인 스크롤 위치 저장
      scrollloc(viewscroll.position.pixels);

      if (viewscroll.position.pixels < 0) {
        viewscroll.jumpTo(0.0);
      }
      if (viewscroll.position.pixels > viewscroll.position.maxScrollExtent) {
        viewscroll.jumpTo(viewscroll.position.maxScrollExtent);
      }
    });
  }

  //1차 카테고리 불러오기
  void changelist(String key) {
    isloading(true);
    selectString(key);
    itemdetail.clear();
    selectindex(-1);
    list.fetchlist(key).then((value) {
      listitem(value);
      isloading(false);
    });
  }

  //상세내용 불러오기
  void getDetail(String key, int index) {
    detailloading(true);
    selectindex(index);
    list.fetchlistDetail(key).then((value) {
      itemdetail(value);
      detailloading(false);
    });
    //1차 카테고리 초기 불러오기
    list.fetchlist(selectString.value).then((value) {
      listitem(value);
    });
    //리스트 scroll 위치 이동
    viewscroll.jumpTo(scrollloc.value);
  }
}
