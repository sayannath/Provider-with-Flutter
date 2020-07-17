import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:git_app/Models/User.dart';
import 'package:git_app/Providers/userProvider.dart';
import 'package:git_app/Requests/GithubRequest.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  User user;
  List<User> users;
  @override
  Widget build(BuildContext context) {
    setState(() {
      user = Provider.of<UserProvider>(context).getUSer();

      Github(user.login).fetchFollowing().then((following) {
        Iterable list = json.decode(following.body);
        setState(() {
          users = list.map((model) => User.fromJson(model)).toList();
        });
      });
    });
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              brightness: Brightness.light,
              leading: Platform.isAndroid ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ): 
               IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.grey[100],
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(user.avatar_url),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        user.login,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 600,
                  child: users != null
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                              users[index].avatar_url),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        users[index].login,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      : Container(
                          child: Align(child: Text('Data is loading ...'))),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
