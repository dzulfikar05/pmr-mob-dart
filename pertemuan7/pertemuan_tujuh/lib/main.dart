import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_page.dart'; 
import 'about_page.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
  ],
);

void main() {
  runApp(MaterialApp.router(
    routerConfig: _router,
    debugShowCheckedModeBanner: false,
  ));
}