import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

class PostList extends StatefulWidget {
  PostList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List _postList = [
    {'no': 1, 'keyword': 'English'},
    {'no': 2, 'keyword': 'Urdu'},
    {'no': 3, 'keyword': 'Marathi'},
    {'no': 4, 'keyword': 'Imam'},
    {'no': 5, 'keyword': 'Poojari'}
  ];
  List<DropdownMenuItem> _dropdownPostItems;
  var _selectedPost;

  @override
  void initState() {
    _dropdownPostItems = buildDropdownPostItems(_postList);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem> buildDropdownPostItems(List _postList) {
    List<DropdownMenuItem> items = List();
    for (var i in _postList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  var lang = 'Hindi';

  onChangeDropdownPosts(selectedPost) {
    print(selectedPost);
    setState(() {
      _selectedPost = selectedPost;
      lang = "English";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownBelow(
        itemWidth: 350,
        itemTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxTextstyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
        boxWidth: 400,
        boxHeight: 60,
        //  hint: Text('choose item'),
        value: _selectedPost,
        items: _dropdownPostItems,
        onChanged: onChangeDropdownPosts,
      ),
    );
  }
}
