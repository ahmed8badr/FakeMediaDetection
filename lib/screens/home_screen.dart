import 'dart:io';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:untitled/function.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/utils.dart';
// import 'package:video_player/video_player.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String url = '';
  String tempUrl = '';
  String tempUrl2='';
  var data;
  String result ="initial";
  String title ="initial";
  String link ="initial";
  final urlController = TextEditingController();
  PlatformFile? _video ;
  PlatformFile? _image;
  UploadTask? uploadTask;
//  final picker = ImagePicker();
//  final _picker = ImagePicker();
//  late VideoPlayerController _videoPlayerController ;

  Future uploadVideo()async{
    final file = File(_video!.path!);
    final path = '${_video!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState((){
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState((){
      uploadTask = null;
    });
    return urlDownload;
  }

  Future uploadImage()async{
    final file = File(_image!.path!);
    final path = '${_image!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState((){
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState((){
      uploadTask = null;
    });
    return urlDownload;
  }

  _pickImage() async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    _image = result.files.first;
  }


  _pickVideo() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    _video = result.files.first;
  }


Widget subFunc(Video video){
    if (video.type){
  if(video.link)
    return Text(
        '''
  Scanned from url
  Date: ${video.date}
        ''');
  else return Text(
        '''
  Scanned from storage
  Date: ${video.date}
        ''');
}else return Text(
        '''
  Generated
  Date: ${video.date}
        ''');
  }


  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage =
  //   await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }


  Widget buildVideo(Video video) {
    if (video.type==true){
  if(video.result == "fake")
    return ListTile(
        leading: CircleAvatar(backgroundColor: Colors.red,child: Text('${video.result}')),
        title: Text("${video.title}.mp4"),
        subtitle: subFunc(video),
        onTap: () {
        Clipboard.setData(ClipboardData(text: video.url));
        Utils.showSnackBar("copied link to clipboard", Colors.green);
        },
    );
  else return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.green,child: Text('${video.result}')),
      title: Text("${video.title}.mp4"),
      subtitle: subFunc(video),
    onTap: () {
      Clipboard.setData(ClipboardData(text: video.url));
      Utils.showSnackBar("copied link to clipboard", Colors.green);
    },
  );}else return ListTile(
        leading: CircleAvatar(backgroundColor: Color(0xf21d2570),child: Text('${video.result}')),
        title: Text("${video.title}.mp4"),
        subtitle: subFunc(video),
      onTap: () {
        Clipboard.setData(ClipboardData(text: video.url));
        Utils.showSnackBar("copied link to clipboard", Colors.green);
      },
    );
  }

  Widget build(BuildContext context) {
    return DefaultTabController(

    length: 3,
        child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        automaticallyImplyLeading: false,
        title: Text('DEEPECT'
          ,style: TextStyle(
              color: Color(0xf21d2570)
          ),),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert,color: Color(0xf21d2570),),
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
              child: ListTile(leading: Icon(Icons.portrait,color: Color(0xf21d2570),),title: Text('Profile',style: TextStyle(color:Color(0xff303F9F)),)),
              value: 1,

            ),
            PopupMenuItem(

              child: ListTile(leading: Icon(Icons.logout,color: Color(0xf21d2570),),title: Text('Sign Out',style: TextStyle(color: Color(0xff303F9F)),)),
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
          indicatorColor: Color(0xf21d2570),
          labelColor:  Color(0xff303F9F),
        ),
      ),
      body:

      TabBarView(

        children: [
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
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(20) ,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x88262c6b),
                          blurRadius: 15,

                        )
                      ]
                    ),

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Scan a link",
                        style: TextStyle(
                        color: Color(0xf21d2570),
                      ),),
                      TextFormField(
                        style: TextStyle(color: Color(0xf21d2570),),
                        controller: urlController,
                        onChanged:(value){
                          url = 'http://115a-196-132-114-8.ngrok.io/detect?query=' + Uri.encodeQueryComponent(value.toString());},
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0x88262c6b)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0x88262c6b)),
                          ),
                          hintText: 'Enter a link...',
                          hintStyle: TextStyle(fontSize: 15.0, color:  Color(0x88262c6b)),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(200,5,5,0),
                        child: ElevatedButton (
                        child: Text("SCAN"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100,40),
                          primary: Color(0xf21d2570),
                          onPrimary: Colors.white,
                        ),
                            onPressed: ()async{
                              Utils.showSnackBar('Uploading', Colors.yellow);
                              tempUrl = urlController.text.trim();
                              urlController.clear();
                              data = await api(url);
                              var decoded = jsonDecode(data);
                              setState((){
                                result = decoded['result'];
                                title = decoded['title'];
                              });
                              final video = Video(
                                url: tempUrl,
                                link: true,
                                type: true,
                                result: result,
                                title: title
                              );
                              createVideo(video);
                            }
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
                            color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(20) ,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x88262c6b),
                            blurRadius: 15,

                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Upload a video from storage',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color:Color(0xf21d2570),
                            ),
                          ),
                        ),
                        // if(_video != null)
                        //   _videoPlayerController.value.isInitialized ? AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,
                        // child: VideoPlayer(_videoPlayerController),): Container()
                        // else

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(200,5,5,0),
                              child: ElevatedButton (
                                child: Text("UPLOAD"),

                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100,40),
                                  primary: Color(0xf21d2570),
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
                            child: Text('SCAN'),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100,40),
                              primary: Color(0xf21d2570),
                              onPrimary: Colors.white,
                            ),


                            onPressed:()async {
                              Utils.showSnackBar('Uploading', Colors.yellow);
                              tempUrl = await uploadVideo();
                              url = 'http://115a-196-132-114-8.ngrok.io/detect?query=' + Uri.encodeQueryComponent(tempUrl);
                              data = await api(url);
                              var decoded = jsonDecode(data);
                              setState((){
                                result = decoded['result'];
                                title = decoded['title'];
                              });
                              final video = Video(
                                  url: tempUrl,
                                  link: false,
                                  type: true,
                                  result: result,
                                  title: title
                              );
                              createVideo(video);
                            }
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
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
                          color:Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20) ,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x88262c6b),
                            blurRadius: 15,

                          )
                        ]// use instead of BorderRadius.all(Radius.circular(20))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Upload a video from storage',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xf21d2570),
                            ),
                          ),
                        ),

                          Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(180,0,10,0),
                                  child: ElevatedButton (
                                    child: Text("BROWSE"),

                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100,40),
                                      primary: Color(0xf21d2570),
                                      onPrimary: Colors.white ,
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
                      padding: EdgeInsets.fromLTRB(50, 30, 30, 20),
                      margin: EdgeInsets.fromLTRB(5, 10, 5,20),
                      decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color:Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20) ,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x88262c6b),
                              blurRadius: 15,

                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Upload an image from storage',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xf21d2570),
                              ),
                            ),
                          ),

                          // if(_image!=null)
                          //   Image.file(_image!)
                          //   else

                            Row(
                                children: [
                                  Padding(padding: const EdgeInsets.fromLTRB(180,0,10,0),
                                    child: ElevatedButton (
                                      child: Text("UPLOAD"),

                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(100,40),
                                        primary: Color(0xf21d2570),
                                        onPrimary: Colors.white,
                                      ),

                                      onPressed: () {
                                        _pickImage();
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
                    fixedSize: Size(110,40),
                    primary: Color(0xf21d2570),
                    onPrimary: Colors.white,
                  ),

                  onPressed: () async {
                    Utils.showSnackBar('Uploading', Colors.yellow);
                    tempUrl2 = await uploadImage();
                    tempUrl = await uploadVideo();
                    url = 'http://115a-196-132-114-8.ngrok.io/generate?image_url=${Uri.encodeQueryComponent(tempUrl2)}&video_url=${Uri.encodeQueryComponent(tempUrl)}&email=${FirebaseAuth.instance.currentUser!.email.toString()}';
                    data = await api(url);
                    var decoded = jsonDecode(data);
                    setState((){
                      title = decoded['title'];
                      link = decoded['link'];
                    });
                    final video = Video(
                        url: link,
                        link: false,
                        type: false,
                        result: 'G',
                        title: title
                    );
                    createVideo(video);
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: StreamBuilder<List<Video>>(
                      stream: readVideos(),
                      builder: (context, snapshot){
                        if (snapshot.hasError) {
                          return Text('something');}
                        else if (snapshot.hasData){
                          final videos = snapshot.data!;
                          return ListView(
                              shrinkWrap: true,
                              children: videos.map(buildVideo).toList());
                        }else
                          return Center(child: CircularProgressIndicator());
                      }),
          ),
            ]
      )
    ),
  );


  }}

class Video{
  String date;
  bool link;
  bool type;
  String result;
  String url;
  String title;
  Video({
    this.date='',
    this.result='',
    this.url='',
    this.title='',
    required this.type,
    required this.link
  });

  Map<String, dynamic> toJson()=>{
    'date':date,
    'link': link,
    'result': result,
    'url': url,
    'type':type,
    'title': title
  };

  static Video fromJson(Map<String, dynamic> json) => Video(
      date: json['date'],
      link: json['link'],
      result: json['result'],
      url: json['url'],
      type: json['type'],
      title: json['title']
  );
}

Stream<List<Video>> readVideos() => FirebaseFirestore.instance
  .collection(FirebaseAuth.instance.currentUser!.email.toString())
  .snapshots()
  .map((snapshot) =>
    snapshot.docs.map((doc) => Video.fromJson(doc.data())).toList());

Future createVideo(Video video)async{
  final docUser = FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.email.toString()).doc(video.title);
  video.date = DateTime.now().toString();
  final json = video.toJson();
  await docUser.set(json);
  Utils.showSnackBar("Done !", Colors.green);
}