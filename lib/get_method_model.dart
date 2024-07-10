import 'package:api_get_api_models/services.dart';
import 'package:flutter/material.dart';

class GetMothodWithoutModel extends StatefulWidget {
  const GetMothodWithoutModel({super.key});

  @override
  State<GetMothodWithoutModel> createState() => _GetMothodWithoutModelState();
}

class _GetMothodWithoutModelState extends State<GetMothodWithoutModel> {
  dynamic postModelData = [];
  bool isLoadin = false;
  getPost() {
    isLoadin = true;
    ApiService().getRequestWithoutModel().then((value) {
      setState(() {
        postModelData = value;
        isLoadin = false;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Method Without Model"),
      ),
      body: isLoadin
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postModelData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          userInfo(
                            index,
                            "Name :",
                            postModelData[index]["name"].toString(),
                          ),
                          userInfo(
                            index,
                            "Email :",
                            postModelData[index]["email"].toString(),
                          ),
                          userInfo(
                            index,
                            "City :",
                            postModelData[index]["address"]["city"].toString(),
                          ),
                          userInfo(
                            index,
                            "Street :",
                            postModelData[index]["address"]["street"]
                                .toString(),
                          ),
                          userInfo(
                            index,
                            "Phone :",
                            postModelData[index]["phone"].toString(),
                          ),
                          userInfo(
                            index,
                            "Name :",
                            postModelData[index]["name"].toString(),
                          ),
                          userInfo(
                            index,
                            "Website :",
                            postModelData[index]["website"].toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }

  Row userInfo(int index, name, value) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
