abstract class HomeStates {}

class HomeInitializeState extends HomeStates {}

class HomeChangeNavigationBarState extends HomeStates {}

class HomeLoadingBusinessNewsState extends HomeStates {}

class HomeSuccessBusinessNewsState extends HomeStates {}

class HomeErrorBusinessNewsState extends HomeStates {
  final String error;

  HomeErrorBusinessNewsState(this.error);
}
class HomeLoadingAppleNewsState extends HomeStates {}

class HomeSuccessAppleNewsState extends HomeStates {}

class HomeErrorAppleNewsState extends HomeStates {
  final String error;

  HomeErrorAppleNewsState(this.error);
}
class HomeLoadingStreetNewsState extends HomeStates {}

class HomeSuccessStreetNewsState extends HomeStates {}

class HomeErrorStreetNewsState extends HomeStates {
  final String error;

  HomeErrorStreetNewsState(this.error);
}

class HomeLoadingSearchNewsState extends HomeStates {}

class HomeSuccessSearchNewsState extends HomeStates {}

