import 'dart:developer';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'photo_model.dart';

class ApiService {
  Future<List<PhotoModel>?> getPhotos() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if(response.statusCode == 200) {
        List<PhotoModel> _model = photoModelFromJson(response.body);
        return _model;
      }
      } catch(e) {
      log(e.toString());
    }
  }
}