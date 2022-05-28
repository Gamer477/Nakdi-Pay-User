// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRViewExample extends StatefulWidget {
//   const QRViewExample({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(flex: 4, child: _buildQrView(context)),
//           // Expanded(
//           //   flex: 1,
//           //   child: FittedBox(
//           //     fit: BoxFit.contain,
//           //     child: Column(
//           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //       children: <Widget>[
//           //         if (result != null)
//           //           Text(
//           //               'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
//           //         else
//           //           const Text('Scan a code'),
//           //         Row(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           crossAxisAlignment: CrossAxisAlignment.center,
//           //           children: <Widget>[
//           //             Container(
//           //               margin: const EdgeInsets.all(8),
//           //               child: ElevatedButton(
//           //                   onPressed: () async {
//           //                     await controller?.toggleFlash();
//           //                     setState(() {});
//           //                   },
//           //                   child: FutureBuilder(
//           //                     future: controller?.getFlashStatus(),
//           //                     builder: (context, snapshot) {
//           //                       return Text('Flash: ${snapshot.data}');
//           //                     },
//           //                   )),
//           //             ),
//           //             Container(
//           //               margin: const EdgeInsets.all(8),
//           //               child: ElevatedButton(
//           //                   onPressed: () async {
//           //                     await controller.flipCamera();
//           //                     setState(() {});
//           //                   },
//           //                   child: FutureBuilder(
//           //                     future: controller?.getCameraInfo(),
//           //                     builder: (context, snapshot) {
//           //                       if (snapshot.data != null) {
//           //                         return Text(
//           //                             'Camera facing ${describeEnum(snapshot.data)}');
//           //                       } else {
//           //                         return const Text('loading');
//           //                       }
//           //                     },
//           //                   )),
//           //             )
//           //           ],
//           //         ),
//           //         Row(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           crossAxisAlignment: CrossAxisAlignment.center,
//           //           children: <Widget>[
//           //             Container(
//           //               margin: const EdgeInsets.all(8),
//           //               child: ElevatedButton(
//           //                 onPressed: () async {
//           //                   await controller?.pauseCamera();
//           //                 },
//           //                 child: const Text('pause',
//           //                     style: TextStyle(fontSize: 20)),
//           //               ),
//           //             ),
//           //             Container(
//           //               margin: const EdgeInsets.all(8),
//           //               child: ElevatedButton(
//           //                 onPressed: () async {
//           //                   await controller?.resumeCamera();
//           //                 },
//           //                 child: const Text('resume',
//           //                     style: TextStyle(fontSize: 20)),
//           //               ),
//           //             )
//           //           ],
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 150.0
//         : 300.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderColor: Colors.red,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakdi_pay_user/utils/app_colors.dart';
import 'package:nakdi_pay_user/utils/app_images.dart';
import 'package:nakdi_pay_user/view/screens/home/homepage.dart';
import 'package:nakdi_pay_user/view/screens/home_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  bool flashon = false;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 15), () {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => controller!.resumeCamera());

      print("omk ara3a");
    });
  }

  @override
  void reassemble() {
    setState(() {});
    print("omk ara3a2");
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                _buildQrView(context),
                Positioned(
                  top: 6.h,
                  left: 4.w,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        }),
                        child: SvgPicture.asset(
                          AppImages.closeIcon,
                          width: 30,
                        ),
                      ),
                      SizedBox(
                        width: 58.w,
                      ),
                      InkWell(
                        onTap: () async {
                          await controller?.toggleFlash();
                          setState(() {
                            flashon = !flashon;
                          });
                        },
                        child: flashon
                            ? Icon(Icons.flash_on)
                            : SvgPicture.asset(
                                AppImages.flashIcon,
                                width: 25,
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: SvgPicture.asset(
                          AppImages.qrIcon,
                          width: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: SvgPicture.asset(
                          AppImages.settingsIcon,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 29.w,
                  child: Text(
                    "Scan any QR code to pay",
                    style: TextStyle(
                      fontFamily: "Inter-Regular",
                      color: AppColors.whiteColor,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         if (result != null)
          //           Text(
          //               'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //         else
          //           const Text('Scan a code'),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.toggleFlash();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getFlashStatus(),
          //                     builder: (context, snapshot) {
          //                       return Text('Flash: ${snapshot.data}');
          //                     },
          //                   )),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.flipCamera();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getCameraInfo(),
          //                     builder: (context, snapshot) {
          //                       if (snapshot.data != null) {
          //                         return Text(
          //                             'Camera facing ${describeEnum(snapshot.data!)}');
          //                       } else {
          //                         return const Text('loading');
          //                       }
          //                     },
          //                   )),
          //             )
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                 onPressed: () async {
          //                   await controller?.pauseCamera();
          //                 },
          //                 child: const Text('pause',
          //                     style: TextStyle(fontSize: 20)),
          //               ),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                 onPressed: () async {
          //                   await controller?.resumeCamera();
          //                 },
          //                 child: const Text('resume',
          //                     style: TextStyle(fontSize: 20)),
          //               ),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColors.secondColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    print("omk ara3a3");
    controller?.dispose();
    super.dispose();
  }
}
