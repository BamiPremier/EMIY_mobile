part of 'common_cubit.dart';

mixin XCommonState on Equatable {}

class InitializingXCommonState extends CubitSuccessState with XCommonState {
  final XItem item;

  const InitializingXCommonState(this.item);

  @override
  List<Object?> get props => [item];
}

class XLoadingState extends CubitLoadingState with XCommonState {
  const XLoadingState() : super();
}

class ShareItemLoadingState extends CubitLoadingState with XCommonState {
  const ShareItemLoadingState() : super();
}

class ShareItemSuccesState extends CubitInformationState with XCommonState {
  final String shareLink;

  const ShareItemSuccesState(this.shareLink);

  @override
  List<Object?> get props => [shareLink];
}

class CommentItemSuccesState extends CubitInformationState with XCommonState {
  final dynamic comment;

  const CommentItemSuccesState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class SendReportLoadingState extends CubitLoadingState with XCommonState {
  const SendReportLoadingState() : super();
}

class SuccessSendReportItemState extends CubitSuccessState with XCommonState {
  final XItem item;

  const SuccessSendReportItemState(this.item);

  @override
  List<Object?> get props => [item];
}

class XErrorState extends CubitErrorState with XCommonState {
  XErrorState(super.error, [super.trace]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
