import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/components/grid_view_product.dart';
import 'package:flutter_fic12_onlineshop/core/components/search.dart';
import 'package:flutter_fic12_onlineshop/core/components/title_section.dart';
import 'package:flutter_fic12_onlineshop/core/constants/styles.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/all_room/all_room_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/widgets/rooms.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/widgets/stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _seacrhHomeController;

  @override
  void initState() {
    _seacrhHomeController = TextEditingController();
    context.read<AllRoomBloc>().add(const AllRoomEvent.getAllRoom());
    context.read<AllProductBloc>().add(const AllProductEvent.getAllProducts());
    super.initState();
  }

  @override
  void dispose() {
    _seacrhHomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 56,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 16,
                right: 16,
              ),
              child: Center(
                child: Text(
                  'OP Warnet Store',
                  style: heading1semi,
                ),
              ),
            ),
            Search(seacrhController: _seacrhHomeController),
            const Stories(),
            BlocBuilder<AllRoomBloc, AllRoomState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (rooms) => Rooms(rooms: rooms),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (message) => Center(
                    child: Text(message),
                  ),
                  orElse: () => const SizedBox(),
                );
              },
            ),
            const TitleSection(
              name: 'popular',
            ),
            BlocBuilder<AllProductBloc, AllProductState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (products) => GridViewProduct(products: products),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (message) => Center(
                    child: Text(message),
                  ),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
