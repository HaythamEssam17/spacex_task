import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/Controllers/launchesController.dart';
import 'package:spacex_app/Widgets/commonLaunchListTile.dart';
import 'package:spacex_app/Widgets/commonSpinKit.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CountdownTimerController controller;
  // int endTime = DateTime.now().millisecondsSinceEpoch +
  //     Duration(days: 0, hours: 1, seconds: 30).inMilliseconds;

  void onEnd() {
    print('onEnd');
  }

  @override
  void initState() {
    super.initState();
    Provider.of<LaunchesController>(context, listen: false).isLoading = false;
    Provider.of<LaunchesController>(context, listen: false).fetchAllLaunches();
    Provider.of<LaunchesController>(context, listen: false)
        .fetchNextLaunch()
        .then((value) {
      int endTime = value.dateUtc.millisecondsSinceEpoch;
      controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    });
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
                    title: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100.0,
                            width: MediaQuery.of(context).size.width,
                            child: launchProvider.getLoadNextLaunch
                                ? Center(
                                    child: CommonSpinKit.customSpinKitRing())
                                : customTimerWidget(),
                          ),
                          Text('Welcome to SpaceX',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0)),
                        ],
                      ),
                    ),
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

  Widget customTimerWidget() {
    return CountdownTimer(
      controller: controller,
      widgetBuilder: (_, CurrentRemainingTime time) {
        if (time == null) {
          return Text('Now!');
        }
        return Text(
            'days: ${time.days}, hours: ${time.hours}, min: ${time.min}, sec: ${time.sec}');
      },
    );
  }
}
