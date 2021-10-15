// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

enum Sex {
  male,
  female,
  other,
}

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({Key? key}) : super(key: key);

  @override
  _AddUserWidgetState createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  DropdownButton<int> _buildDateWidget() {
    List<int> dates = [];
    for (var date = 1; date <= 31; date++) {
      dates.add(date);
    }

    return DropdownButton<int>(
      value: 1,
      onChanged: (value) {},
      items: dates
          .map((date) => DropdownMenuItem(
                value: date,
                child: Text("$date"),
                onTap: () {
                  print("ontap date $date");
                },
              ))
          .toList(),
    );
  }

  Widget _buildYearWidget() {
    List<int> years = [];
    for (var year = 1950; year <= 2021; year++) {
      years.add(year);
    }

    return DropdownButton<int>(
      value: 2021,
      onChanged: (value) {},
      items: years
          .map((year) => DropdownMenuItem(
                value: year,
                child: Text("$year"),
                onTap: () {
                  print("ontap year $year");
                },
              ))
          .toList(),
    );
  }

  Widget _buildMonthWidget() {
    return DropdownButton<int>(
      items: [
        DropdownMenuItem(
          value: 1,
          child: Text("January"),
          onTap: () {
            print("ontap month 1");
          },
        ),
        DropdownMenuItem(
          value: 2,
          child: Text("February"),
          onTap: () {
            print("ontap month 2");
          },
        ),
        DropdownMenuItem(
          value: 3,
          child: Text("March"),
          onTap: () {
            print("ontap month 3");
          },
        ),
        DropdownMenuItem(
          value: 4,
          child: Text("April"),
          onTap: () {
            print("ontap month 4");
          },
        ),
        DropdownMenuItem(
          value: 5,
          child: Text("May"),
          onTap: () {
            print("ontap month 5");
          },
        ),
        DropdownMenuItem(
          value: 6,
          child: Text("June"),
          onTap: () {
            print("ontap month 6");
          },
        ),
        DropdownMenuItem(
          value: 7,
          child: Text("July"),
          onTap: () {
            print("ontap month 7");
          },
        ),
        DropdownMenuItem(
          value: 8,
          child: Text("August"),
          onTap: () {
            print("ontap month 8");
          },
        ),
        DropdownMenuItem(
          value: 9,
          child: Text("September"),
          onTap: () {
            print("ontap month 9");
          },
        ),
        DropdownMenuItem(
          value: 10,
          child: Text("October"),
          onTap: () {
            print("ontap month 10");
          },
        ),
        DropdownMenuItem(
          value: 11,
          child: Text("November"),
          onTap: () {
            print("ontap month 11");
          },
        ),
        DropdownMenuItem(
          value: 12,
          child: Text("December"),
          onTap: () {
            print("ontap month 12");
          },
        ),
      ],
      value: 1,
      onChanged: (int? value) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
        ),
        title: Text("Create new user"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            color: Colors.grey.shade200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Username"),
                TextField(
                  maxLength: 30,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Password",
                ),
                TextField(
                  maxLength: 20,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Birthday"),
                Row(
                  children: [
                    _buildDateWidget(),
                    SizedBox(
                      width: 8,
                    ),
                    _buildMonthWidget(),
                    SizedBox(
                      width: 8,
                    ),
                    _buildYearWidget(),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Sex"),
                _buildSexGroup(),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: false,
                onChanged: (bool? newValue) {},
              ),
              Text("I accept the Terms of Service"),
            ],
          ),
          Expanded(child: Container()),
          _buildAddUserButton()
        ],
      ),
    );
  }

  Widget _buildAddUserButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Add user"),
      ),
    );
  }

  Widget _buildSexGroup() {
    return Row(
      children: [
        Radio<Sex>(
          value: Sex.male,
          groupValue: Sex.other,
          onChanged: (newValue) {},
        ),
        Text("Male"),
        SizedBox(
          width: 8,
        ),
        Radio<Sex>(
          value: Sex.female,
          groupValue: Sex.other,
          onChanged: (newValue) {},
        ),
        Text("Female"),
        SizedBox(
          width: 8,
        ),
        Radio<Sex>(
          value: Sex.other,
          groupValue: Sex.other,
          onChanged: (newValue) {},
        ),
        Text("Other"),
      ],
    );
  }
}
