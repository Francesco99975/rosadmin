import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rosadmin/providers/orders.dart';
import 'package:rosadmin/utils/snackbar_service.dart';
import 'package:go_router/go_router.dart';

class QRScannerScreen extends ConsumerStatefulWidget {
  const QRScannerScreen({super.key});

  static const routePath = "/scanner";

  @override
  ConsumerState<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends ConsumerState<QRScannerScreen> {
  final MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
        actions: [
          IconButton(
            icon: Icon(
              controller.torchEnabled ? Icons.flash_on : Icons.flash_off,
            ),
            onPressed: () => controller.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.switch_camera),
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
          controller: controller,
          onDetect: (capture) async {
            final List<Barcode> barcodes = capture.barcodes;

            if (kDebugMode) {
              for (final barcode in barcodes) {
                debugPrint('Barcode found! ${barcode.rawValue}');
              }
            }

            if (barcodes.isEmpty) {
              SnackBarService.showNegativeSnackBar(
                  context: context, message: "No Valid QR Code");
            }

            final value = barcodes[0].rawValue ?? "";

            if (value.isEmpty) {
              SnackBarService.showNegativeSnackBar(
                  context: context, message: "No Valid Value in QR Code");
            }

            final res =
                await ref.read(ordersProvider.notifier).fulfillOrder(value);

            res.match(
                (l) => SnackBarService.showNegativeSnackBar(
                    context: context, message: l.message), (_) {
              if (context.mounted) {
                context.pop();
              }
            });
          }),
    );
  }
}
