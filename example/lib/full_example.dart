import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';

class FullExample extends StatefulWidget {
  const FullExample({Key? key}) : super(key: key);

  @override
  _FullExampleState createState() => _FullExampleState();
}

class _FullExampleState extends State<FullExample> {
  late CameraController _controller;
  List<String> resultList = [];
  int resultSum = 0;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(autoPlay: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatefulBuilder(builder: (context, setSta) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  itemCount: resultSum,
                  itemBuilder: (context, index) => Center(
                        child: Text(
                          resultList[index],
                          style: const TextStyle(color: Colors.green),
                        ),
                      )),
            ),
            Center(
              child: FlutterWebQrcodeScanner(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.4,
                controller: _controller,
                onGetResult: (String data) {
                  resultSum++;

                  resultList.add(
                      "result number " + resultSum.toString() + "  " + data);
                  setSta(() {});
                },
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                      title: "start camera",
                      onTap: () async {
                        _controller.startVideoStream();
                      }),
                  const SizedBox(width: 20),
                  Button(
                    onTap: () {
                      _controller.stopVideoStream();
                    },
                    title: "stop camera",
                    enterColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class Button extends StatefulWidget {
  const Button(
      {Key? key,
      required this.title,
      this.enterColor = Colors.orange,
      required this.onTap})
      : super(key: key);
  final String title;
  final Color enterColor;
  final GestureTapCallback onTap;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late final TextStyle _hoverStyle =
      TextStyle(fontSize: 18, color: widget.enterColor);
  Color _color = Colors.black;
  final TextStyle _exitStyle =
      const TextStyle(fontSize: 16, color: Colors.black);
  double _width = 200;
  double _height = 50;
  late TextStyle _style = _exitStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 215,
      height: 55,
      child: MouseRegion(
        onEnter: (d) {
          setState(() {
            _style = _hoverStyle;
            _color = widget.enterColor;
            _width = 215;
            _height = 55;
          });
        },
        onExit: (e) {
          setState(() {
            _style = _exitStyle;
            _color = Colors.black;
            _width = 200;
            _height = 50;
          });
        },
        child: InkWell(
          onTap: widget.onTap,
          child: SizedBox(
            width: _width,
            height: _height,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: _color),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text(widget.title, style: _style))),
          ),
        ),
      ),
    );
  }
}
