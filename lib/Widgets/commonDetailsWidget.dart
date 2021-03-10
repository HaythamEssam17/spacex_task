import 'package:flutter/material.dart';
import 'package:spacex_app/Helpers/utils.dart';
import 'package:spacex_app/Models/launchModel.dart';

class CommonDetailsWidget {
  static Widget customTitleDetailsCard(LaunchModel launchModel) {
    var dt =
        Utils.parseToDateTime(launchModel.staticFireDateUtc ?? DateTime.now());
    String image = launchModel.links.flickr.original.length == 0
        ? 'https://farm5.staticflickr.com/4745/40110304192_b0165b7785_o.jpg'
        : launchModel.links.flickr.original[0];

    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(image, height: 80.0, width: 80.0),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(launchModel.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0),
                        Text(launchModel.details ?? '',
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0)),
                        SizedBox(height: 5.0),
                        Text(dt.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 14.0)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Text(launchModel.details ?? '',
                style: TextStyle(color: Colors.grey, fontSize: 14.0)),
          ],
        ),
      ),
    );
  }
}
