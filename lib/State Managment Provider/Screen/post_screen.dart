import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Post Provider/photo_provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postMultiMdl = Provider.of<PhotoProvider>(context, listen: false);
    final photoMultiMdl = Provider.of<PhotoProvider>(context, listen: false);
    final commentMultiMdl = Provider.of<PhotoProvider>(context, listen: false);
    postMultiMdl.getPostListData(context);
    photoMultiMdl.getPostListData(context);
    commentMultiMdl.getCommentListData(context);
  }
  @override
  Widget build(BuildContext context) {

    final postMultiMdl = Provider.of<PhotoProvider>(context);
    final photoMultiMdl = Provider.of<PhotoProvider>(context);
    final commentMultiMdl = Provider.of<PhotoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        leading: Center(child: Text("Facebook", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),)),
        elevation: 0,
      ),
      body: ListView(
        children: [
          photoMultiMdl.photoMdlList!= null ?
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: photoMultiMdl.photoMdlList!.length,
                itemBuilder: (context, index){
                  return Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[500],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${photoMultiMdl.photoMdlList![index].title}" ?? ""),
                        Image.
                      ],
                    ),
                  );
                }),
          ) : Center(child: CircularProgressIndicator(),),
        ],
      ),
    );
  }
}
