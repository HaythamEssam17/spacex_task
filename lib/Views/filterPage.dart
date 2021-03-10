import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/Controllers/launchesController.dart';
import 'package:spacex_app/Widgets/commonLaunchListTile.dart';
import 'package:spacex_app/Widgets/commonSpinKit.dart';

class FilterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  Future<void> selectDate(BuildContext context, bool isFrom) async {
    DateTime picked = await showDatePicker(
        context: context,
        // initialDate: DateTime.now(),
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2100, 1));
    if (picked != null)
      setState(() {
        if (isFrom) {
          fromDate = picked;
          fromController.text = "${fromDate.toLocal()}".split(' ')[0];
        } else {
          toDate = picked;
          toController.text = "${toDate.toLocal()}".split(' ')[0];
        }
      });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<LaunchesController>(context, listen: false).isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final launchProvider = Provider.of<LaunchesController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    launchProvider.filterLaunches(fromDate, toDate);
                  },
                  color: Colors.green,
                  child: Text('search'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (fromDate.isBefore(toDate)) {
                        selectDate(context, false);
                      }
                    },
                    child: TextField(
                      enabled: false,
                      controller: toController,
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        labelText: 'To',
                        hintText: toController.text,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: InkWell(
                    onTap: () => selectDate(context, true),
                    child: TextField(
                      enabled: false,
                      controller: fromController,
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        labelText: 'Form',
                        hintText: fromController.text,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            launchProvider.getIsLoading
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonSpinKit.customSpinKitRing(),
                      SizedBox(height: 20.0),
                      Text('Loading...')
                    ],
                  ))
                : Expanded(
                    child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: ListView(
                      children: launchProvider.getFilteredList
                          .where((e) =>
                              e.dateUtc.isAfter(fromDate) &&
                              e.dateUtc.isBefore(toDate))
                          .map((e) => CommonLaunchListTile.customLaunchListTile(
                              context, e))
                          .toList(),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
