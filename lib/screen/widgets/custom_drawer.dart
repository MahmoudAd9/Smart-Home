import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home_flutter_ui/LoginPages/LoginScreen.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  final Map<String, dynamic> userData;
  const CustomDrawer({required this.userData});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColor.fg1Color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: AppColor.white,
                      ),
                    );
                  }),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://randomuser.me/api/portraits/men/51.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(width: 2, color: AppColor.white),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.userData['FirstName']} ${widget.userData['LastName']}",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showProfile(widget.userData,context);
                        },
                        style: OutlinedButton.styleFrom(
                            foregroundColor: AppColor.white,
                            side: const BorderSide(color: AppColor.white),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: const Text(
                          "Show Profile",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: AppColor.white,
                height: 40,
              ),
              drawerTile(Icons.people_alt_outlined, "  Manage Users", () {}),
              drawerTile(Icons.tv_outlined, "  Devices", () {}),
              drawerTile(Icons.bed, "  Rooms", () {}),
              drawerTile(Icons.music_note, "  Music", () {}),
              drawerTile(Icons.settings, "  Settings", () {}),
              drawerTile(Icons.help_outline, "  Help", () {}),
              const Spacer(),
              drawerTile(Icons.power_settings_new_outlined, "  Logout",(){showAlertDialogLougOut(context);}),
            ],
          ),
        ),
      ),
    );
  }

  ListTile drawerTile(IconData icon, String title, VoidCallback ontap) {
    return ListTile(
      onTap: ontap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: AppColor.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: AppColor.white),
      ),
    );
  }
}

showAlertDialogLougOut(BuildContext context) {
  // set up the button
  Widget yesButton = TextButton(
    child: Text("Yes"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));

    },
  );
  Widget noButton = TextButton(
    child: Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Are you sure ?",style: TextStyle(fontSize: 20),),
    actions: [
      noButton,
      yesButton,

    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


 showProfile(Map<String, dynamic> userData,BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget bodyProfile=Container(
alignment: Alignment.centerLeft,
    child: Column(
      children: [
           Text(("First Name"),style: TextStyle(fontWeight: FontWeight.bold),),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),),
                prefixIcon: Icon(Icons.drive_file_rename_outline),
                hintText: userData['FirstName'],
              ),
              readOnly: true,
                ),
        SizedBox(height: 10,),
        Text(("Last Name"),style: TextStyle(fontWeight: FontWeight.bold),),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),),
            prefixIcon: Icon(Icons.drive_file_rename_outline),
            hintText: userData['LastName'],
          ),
          readOnly: true,
        ),
        SizedBox(height: 10,),
        Text(("Email"),style: TextStyle(fontWeight: FontWeight.bold),),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),),
            prefixIcon: Icon(Icons.mail),
            hintText: userData['Email'],
          ),
          readOnly: true,
        ),
        SizedBox(height: 10,),
        Text(("Phone Number"),style: TextStyle(fontWeight: FontWeight.bold),),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),),
            prefixIcon: Icon(Icons.phone),
            hintText: userData['PhoneNumber'],
          ),
          readOnly: true,
        ),
        SizedBox(height: 20,)
      ],
    ),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(

    actionsAlignment: MainAxisAlignment.center,
    title: Text(
      "Profile",
      style: TextStyle(fontSize: 20),
    ),
   /* content: Container(
    width: MediaQuery.of(context).size.width*4.0,
    child:   bodyProfile,
  ),*/


    actions: [
      bodyProfile,
      okButton,
    ],

  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
