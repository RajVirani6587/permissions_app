import 'package:flutter/material.dart';
import 'package:permissions_app/provider/provider.dart';
import 'package:permissions_app/view/permission_page.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Class_Provider>(create: (context)=>Class_Provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>permission_Page(),

        },
      ),
    )
  );
}