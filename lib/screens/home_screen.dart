import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/screens/login_screen.dart';
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
        backgroundColor: Colors.cyan[700],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('FMD'),
        actions: [
          IconButton(onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );}, icon: Icon(Icons.settings),color: Colors.white,),
          PopupMenuButton(

              onSelected:(value){
                if(value == 1){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsScreen()));

                }
                else {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()));
                }
              }
              ,itemBuilder: (context) => [
            PopupMenuItem(
              child: ListTile(leading: Icon(Icons.portrait),title: Text('Profile')),
              value: 1,

            ),
            PopupMenuItem(

              child: ListTile(leading: Icon(Icons.logout),title: Text('Sign Out')),
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
          indicatorColor: Colors.white,


        ),
      ),
      body:

      TabBarView(

        children: [
          Column(
            children: [

              Container (

                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
                  margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.7),
                      border: Border.all(
                        color: Colors.blueGrey.withOpacity(0.7),
                      ),
                      borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Scan a link',
                      style: TextStyle(
                      color: Colors.white,
                    ),),
                    TextField(
                      style: TextStyle(color: Colors.white,),
                      decoration: InputDecoration(

                        hintText: 'Enter a link...',
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(200,5,5,0),
                      child: ElevatedButton (
                      child: Text("SCAN"),
                      style: ElevatedButton.styleFrom(

                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),



                      onPressed: () {},
                  ),
                    )
              ]),
              ),
              Container (
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
                  margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.7),
                      border: Border.all(
                        color: Colors.blueGrey.withOpacity(0.7),
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
                            color: Colors.white,
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
                            padding: const EdgeInsets.fromLTRB(180,0,10,0),
                            child: ElevatedButton (
                              child: Text("UPLOAD"),

                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),

                              onPressed: () {
                                _pickVideo();
                              },
                            ),
                          ),

                        ]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(180,0,10,0),
                        child: ElevatedButton (
                          child: Text("SCAN"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
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
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
                    margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.7),
                        border: Border.all(
                          color: Colors.blueGrey.withOpacity(0.7),
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
                              color: Colors.white,
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
                                  padding: const EdgeInsets.fromLTRB(180,0,10,0),
                                  child: ElevatedButton (
                                    child: Text("UPLOAD"),

                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                    ),

                                    onPressed: () {
                                      _pickVideo();
                                    },
                                  ),
                                ),

                              ]),

                      ],
                    )
                ),
                SingleChildScrollView(
                  child: Container (
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
                      margin: EdgeInsets.fromLTRB(5, 10, 5,0),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.7),
                          border: Border.all(
                            color: Colors.blueGrey.withOpacity(0.7),
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
                                color: Colors.white,
                              ),
                            ),
                          ),
                       
                          if(_image!=null)
                            Image.file(_image!)
                            else
                              
                            Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(180,0,10,0),
                                    child: ElevatedButton (
                                      child: Text("UPLOAD"),

                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
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
                ElevatedButton (
                  child: Text("GENERATE"),

                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),

                  onPressed: () {},
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
                    color: Colors.blueGrey.withOpacity(0.7),
                    border: Border.all(
                      color: Colors.blueGrey.withOpacity(0.7),
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


