import 'package:dio/dio.dart';
import '../models/event_model.dart';

class EventerServices {
  final dio = Dio();

  Future<List<EventModel>> fetchData() async {
    Response response = await dio.get('http://localhost:3000/events');
    final data =
        (response.data as List).map((e) => EventModel.fromJson(e)).toList();
    return data;
  }

  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
