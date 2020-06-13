import 'package:f10_bootcamp/covid_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Global info test', () async {
    CovidApi api = CovidApi();
    var globalInfo = await api.getGlobalInfo();
    print(globalInfo.cases);
  });
}
