import 'package:flutter/foundation.dart';
import 'package:todo/model/data_model.dart';
import 'package:todo/services/service_class.dart';

class DataClass extends ChangeNotifier {
  DataModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getSinglePostData())!;
    loading = false;

    notifyListeners();
  }
}