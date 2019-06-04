import 'package:flutter/material.dart';
import 'package:flutter_app_api_list/data/api/post_service.dart';
import 'package:flutter_app_api_list/domain/post.dart';
import 'package:flutter_app_api_list/domain/user.dart';

class HomeScreeen extends StatefulWidget {
  @override
  _HomeScreeenState createState() => new _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {

  final service = PostService();

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      title: Text("Lista de posts"),
    );

    final futurePosts = FutureBuilder<List<Post>>(
    future: service.findAll(),
    builder: (context, snapshot) {

      if (snapshot.hasError) print(snapshot.error);

      return snapshot.hasData
          ? PostList(posts: snapshot.data)
          : Center(child: CircularProgressIndicator());
    },
  );

 

    final scaffold = Scaffold(
      appBar: appBar,
      body: futurePosts,
    );

    return scaffold;
  }
}

class PostList extends StatelessWidget {

  final List<Post> posts;

  PostList({Key key, this.posts}) : super(key: key);

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return _buildRow(context, index);
      },
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              posts[index].title,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              posts[index].body,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 3,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
