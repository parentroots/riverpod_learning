import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/greeting/repository/api_service.dart';

final greetingProvide=Provider((ref)=>GreetingApiService());

final greetingFutureProvider=FutureProvider((ref){

  final apiService=ref.read(greetingProvide);
  return apiService.fetchGreeting();

});
