// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_fic12_onlineshop/data/datasources/room_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/room_response_model.dart';

part 'all_room_bloc.freezed.dart';
part 'all_room_event.dart';
part 'all_room_state.dart';

class AllRoomBloc extends Bloc<AllRoomEvent, AllRoomState> {
  final RoomRemoteDatasource _roomRemoteDatasource;
  AllRoomBloc(
    this._roomRemoteDatasource,
  ) : super(_Initial()) {
    on<_GetAllRoom>((event, emit) {
    });
  }
}
