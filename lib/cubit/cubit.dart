import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdfreader/cubit/states.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderCubit extends Cubit<PdfReaderStates> {
  PdfReaderCubit() : super(PdfReaderinitialState());
  static PdfReaderCubit get(context) => BlocProvider.of(context);
  PdfViewerController pdf = PdfViewerController();
  double zoom = 0;
  int x = 0;
  void nextPagePdf() {
    pdf.nextPage();
    emit(PdfReaderNextState());
  }

  void previousPagePdf() {
    pdf.previousPage();
    emit(PdfReaderPreviouslState());
  }

  void jump() {
    pdf.jumpToPage(x);
    emit(PdfReaderJumpState());
  }

  void zoomIn() {
    pdf.zoomLevel = zoom + 1;
    zoom++;
    print(zoom);
    emit(PdfReaderZoomInState());
  }

  void zoomOut() {
    if (pdf.zoomLevel != 0) {
      pdf.zoomLevel = zoom - 1;
      zoom--;
      print(zoom);
      emit(PdfReaderZoomOutState());
    }
  }
}
