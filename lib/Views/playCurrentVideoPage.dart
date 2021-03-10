import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacex_app/Models/launchModel.dart';
// import 'package:youtube_parser/youtube_parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayCurrentVideoPage extends StatefulWidget {
  final LaunchModel model;
  PlayCurrentVideoPage(this.model);

  @override
  State<StatefulWidget> createState() => PlayCurrentVideoPageState();
}

class PlayCurrentVideoPageState extends State<PlayCurrentVideoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.model.links.youtubeId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _videoMetaData = _controller.metadata;
        widget.model.links.youtubeId = _videoMetaData.videoId;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        // progressIndicatorColor: SharedText.appBarColor,

        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              print('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          Navigator.pop(context);
        },
      ),
      builder: (context, player) => Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Stack(
            children: [
              Container(height: size.height, width: size.width, child: player),
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customVideoListView(Widget player) {
    return ListView(
      children: [
        player,
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: _isPlayerReady
                        ? () {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                            setState(() {});
                          }
                        : null,
                  ),
                  IconButton(
                    icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                    onPressed: _isPlayerReady
                        ? () {
                            _muted ? _controller.unMute() : _controller.mute();
                            setState(() {
                              _muted = !_muted;
                            });
                          }
                        : null,
                  ),
                  FullScreenButton(
                    controller: _controller,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Volume",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Expanded(
                    child: Slider(
                      inactiveColor: Colors.transparent,
                      value: _volume,
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      label: '${(_volume).round()}',
                      onChanged: _isPlayerReady
                          ? (value) {
                              setState(() {
                                _volume = value;
                              });
                              _controller.setVolume(_volume.round());
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
