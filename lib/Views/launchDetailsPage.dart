import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/Controllers/launchesController.dart';
import 'package:spacex_app/Controllers/rocketController.dart';
import 'package:spacex_app/Models/launchModel.dart';
import 'package:spacex_app/Views/playCurrentVideoPage.dart';
import 'package:spacex_app/Widgets/commonCarouselSlider.dart';
import 'package:spacex_app/Widgets/commonDetailsWidget.dart';
import 'package:spacex_app/Widgets/commonRocketDetailsWidget.dart';
import 'package:spacex_app/Widgets/commonSpinKit.dart';

class LaunchDetailsPage extends StatefulWidget {
  final LaunchModel model;
  LaunchDetailsPage(this.model);

  @override
  State<StatefulWidget> createState() => LaunchDetailsPageState();
}

class LaunchDetailsPageState extends State<LaunchDetailsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LaunchesController>(context, listen: false).isLoading = false;
    Provider.of<LaunchesController>(context, listen: false)
        .fetchLaunchDetailsByID(widget.model.id);

    Provider.of<RocketController>(context, listen: false).isLoading = false;
    Provider.of<RocketController>(context, listen: false)
        .fetchRocketDetailsByID(widget.model.rocket);
  }

  @override
  Widget build(BuildContext context) {
    final launchProvider = Provider.of<LaunchesController>(context);
    final rocketProvider = Provider.of<RocketController>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: launchProvider.getIsLoading
            ? loading()
            : Stack(
                children: [
                  CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.orangeAccent,
                        floating: true,
                        expandedHeight: 220.0,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(launchProvider.launchModel.name,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0)),
                          background: CommonCarouselSlider.customCarouselSlider(
                              launchProvider.launchModel.links.flickr.original
                                          .length !=
                                      0
                                  ? launchProvider
                                      .launchModel.links.flickr.original
                                      .map((e) => Image.network(e,
                                          fit: BoxFit.fill,
                                          height: 220.0,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width))
                                      .toList()
                                  : List.generate(
                                      3,
                                      (index) => Image.network(
                                          'https://farm5.staticflickr.com/4745/40110304192_b0165b7785_o.jpg',
                                          fit: BoxFit.fill,
                                          height: 220.0,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width),
                                    ).toList()),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          CommonDetailsWidget.customTitleDetailsCard(
                              launchProvider.launchModel),
                          SizedBox(height: 10.0),
                          rocketProvider.getIsLoading
                              ? loading()
                              : CommonRocketDetailsWidget
                                  .customRocketDetailsWidget(
                                      rocketProvider.rocketModel),
                          SizedBox(height: 10.0),
                          rocketProvider.getIsLoading
                              ? loading()
                              : CommonRocketDetailsWidget.playloadDetails(
                                  rocketProvider
                                      .rocketModel.secondStage.payloads),
                        ]),
                      )
                    ],
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PlayCurrentVideoPage(widget.model))),
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.video_label),
      ),
    );
  }

  Widget loading() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonSpinKit.customSpinKitRing(),
        SizedBox(height: 20.0),
        Text('Loading...')
      ],
    ));
  }
}
