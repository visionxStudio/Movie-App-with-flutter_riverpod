import 'package:get_it/get_it.dart';
import 'package:movieapp/src/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;
  late HttpService httpService;

  MovieService() {
    httpService = getIt.get<HttpService>();
  }
}
