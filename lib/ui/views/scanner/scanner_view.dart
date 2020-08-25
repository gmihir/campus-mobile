import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/core/constants/scanner_constants.dart';
import 'package:campus_mobile_experimental/core/data_providers/barcode_data_provider.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/container_view.dart';
import 'package:campus_mobile_experimental/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<ScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  BarcodeDataProvider _barcodeDataProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didUpdateWidget
    super.didChangeDependencies();
    context.dependOnInheritedWidgetOfExactType();
    _barcodeDataProvider = Provider.of<BarcodeDataProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
   return(Center(
         child: SizedBox(
           width: 350,
           height: 350,
           child: UiKitView(viewType: 'ScannerView'),
         )));
  }

  @override
  void dispose() {
    _barcodeDataProvider.disposeController();
    _barcodeDataProvider.clearQrText();
    super.dispose();
  }
}
