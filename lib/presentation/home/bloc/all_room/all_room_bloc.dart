// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/home_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_fic12_onlineshop/data/model/responses/room_response_model.dart';

part 'all_room_bloc.freezed.dart';
part 'all_room_event.dart';
part 'all_room_state.dart';

class AllRoomBloc extends Bloc<AllRoomEvent, AllRoomState> {
  final HomeRemoteDatasource _homeRemoteDatasource;
  AllRoomBloc(
    this._homeRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetAllRoom>((event, emit) async {
      emit(const AllRoomState.loading());
      final response = await _homeRemoteDatasource.getRooms();
      response.fold(
        (l) => emit(AllRoomState.error(l)),
        (r) => emit(AllRoomState.loaded(r.data!)),
      );
    });
  }
}
