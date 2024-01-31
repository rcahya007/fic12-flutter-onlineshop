import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/home_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/data/datasources/product_remote_datasource.dart';
import 'package:flutter_fic12_onlineshop/navigation/app_navigation.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/all_room/all_room_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/category/category_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/home/bloc/product_by_category/product_by_category_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/bloc/login/login_bloc.dart';
import 'package:flutter_fic12_onlineshop/presentation/user/bloc/logout/logout_bloc.dart';

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
          create: (context) => AllRoomBloc(HomeRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(HomeRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ProductByCategoryBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
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
