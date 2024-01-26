part of 'all_room_bloc.dart';

@freezed
class AllRoomState with _$AllRoomState {
  const factory AllRoomState.initial() = _Initial;
  const factory AllRoomState.loading() = _Loading;
  const factory AllRoomState.loaded(List<Room> rooms) = _Loaded;
  const factory AllRoomState.error(String message) = _Error;
}
