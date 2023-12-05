import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/model/data_model.dart';

class DataServices {
  //String baseUrl = 'http://mark.bslmeiyu.com';
  Future<List<DataModel>> getInfo() async {
    await Future.delayed(Duration(seconds: 1));
    //var apiUrl = '/getplaces';
    return [
      DataModel(
          name: 'sanna',
          img: "sanna.png",
          price: 150,
          people: 4,
          stars: 4,
          decoration:
              'One of the most service location city in the word by the time we are here ',
          location: 'Yemen,Sanna'),
      DataModel(
          name: 'Aden',
          img: "aden.png",
          price: 100,
          people: 3,
          stars: 3,
          decoration:
              'There are many variations of passages of Lorem Ipsum available, but the cted humour,  ',
          location: 'Yemen,Aden'),
      DataModel(
          name: 'mucklla',
          img: "mucklla.jpeg",
          price: 70,
          people: 3,
          stars: 2,
          decoration:
              'There are many variations of passages of Lorem Ipsum available, but the cted humour,  ',
          location: 'Yemen,Aden'),
    ];
    // http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    // try {
    //   if (200 == 20) {
    //     List<DataModel> list = [
    //       DataModel(
    //           name: 'صنعاء',
    //           img: "",
    //           price: 250,
    //           people: 10,
    //           stars: 4,
    //           decoration: 'تعتبر من اجمل المناطق السياحية عالميا ',
    //           location: 'اليمن')
    //     ];
    //     //json.decoder(res.body);

    //     return list; //list.map((e) => DataModel.fromjson(e)).toList();
    //   } else {
    //     return <DataModel>[];
    //   }
    // } catch (e) {
    //   print(e);
    //   return <DataModel>[];
    // }
  }
}
