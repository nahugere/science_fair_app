import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class TopShadow extends StatelessWidget {
  const TopShadow({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 119,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF000000).withOpacity(0.4), Color(0xFF000000).withOpacity(0.2), Colors.transparent]
            )
          )
        ),
      )
    );
  }
}

class SearchCard extends StatefulWidget {
  final text;
  final description;
  final imageLink;
  final onTap;
  const SearchCard({ Key key, this.description, this.imageLink, this.text, this.onTap }) : super(key: key);

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 13),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  margin: EdgeInsets.only(left: 16.5, right: 9, bottom: 13),
                  height: 114,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imageLink),
                      fit: BoxFit.cover
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9)
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.text, style: Theme.of(context).textTheme.headline6,),
                      Padding(padding: EdgeInsets.only(top: 4)),
                      Text(widget.description, style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey[350]), maxLines: 5,)
                    ],
                  )
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchCardShimmer extends StatelessWidget {
  const SearchCardShimmer({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 13),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[700],
                highlightColor: Colors.grey[600],
                child: Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  margin: EdgeInsets.only(left: 16.5, right: 9, bottom: 13),
                  height: 114,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9)
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[700],
                      highlightColor: Colors.grey[600],
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.2, height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4)),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[700],
                      highlightColor: Colors.grey[600],
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.60, height: 76,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}