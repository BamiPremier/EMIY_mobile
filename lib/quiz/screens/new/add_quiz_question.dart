import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/utils/assets.dart';

class AddQuizQuestionScreen extends StatefulWidget {
  @override
  _AddQuizQuestionScreenState createState() => _AddQuizQuestionScreenState();
}

class _AddQuizQuestionScreenState extends State<AddQuizQuestionScreen> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _propositionControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  void _addProposition() {
    if (_propositionControllers.length < 4) {
      setState(() {
        _propositionControllers.add(TextEditingController());
      });
    }
  }

  void _removeProposition(int index) {
    if (_propositionControllers.length > 2) {
      setState(() {
        _propositionControllers.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              color: Theme.of(context).colorScheme.tertiaryContainer,
              child: Center(
                child: SvgPicture.asset(
                  Assets.iconPictureAdd,
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 8),
                      const Text('Question'),
                      const SizedBox(height: 8),
                      TextFormField(
                          style: Theme.of(context).textTheme.bodyMedium,
                          controller: _questionController,
                          decoration: InputDecoration(
                            hintText: 'Pose une question',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          onEditingComplete: FocusScope.of(context).unfocus,
                          validator: (value) => Validators.empty(value)),
                      const SizedBox(height: 16),
                      const Text('Propositions'),
                    ])),
            const Divider(),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._propositionControllers.map((controller) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                style: Theme.of(context).textTheme.bodyMedium,
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: 'Entre le texte',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                ),
                                keyboardType: TextInputType.text,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.done,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                onEditingComplete:
                                    FocusScope.of(context).unfocus,
                                validator: (value) => Validators.empty(value)),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => _removeProposition(
                                _propositionControllers.indexOf(controller)),
                            child: Icon(
                              Icons.check_circle_outline,
                              size: 24,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 8),
                  if (_propositionControllers.length < 4)
                    GestureDetector(
                      onTap: _addProposition,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ajouter',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_outlined),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UmaiButton.primary(
              onPressed: () {},
              text: "Enregistrer",
            ),
          ],
        ),
      ),
    );
  }
}
