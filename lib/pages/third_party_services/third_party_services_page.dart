import 'package:example_app/generated/l10n.dart';
import 'package:example_app/pages/third_party_services/auth/auth_email.dart';
import 'package:example_app/pages/third_party_services/maps/maps_page.dart';
import 'package:example_app/pages/third_party_services/stripe/stripe_example_page.dart';
import 'package:example_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ThirdPartyServicesPage extends StatelessWidget {
  const ThirdPartyServicesPage({Key? key}) : super(key: key);

  static const path = '/thirdPartyServices';

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
            title: S.of(context).authorization,
            description: S
                .of(context)
                .registrationauthorizationViaEmailViaGoogleOrAppleId,
            onPressed: () => navigator.pushNamed(AuthEmailPage.path),
          ),
          CardWidget(
            title: S.of(context).bankingServices,
            description:
                S.of(context).stripeIntegrationBankCardsGooglePayAndApplePay,
            onPressed: () => navigator.pushNamed(StripeExamplePage.path),
          ),
          CardWidget(
            title: S.of(context).mapServices,
            description: S
                .of(context)
                .integrationUsingTheExampleOfGoogleMapsAndMapboxUsing,
            onPressed: () => navigator.pushNamed(MapsPage.path),
          ),
        ],
      ),
    );
  }
}
