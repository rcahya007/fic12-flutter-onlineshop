import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/assets/assets.gen.dart';
import 'package:flutter_fic12_onlineshop/core/components/empty_page.dart';
import 'package:flutter_fic12_onlineshop/presentation/bloc/change_index_menu/change_index_menu_bloc.dart';
import 'package:go_router/go_router.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyPage(
        title: 'saved items',
        descriptionPage: 'nothing saved...',
        detailPage:
            '... no worries. Start saving as you shop by clicking the little heart',
        textButton: 'Start Shopping',
        urlImage: Assets.images.surprised.path,
        onTap: () {
          context
              .read<ChangeIndexMenuBloc>()
              .add(const ChangeIndexMenuEvent.changeIndexMenu(0));
          context.goNamed('home');
        },
      ),
    );
  }
}
