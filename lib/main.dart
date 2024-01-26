import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/core/constants/colors.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/room_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/all_room/all_room_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/home_screen',
          name: 'home_screen',
          builder: (context, state) => const HomePage(),
        ),
      ],
      initialLocation: '/home_screen',
      debugLogDiagnostics: true,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllRoomBloc(RoomRemoteDatasource()),
        ),
        // BlocProvider(
        //   create: (context) => CategoryBloc(CategoryRemoteDatasource()),
        // ),
        // BlocProvider(
        //   create: (context) => AllProductBloc(ProductRemoteDatasource()),
        // ),
        // BlocProvider(
        //   create: (context) => BestSellerProductBloc(ProductRemoteDatasource()),
        // ),
        // BlocProvider(
        //   create: (context) =>
        //       SpecialOfferProductBloc(ProductRemoteDatasource()),
        // ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
