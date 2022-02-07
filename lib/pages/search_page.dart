import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:science_fair_project_app/widgets/components.dart';
import 'package:science_fair_project_app/services/web_service.dart';
import 'package:science_fair_project_app/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  WebService webService = WebService();
  TextEditingController controller = TextEditingController();
  bool loadShimmer = false;
  var data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: CupertinoSearchTextField(
          
          onSubmitted: (text) async {
            setState(() {
              loadShimmer = true;
            });
            var x = await webService.searchServer(text);
            setState(() {
              loadShimmer = false;
              data["status"] = 200;
              if(x["body"].length==0) {
                data["body"] = "no result";
              } else {
                data["body"] = x["body"];
              }
              print(data["body"]);
            });
          },
          controller: controller,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: data.length==0 ? Container() : data["body"]=="no result" ? Center(child: Text("No results!"),) : ListView.builder(
        itemCount: data["body"].length,
        itemBuilder: (context, index) {
          return SearchCard(
            imageLink: "${kHost}${data["body"][index]["image"]}",
            text: data["body"][index]["name"],
            description: data["body"][index]["description"],
          );
        }
      )
    );
  }
}