import 'package:flutter/material.dart';
import 'dart:html' show VideoElement;
import 'dart:ui' as ui;

/// Autoplay video Widget
///
/// The widget must be initialized with a *unique* [videoId], and can load a video from a specific [url] given a
/// [type] (eg.: 'video/mp4')
class VideoWidget extends StatefulWidget {
  final String viewId;
  final String url;
  final String type;

  const VideoWidget({
    Key key,
    this.viewId,
    this.url,
    this.type = 'video/mp4',
  }) : super(key: key);

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  VideoElement element;
  bool isInited = false;

  Future<void> goToTime(double seconds) {
    if (seconds > getVideoTime()) {
      seconds = getVideoTime();
    }

    element.currentTime = seconds;
    return element.play();
  }

  double getVideoTime() => element?.duration ?? 0;

  @override
  void initState() {
    super.initState();
    // This will register the new UI element in the app, given a View ID
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(widget.viewId, (int viewId) {
      // This will style the new UI element for Flutter Web
      element = VideoElement()
        ..id = this.widget.viewId
        ..setAttribute("playsinline", "true")
        ..autoplay = true
        ..muted = true
        ..loop = true
        ..src = widget.url
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none'
        ..canPlayType(widget.type)
        ..controls = false;

      return element;
    });
  }

  @override
  Widget build(BuildContext context) {
    // After the UI element is created with a specififed ID, we will
    // search for that element and render it inside a HTML Element View so that
    // it can be displayed in a web page
    return HtmlElementView(viewType: widget.viewId);
  }
}
