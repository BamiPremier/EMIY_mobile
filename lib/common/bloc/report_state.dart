part of 'report_cubit.dart';

mixin XReportState on Equatable {}

class InitializingXReportState extends CubitSuccessState with XReportState {
  final XReportedItem item;
  const InitializingXReportState(this.item);
  @override
  List<Object?> get props => [item];
}

class SendReportLoadingState extends CubitLoadingState with XReportState {
  const SendReportLoadingState() : super();
}

class SuccessSendReportItemState extends CubitSuccessState with XReportState {
  const SuccessSendReportItemState();
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class SuccessReportItemState extends CubitInformationState with XReportState {
  final XReportedItem item;
  const SuccessReportItemState(this.item);
  @override
  List<Object?> get props => [item];
}

class ReportErrorState extends CubitErrorState with XReportState {
  ReportErrorState(super.error, [super.trace]);
}
