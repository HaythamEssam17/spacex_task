import 'package:flutter/material.dart';
import 'package:spacex_app/Models/rocketModel.dart';

class CommonRocketDetailsWidget {
  static Widget customRocketDetailsWidget(RocketModel model) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Rocket Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            SizedBox(height: 20.0),
            customRow('name', model.name),
            Divider(),
            customRow('country', model.country),
            Divider(),
            customRow('company', model.company),
            Divider(),
            customRow('description', model.description),
            Divider(),
            customRow('version', model.engines.version),
            Divider(),
            customRow('type', model.engines.type),
          ],
        ),
      ),
    );
  }

  static customRow(String title, String details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title)),
        Expanded(child: Text(details)),
      ],
    );
  }

  static Widget playloadDetails(Payloads model) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Payload Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            SizedBox(height: 20.0),
            customRow(
                'height',
                'Meters: ' +
                    model.compositeFairing.height.meters.toString() +
                    '\nFeets: ' +
                    model.compositeFairing.height.feet.toString()),
            Divider(),
            customRow(
                'diameter',
                'Meters: ' +
                    model.compositeFairing.diameter.meters.toString() +
                    '\nFeets: ' +
                    model.compositeFairing.diameter.feet.toString()),
          ],
        ),
      ),
    );
  }
}
