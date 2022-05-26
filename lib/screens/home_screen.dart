import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:untitled/screens/settings_screen.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  late VideoPlayerController _videoPlayerController ;

  File? _video ;
  File? _image;
final picker = ImagePicker();
final _picker = ImagePicker();


_pickVideo() async {
  final video = await picker.pickVideo(source: ImageSource.gallery);
  _video = File(video!.path);
  _videoPlayerController = VideoPlayerController.file(_video!)..initialize().then((_) {
    setState(() {

    });
    _videoPlayerController.play();
  });
}
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }


  Widget build(BuildContext context) {
    return DefaultTabController(

    length: 3,
        child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Color(0xff303F9F),
      appBar: AppBar(
<<<<<<< HEAD
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: Text('FMD'),
=======
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text('FMD'
        ,style: TextStyle(
            color: Color(0xff303F9F)
          ),)
        ,
>>>>>>> Gina
        actions: [
          IconButton(onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );}, icon: Icon(Icons.settings),color: Color(0xffFF4081),),
          PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Color(0xffFF4081),),
          color:  Colors.white,
              onSelected:(value){
                if(value == 1){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const ProfileScreen()));

                }
                else {
                  FirebaseAuth.instance.signOut();
                }
              }
              ,itemBuilder: (context) => [
            PopupMenuItem(
              child: ListTile(leading: Icon(Icons.portrait,color: Color(0xffFF4081),),title: Text('Profile',style: TextStyle(color:Color(0xff303F9F)),)),
              value: 1,

            ),
            PopupMenuItem(

              child: ListTile(leading: Icon(Icons.logout,color: Color(0xffFF4081),),title: Text('Sign Out',style: TextStyle(color: Color(0xff303F9F)),)),
              value: 2,
            )
          ]),
        ],
        bottom: TabBar(
          tabs: [
            Tab(text:'SCAN'),
            Tab(text:'GENERATE'),
            Tab(text:'HISTORY')
          ],
          indicatorColor: Color(0xffFF4081),
          labelColor:  Color(0xff303F9F),



        ),
      ),
      body:

      TabBarView(

        children: [
          Column(
            children: [

              Container (

                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(50, 30, 30, 20),
                  margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Scan a link',
                      style: TextStyle(
                      color: Color(0xff303F9F),
                    ),),
                    TextField(
                      style: TextStyle(color: Color(0xff303F9F),),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff303F9F)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff303F9F)),
                        ),


                        hintText: 'Enter a link...',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey[600]),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(200,5,5,0),
                      child: ElevatedButton (
                      child: Text("SCAN"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(100,40),
                        primary: Color(0xffFF4081),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {},
                  ),
                    )
              ]),
              ),
              Container (
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(50, 30, 20, 20),
                  margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Upload a video from storage',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xff303F9F),
                          ),
                        ),
                      ),
                      if(_video != null)
                        _videoPlayerController.value.isInitialized ? AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),): Container()
                      else

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(200,5,5,0),
                            child: ElevatedButton (
                              child: Text("UPLOAD"),

                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(100,40),
                                primary: Color(0xffFF4081),
                                onPrimary: Colors.white,
                              ),

                              onPressed: () {
                                _pickVideo();
                              },
                            ),
                          ),

                        ]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(200,0,5,0),
                        child: ElevatedButton (
                          child: Text("SCAN"),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100,40),
                            primary: Color(0xffFF4081),
                            onPrimary: Colors.white,
                          ),


                          onPressed: () {},
                        ),
                      )


                    ],
                  )
              ),
            ],

          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Container (
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.fromLTRB(50, 30, 30, 20),
                    margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Choose a video from our library',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff303F9F),
                            ),
                          ),
                        ),
<<<<<<< HEAD
=======

>>>>>>> Gina

                          Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(180,0,10,0),
                                  child: ElevatedButton (
                                    child: Text("BROWSE"),

                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100,40),
                                      primary: Color(0xffFF4081),
                                      onPrimary: Colors.white ,

                                  ), onPressed: () {  },

<<<<<<< HEAD
                                    onPressed: () {
                                    },
                                  ),
=======
>>>>>>> Gina
                                ),

                                ),
                              ],
                          ),

                      ],
                    )
                ),
                SingleChildScrollView(
                  child: Container (
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(50, 30, 30, 20),
                      margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Upload a picture from storage',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff303F9F),
                              ),
                            ),
                          ),

                          if(_image!=null)
                            Image.file(_image!)
                            else

                            Row(
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(180,0,10,0),
                                    child: ElevatedButton (
                                      child: Text("UPLOAD"),

                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(100,40),
                                        primary: Color(0xffFF4081),
                                        onPrimary: Colors.white,
                                      ),

                                      onPressed: () {
                                        _openImagePicker();
                                      },
                                    ),
                                  ),

                                ]),

                        ],
                      )
                  ),
                ),
<<<<<<< HEAD
                ElevatedButton (
                  child: Text("GENERATE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
=======
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton (
                    child: Text("GENERATE"),

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(110,40),
                      primary: Color(0xffFF4081),
                      onPrimary: Colors.white,
                    ),

                    onPressed: () {},
>>>>>>> Gina
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
                margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                ),
              ),
          )
        ],
      )



    )
    );

  }}


