import 'package:flutter/material.dart';
import 'package:spacex_app/Helpers/utils.dart';
import 'package:spacex_app/Models/launchModel.dart';
import 'package:spacex_app/Views/launchDetailsPage.dart';

class CommonLaunchListTile {
  static Widget customLaunchListTile(BuildContext context, LaunchModel model) {
    var dt = Utils.parseToDateTime(model.dateUtc ?? DateTime.now());

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => LaunchDetailsPage(model)));
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                'https://farm5.staticflickr.com/4745/40110304192_b0165b7785_o.jpg',
                height: 60.0,
                width: 60.0,
              ),
              SizedBox(width: 15.0),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5.0),
                  Text(model.details ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                  SizedBox(height: 5.0),
                  Text(dt.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                ],
              )),
              SizedBox(width: 15.0),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
