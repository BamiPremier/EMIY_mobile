// Start of Selection

import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';

part 'report_state.dart';

mixin XReportedItem  {
  String get itemId;
}

mixin ReportService<T> {
  Future<void> reportItem({
    required String idItem,
    required String reason,
  });
  Future<void> reportComment({
    required String idItem,
    required String reason,
  });
}

class ReportCubit<T extends XReportedItem>
    extends ObjectCubit<XReportedItem, XReportState> {
  final ReportService<T> reportService;

  ReportCubit(this.reportService, XReportedItem item)
      : super(InitializingXReportState(item));

  void report({required String reason, isComment = false}) {
    if (state is InitializingXReportState) {
      final stateBefore = state;

     
      emit(const SendReportLoadingState());
      (isComment
              ? reportService.reportComment(
                  idItem: item.itemId,
                  reason: reason,
                )
              : reportService.reportItem(
                  idItem: item.itemId,
                  reason: reason,
                ))
          .then((_) {
        emit(const SuccessSendReportItemState());
      }, onError: (error, trace) {
        emit(ReportErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void applyReport() {
    if (state is SuccessSendReportItemState) {
      emit(SuccessReportItemState(item));
      reset();
    }
  }

  void reset() {
    emit(InitializingXReportState(item));
  }

  XReportedItem get item {
    final item = getObject(state) ?? object;

    if (item != null) return item;
    throw UnsupportedError(
        'cannot retrieve item: Current state is ${state.runtimeType}');
  }

  @override
  XReportedItem? getObject(XReportState state) {
    if (state is InitializingXReportState) {
      return state.item;
    }
    return null;
  }

  @override
  void update(XReportedItem object) {
    if (object is T) {
      emit(InitializingXReportState(object));
    }
  }
}
