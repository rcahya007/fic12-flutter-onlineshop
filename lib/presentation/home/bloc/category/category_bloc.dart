// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/home_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_fic12_onlineshop/data/model/responses/category_response_model.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final HomeRemoteDatasource _homeRemoteDatasource;
  CategoryBloc(
    this._homeRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      emit(const CategoryState.loading());
      final response = await _homeRemoteDatasource.getCategories(event.roomId);
      response.fold(
        (l) => emit(
          CategoryState.error(l),
        ),
        (r) => emit(
          CategoryState.loaded(
            r.data!,
          ),
        ),
      );
    });
  }
}
