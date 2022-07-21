import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends FutureViewModel {
  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) => _appVersion = value;
  // final ApiService _apiService = locator<ApiService>();

  @override
  Future futureToRun() async => {
        //  appVersion = (await _apiService.getAppVersion())["version"],
      };

  @override
  void onError(error) {
    // print(error);
    setBusy(false);
  }
}
