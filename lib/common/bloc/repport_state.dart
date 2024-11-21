part of 'repport_cubit.dart';

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
  final XReportedItem item;
  const SuccessSendReportItemState(this.item);
  @override
  List<Object?> get props => [item];
}

class RpportErrorState extends CubitErrorState with XReportState {
  RpportErrorState(super.error, [super.trace]);
}
