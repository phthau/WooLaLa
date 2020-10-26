import 'package:flutter/material.dart';
//import 'package:woolala_app/lib/screens/EditProfileScreen.dart';

class ProfilePage extends StatefulWidget{

  //the id of this profile
  final String userProfileID;
  ProfilePage(this.userProfileID);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //the account we are currently logged into
  final String currentOnlineUserId = "The Juice";

  createProfileTop() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if(!snapshot.hasData)
          {
            print('no profile info found');
          }
        //eventually get this from the sign in
          String user = currentOnlineUserId;
        String userBio = 'One sexxxy mofo, straight up.';
        return Padding(
            padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/Icons/profile_temp_icon.jpg'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      user, style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 3.0),
                    child: Text(
                      userBio, style: TextStyle(fontSize: 14.0, color: Colors.black38, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  createColumns("Posts", 0),
                                  createColumns("Followers", 0),
                                  createColumns("Ratings", 3),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                createButton(),
                              ],
                            )
                          ],
                        ),
                      ),
                     ],
                  ),
                ],
            ),

        );
      },
    );
  }

  Column createColumns(String title, int count){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  createButton(){
    bool ownProfile = currentOnlineUserId == widget.userProfileID;
    if(ownProfile)
    {
      return createButtonTitleAndFunction(title: 'Edit Profile', performFunction: editUserProfile,);
    }
    else{

    }
  }

  Container createButtonTitleAndFunction({String title, Function performFunction}){
  return Container(
    padding: EdgeInsets.only(top: 3.0),
    child: FlatButton(
      onPressed: performFunction,
      child: Container(
        width: 280.0,
        height: 35.0,
        child: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    ),
  );
  }
  
  editUserProfile() {
    Navigator.pushReplacementNamed(context, '/editProfile');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black,
            onPressed: () => (Navigator.pushReplacementNamed(context, '/home'))
        ),
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          createProfileTop(),
        ],

      ),
    );
  }
}