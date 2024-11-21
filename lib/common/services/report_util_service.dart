import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umai/common/bloc/repport_cubit.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

Future<void> reportUtilService<T extends XReportedItem>({
  required BuildContext context,
  required XReportedItem item,
  isComment = false,
  required ReportService<T> reportService,
}) {
  final reportCubit = ReportCubit<T>(reportService, item);
  String? selectedReason;

  return showAppBottomSheet(
      context: context,
      maxHeight: 450,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return BlocProvider.value(
              value: reportCubit,
              child: BlocBuilder<ReportCubit<T>, XReportState>(
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Column(
                    children: <Widget>[
                      Text('Signaler ce contenu ?',
                          style: Theme.of(context).textTheme.titleLarge!),
                      if (state is InitializingXReportState)
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 16.0),
                              RadioListTile<String>(
                                title: const Text('Haine / Discrimination'),
                                value: 'Haine / Discrimination',
                                groupValue: selectedReason,
                                onChanged: (value) {
                                  setState(() {
                                    selectedReason = value;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              RadioListTile<String>(
                                title: const Text('Contenu sexuel'),
                                value: 'Contenu sexuel',
                                groupValue: selectedReason,
                                onChanged: (value) {
                                  setState(() {
                                    selectedReason = value;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              RadioListTile<String>(
                                title: const Text('Harcèlement'),
                                value: 'Harcèlement',
                                groupValue: selectedReason,
                                onChanged: (value) {
                                  setState(() {
                                    selectedReason = value;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              RadioListTile<String>(
                                title: const Text(
                                    'Divulgation d\'informations privées'),
                                value: 'Divulgation d\'informations privées',
                                groupValue: selectedReason,
                                onChanged: (value) {
                                  setState(() {
                                    selectedReason = value;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              RadioListTile<String>(
                                title: const Text('Autre'),
                                value: 'Autre',
                                groupValue: selectedReason,
                                onChanged: (value) {
                                  setState(() {
                                    selectedReason = value;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ],
                          ),
                        ),
                      if (state is SendReportLoadingState)
                        const Expanded(
                            child: Center(child: CircularProgressIndicator())),
                      if (state is SuccessSendReportItemState)
                        Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Merci d\'avoir signalé ce contenu. Nous allons prendre les mesures nécessaires en cas de contenu inapproprié avéré.',
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 40.0),
                                    toSvgIcon(icon: Assets.iconsTick, size: 24),
                                  ])),
                        ),
                      UmaiButton.primary(
                        onPressed: selectedReason != null &&
                                state is InitializingXReportState
                            ? () => reportCubit.report(
                                reason: selectedReason!, isComment: isComment)
                            : (state is SuccessSendReportItemState)
                                ? () {
                                    Navigator.of(context).pop();
                                    reportCubit.reset();
                                  }
                                : null,
                        text: state is SuccessSendReportItemState
                            ? "Fermer"
                            : "Signaler",
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}
