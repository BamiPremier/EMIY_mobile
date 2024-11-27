import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';

Future<void> reportUtilService<T extends XReportedItem>({
  required BuildContext context,
  required XReportedItem item,
  isComment = false,
  required ReportService<T> reportService,
  required void Function(BuildContext context, XReportState state)
      onReportEventReceived,
}) {
  const List<String> listReason = [
    'Haine / Discrimination',
    'Contenu sexuel',
    'Harcèlement',
    'Divulgation d\'informations privées',
    'Autre',
  ];
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
              child: BlocConsumer<ReportCubit<T>, XReportState>(
                listener: onReportEventReceived,
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
                              ...listReason.map((reason) {
                                return RadioListTile<String>(
                                  title: Text(reason),
                                  value: reason,
                                  groupValue: selectedReason,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedReason = value;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                );
                              }).toList(),
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
                      if (selectedReason != null &&
                          state is InitializingXReportState)
                        UmaiButton.primary(
                          onPressed: () => reportCubit.report(
                            reason: selectedReason!,
                            isComment: isComment
                          ),
                          text: "Signaler",
                        )
                      else UmaiButton.primary(
                        onPressed: () {
                          Navigator.of(context).pop();
                          reportCubit.applyReport();
                        },
                        text: "Fermer",
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}
