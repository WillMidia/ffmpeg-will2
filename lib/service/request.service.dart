import 'package:dio/dio.dart';
import '../domain/tip.dart';

class RequestService {
  final _host = "https://gdapp.com.br/api";

  Future<bool> sendTipData(Tip tip) async {
    final dio = Dio();
    try {
      await dio.post('$_host/sustainable-tips', data: tip.toJson());
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<List<Tip>> fetchTips() async {
    final dio = Dio();
    try {
      final response = await dio.get('$_host/sustainable-tips');
      return (response.data as List).map((json) => Tip.fromJson(json)).toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
