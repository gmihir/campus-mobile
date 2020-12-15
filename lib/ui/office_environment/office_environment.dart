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
    return(
      Center(
        child: Column(
          children: [
            Text("Zone 301", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text("Price Center, 3rd floor"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 48.0, top: 16.0),
                        child: Text(
                          "WINDOWS: CLOSED",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          )
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 48.0, top: 4.0),
                        child: Text(
                            "HVAC: ON",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 48.0, top: 16.0),
                        child: Text(
                            "OUTSIDE TEMP",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            )
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 48.0, top: 4.0),
                        child: Row(
                          children: [
                            Icon(Icons.wb_sunny, color: Colors.yellow),
                            Text("88\u00B0", style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}