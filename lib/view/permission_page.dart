import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class permission_Page extends StatefulWidget {
  const permission_Page({Key? key}) : super(key: key);

  @override
  State<permission_Page> createState() => _permission_PageState();
}

class _permission_PageState extends State<permission_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Permission"),
          actions: [
            IconButton(onPressed: () async {
              Map<Permission, PermissionStatus>map =
              await[Permission.location, Permission.camera].request();

              if (await Permission.camera.isDenied) {
                print("Camera Deny");
              }
              if (await Permission.location.isDenied) {
                print("location");
              }
            }, icon: Icon(Icons.settings)),
          ],
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              Provider.of<Class_Provider>(context,listen: false).getPositon();
            }, child: Text("Locations")),
            SizedBox(height: 12,),
            Text("latitude: ${Provider.of<Class_Provider>(context,listen: true).lat}"),
            SizedBox(height: 5,),
            Text("longitude: ${Provider.of<Class_Provider>(context,listen: true).lon}"),
            SizedBox(height: 10,), 
            Expanded(
              child: ListView.builder(itemCount: Provider
                  .of<Class_Provider>(context, listen: false)
                  .l1
                  .length,
                  itemBuilder: (Context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text("Address:- ${Provider.of<Class_Provider>(context,listen: true).l1[0]}"),
                      ],
                    );
                  }
              ),
            )


          ],
        ),
      ),
    );
  }
}
