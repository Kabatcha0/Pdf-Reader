import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdfreader/component/component.dart';
import 'package:pdfreader/cubit/cubit.dart';
import 'package:pdfreader/cubit/states.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReader extends StatefulWidget {
  const PdfReader({super.key});

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PdfReaderCubit(),
      child: BlocConsumer<PdfReaderCubit, PdfReaderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PdfReaderCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.previousPagePdf();
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded)),
                IconButton(
                    onPressed: () {
                      cubit.nextPagePdf();
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded)),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("enter what page you need"),
                              content: TextFormField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (v) {
                                  cubit.x = int.parse(v);
                                },
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      cubit.jump();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Search")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.search)),
              ],
            ),
            body: SfPdfViewer.asset(
              "assets/dart.pdf",
              controller: cubit.pdf,
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      cubit.zoomIn();
                    },
                    icon: const Icon(Icons.zoom_in)),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      cubit.zoomOut();
                    },
                    icon: const Icon(Icons.zoom_out))
              ],
            ),
          );
        },
      ),
    );
  }
}
