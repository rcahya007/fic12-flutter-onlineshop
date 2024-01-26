part of 'all_room_bloc.dart';

@freezed
class AllRoomEvent with _$AllRoomEvent {
  const factory AllRoomEvent.started() = _Started;
  const factory AllRoomEvent.getAllRoom() = _GetAllRoom;
}