import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/room_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/navigation/app_navigation.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/all_room/all_room_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllRoomBloc(RoomRemoteDatasource()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppNavigation.router,
        debugShowCheckedModeBanner: false,
        // routerDelegate: router.routerDelegate,
        // routeInformationParser: router.routeInformationParser,
        // routeInformationProvider: router.routeInformationProvider,
        // routerConfig: AppNavigation.router,
      ),
    );
  }
}
