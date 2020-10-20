import 'dart:convert';

import 'package:dva_dart/dva_dart.dart';

import 'state.dart';

DvaModel homeModel = DvaModel(
  // namespace
  nameSpace: 'homeModel',
  // initialState
  initialState: HomeModelState.query(),
  // reducers
  reducers: {
    'updateState': (HomeModelState state, Payload<HomeModelState> payload) {
      return HomeModelState.reducer(state, payload.payload);
    },
  },
// effects
  effects: {
    'initBasicChannel': (Payload<Null> payload) async* {
      yield PutEffect(
          key: 'updateState', payload: Payload<HomeModelState>(HomeModelState.loading()));
    }
  },
);
