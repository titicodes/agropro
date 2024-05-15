import 'package:agropro/pages/home/viewmodel/camera_model.dart';
import 'package:flutter/material.dart';
import 'package:camera_web/camera_web.dart';

class CamerapageWidget extends StatefulWidget {
  const CamerapageWidget({super.key});

  @override
  _CamerapageWidgetState createState() => _CamerapageWidgetState();
}

class _CamerapageWidgetState extends State<CamerapageWidget> {
  late CamerapageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => CamerapageModel()); // Removed this line
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 76),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 387,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-0.89, 0.14),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                icon: Icon(
                                  Icons.flash_on,
                                  color: Theme.of(context).primaryColor,
                                  size: 15,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.77, 0.05),
                            child: IconButton(
                              icon: Icon(
                                Icons.cancel_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () {
                                // Add onPressed functionality here
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 34),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFF666666),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Icon(
                          Icons.image_rounded,
                          color: Theme.of(context).primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 77),
                      child: Container(
                        width: 77,
                        height: 77,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_sharp,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 82),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.cached_sharp,
                          color: Theme.of(context).primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}