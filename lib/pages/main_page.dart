import 'package:example_app/generated/l10n.dart';
import 'package:example_app/pages/sensors_example/sensors_example.dart';
import 'package:example_app/pages/standard_functions/standard_functions_page.dart';
import 'package:example_app/pages/third_party_services/third_party_services_page.dart';
import 'package:example_app/pages/work_with_database/database_example_page.dart';
import 'package:example_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const path = '/main';

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mainPage),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
          CardWidget(
            title: S.of(context).standardFunctions,
            description: S.of(context).listOfElements,
            onPressed: () => navigator.pushNamed(StandardFunctionsPage.path),
          ),
          CardWidget(
            title: S.of(context).thirdPartyServices,
            description: S.of(context).thirdpartyServicesIntegrationScreen,
            onPressed: () => navigator.pushNamed(ThirdPartyServicesPage.path),
          ),
          CardWidget(
            title: S.of(context).workingWithTheDatabase,
            description: S.of(context).exampleOfCreatingAListOfTasks,
            onPressed: () => navigator.pushNamed(DatabaseExamplePage.path),
          ),
          CardWidget(
            title: S.of(context).useOfSensors,
            description: S.of(context).exampleOfUseOfSensors,
            onPressed: () => navigator.pushNamed(SensorsExamplePage.path),
          ),
        ],
      ),
    );
  }
}
