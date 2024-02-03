// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_fic12_onlineshop/data/datasources/address_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/model/responses/address_response_model.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRemoteDatasource _addressRemoteDatasource;
  AddressBloc(
    this._addressRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetAddressByUser>((event, emit) async {
      emit(const AddressState.loading());
      final response = await _addressRemoteDatasource.getAddress();

      response.fold(
        (l) => emit(AddressState.error(l)),
        (r) => emit(AddressState.loaded(r.data ?? [])),
      );
    });
  }
}
