import 'package:flutter_test/flutter_test.dart';
import 'package:integration_with_loc/providers/welcome_provider.dart';


void main(){
  test("getDataFromAPI returns expected data",  () async{
    final provider = welcomeProvider();

    await provider.getDataFromAPI();

    expect(provider.isLoading, false);

    if (provider.error.isEmpty){
      expect(provider.welcome.entries, isNotEmpty);
    }else {
      expect(provider.error, isNotEmpty);
    }
  });
}