import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  //const Account({ Key? key }) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profile',
            style: GoogleFonts.bigShouldersText(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
                child: CircleAvatar(
              radius: 75,
              child: Image.asset(''),
            )),
            SizedBox(
              height: 20,
            ),
            ProfileMenu()
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextButton(
            child: Row(
              children: [
                Icon(
                  Icons.manage_accounts,
                 
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'My Account',
                    style: GoogleFonts.bigShouldersText(
                        color: Colors.black, fontSize: 22),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                 
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Row(
              children: [
                Icon(
                  Icons.notification_add,
                  
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Notifications',
                    style: GoogleFonts.bigShouldersText(
                        color: Colors.black, fontSize: 22),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                 
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Settings',
                    style: GoogleFonts.bigShouldersText(
                        color: Colors.black, fontSize: 22),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                 
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Row(
              children: [
                Icon(
                  Icons.help_center,
                 
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Help Center',
                    style: GoogleFonts.bigShouldersText(
                        color: Colors.black, fontSize: 22),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                 
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                 
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Logout',
                    style: GoogleFonts.bigShouldersText(
                        color: Colors.black, fontSize: 22),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
