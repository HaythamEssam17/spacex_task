import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/Controllers/launchesController.dart';
import 'package:spacex_app/Widgets/commonLaunchListTile.dart';
import 'package:spacex_app/Widgets/commonSpinKit.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LaunchesController>(context, listen: false).isLoading = false;
    Provider.of<LaunchesController>(context, listen: false).fetchAllLaunches();
  }

  @override
  Widget build(BuildContext context) {
    final launchProvider = Provider.of<LaunchesController>(context);

    return Scaffold(
      body: launchProvider.getIsLoading
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonSpinKit.customSpinKitRing(),
                SizedBox(height: 20.0),
                Text('Loading...')
              ],
            ))
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.orangeAccent,
                  floating: true,
                  expandedHeight: 220.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('Welcome to SpaceX',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    background: Image.network(
                      'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate:
                      SliverChildListDelegate(launchProvider.getLaunchesList
                          .map((e) => Padding(
                                padding: EdgeInsets.all(10.0),
                                child:
                                    CommonLaunchListTile.customLaunchListTile(
                                        context, e),
                              ))
                          .toList()),
                )
              ],
            ),
    );
  }
}
