import 'package:campus_mobile_experimental/app_constants.dart';
import 'package:campus_mobile_experimental/core/providers/cards.dart';
import 'package:campus_mobile_experimental/core/providers/office_environment.dart';
import 'package:campus_mobile_experimental/core/providers/user.dart';
import 'package:campus_mobile_experimental/ui/common/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

const String cardId = 'OfficeEnvironment';

class OfficeEnvironmentCard extends StatefulWidget {
  @override
  _OfficeEnvironmentState createState() => _OfficeEnvironmentState();
}

class _OfficeEnvironmentState extends State<OfficeEnvironmentCard> {

  OfficeEnvironmentDataProvider _officeEnvironmentDataProvider = OfficeEnvironmentDataProvider();

  Widget build(BuildContext context) {
      return(
        CardContainer(
          active: Provider.of<CardsDataProvider>(context).cardStates[cardId],
          hide: () => Provider.of<CardsDataProvider>(context, listen: false).toggleCard(cardId),
          reload: () => _officeEnvironmentDataProvider.fetchData(),
          isLoading: _officeEnvironmentDataProvider.isLoading,
          titleText: CardTitleConstants.titleMap[cardId],
          errorText: _officeEnvironmentDataProvider.error,
          child: () => buildOfficeEnvironmentCard(),
        )
      );
  }

  Widget buildOfficeEnvironmentCard() {
    return Text("Hello World");
  }
}