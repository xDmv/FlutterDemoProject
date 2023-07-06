import 'package:example_app/generated/l10n.dart';
import 'package:example_app/pages/standard_functions/dialogs_page.dart';
import 'package:example_app/pages/standard_functions/widgets_page.dart';
import 'package:example_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class StandardFunctionsPage extends StatelessWidget {
  const StandardFunctionsPage({super.key});

  static const path = '/standardFunctions';

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).standardFunctions),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: [
          CardWidget(
            title: S.of(context).simpleElements,
            description:
                S.of(context).checkboxesRadioButtonsButtonsDatapickersAndOthers,
            onPressed: () => navigator.pushNamed(WidgetsPage.path),
          ),
          // CardWidget(
          //   title: S.of(context).forms,
          //   description: S.of(context).examplesOfFormsWithAndWithoutValidation,
          //   onPressed: () => navigator.pushNamed(WidgetsPage.path),
          // ),
          CardWidget(
            title: S.of(context).messageWindows,
            onPressed: () => navigator.pushNamed(DialogsPage.path),
          ),
        ],
      ),
    );
    return Container();
  }
}
