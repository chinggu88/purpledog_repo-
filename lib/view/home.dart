import 'package:clay_containers/clay_containers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:purpledog_repo/controller/home_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      body: Row(
        children: [
          SizedBox(
            width: Get.size.width * 0.1,
          ),
          Column(
            children: [
              SizedBox(
                height: Get.size.height * 0.1,
              ),
              Container(
                width: Get.size.width * 0.8,
                height: Get.size.height * 0.08,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    items: [
                      "topstories",
                      "newstories",
                      "askstories",
                      "showstories",
                      "jobstories"
                    ]
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontFamily: 'Pre-Bold',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: Home_controller.to.selectString.value,
                    onChanged: (value) {
                      Home_controller.to.changelist(value as String);
                    },
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Color(0xFFf2f2f2),
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Container(
                  width: Get.size.width * 0.8,
                  height: Get.size.height * 0.2,
                  child: Obx(
                    () {
                      return _catetorylist();
                    },
                  )),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Container(
                width: Get.size.width * 0.8,
                height: Get.size.height * 0.45,
                child: Obx(() {
                  return Home_controller.to.itemdetail.value.isEmpty
                      ? ClayContainer(
                          height: Get.size.height * 0.45,
                          child: Center(
                              child: Text("1차카테고리를 선택해주세요~",
                                  style: TextStyle(
                                    fontFamily: 'Pre-Bold',
                                    fontSize: 22,
                                  ))),
                        )
                      : ClayContainer(
                          borderRadius: 20,
                          child: SingleChildScrollView(child: _detailvalue()),
                        );
                  // return Container(child: detailvalue());
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //1차카고리 결과 리스트
  Widget _catetorylist() {
    if (Home_controller.to.isloading.value) {
      return Center(child: Text("로딩중..."));
    }
    if (Home_controller.to.listitem.isEmpty) {
      return Center(child: Text("인터넷을 확인해주세요.."));
    }
    return IndexedListView.builder(
        scrollDirection: Axis.horizontal,
        minItemCount: 0,
        maxItemCount: Home_controller.to.listitem.length,
        controller: Home_controller.to.viewscroll,
        itemBuilder: (context, index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () => Home_controller.to.getDetail(
                    Home_controller.to.listitem[index].toString(), index),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: ClayContainer(
                    width: Get.size.height * 0.2,
                    height: Get.size.height * 0.2,
                    borderRadius: 20,
                    customBorderRadius: BorderRadius.circular(10),
                    surfaceColor: index == Home_controller.to.selectindex.value
                        ? Colors.purple
                        : Color(0xFFf2f2f2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Home_controller.to.listitem[index].toString(),
                            style: TextStyle(
                              color:
                                  index == Home_controller.to.selectindex.value
                                      ? Colors.white
                                      : Colors.black,
                              fontFamily: 'Pre-Bold',
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          );
        });
  }

  //1차 카테고리 결괴 list 상세 정보
  Widget _detailvalue() {
    List<Widget> widgetlist = [];
    widgetlist.add(SizedBox(
      height: 20,
    ));
    Home_controller.to.detailloading.value
        ? widgetlist.add(Text("로딩중..."))
        : Home_controller.to.itemdetail.forEach((key, value) {
            widgetlist.add(Container(
              padding: EdgeInsets.all(10),
              width: Get.size.width * 0.8,
              child: Text('${key.toString()} :: ${value.toString()}',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold)),
            ));
          });

    return Column(
      children: widgetlist,
    );
  }
}
