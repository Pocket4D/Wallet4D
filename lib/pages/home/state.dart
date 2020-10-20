import 'package:dva_dart/dva_dart.dart';

enum HomeModelStatus { Query, Init, Loading, Success, Error }

class HomeModelState implements DvaState {
  HomeModelStatus status = HomeModelStatus.Query;
  HomeModelState.query() {
    setStatus(HomeModelStatus.Query);
  }

  HomeModelState();

  HomeModelState.init() {
    setStatus(HomeModelStatus.Init);
  }

  HomeModelState.loading() {
    setStatus(HomeModelStatus.Loading);
  }

  HomeModelState.loadJson({Map<String, dynamic> json, String indexPage}) {
    setStatus(HomeModelStatus.Success);
  }

  void setStatus(HomeModelStatus value) {
    if (value != null) {
      status = value;
    }
  }

  HomeModelState copy() {
    return HomeModelState();
  }

  static HomeModelState reducer(
      HomeModelState lastState, HomeModelState nextState) {
    HomeModelState returnState = lastState.copy();
    returnState..setStatus(nextState.status);
    return returnState;
  }

  @override
  DvaState clone() {
    // TODO: implement clone
    return this;
  }
}
