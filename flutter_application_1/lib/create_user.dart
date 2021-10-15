// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

enum Sex {
  female,
  male,
  other,
}

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget({Key? key}) : super(key: key);

  @override
  State<CreateUserWidget> createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget> {
  bool _isAcceptTerm = false;
  Sex _currentSex = Sex.other;
  int _currentDay = 1;
  int _currentMonth = 1;
  int _currentYear = 1980;

  TextEditingController userNameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

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
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            color: Colors.grey.shade200,
            child: _buildFormCreateUser(),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                  value: _isAcceptTerm,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _isAcceptTerm = newValue;
                      });
                    }
                  }),
              Text("I accept the Terms of Service"),
            ],
          ),
          Expanded(child: Container()),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _handleCreateUserClick();
              },
              child: Text("Create user"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormCreateUser() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Username"),
        TextField(
          controller: userNameController,
          maxLength: 30,
        ),
        SizedBox(
          height: 16,
        ),
        Text("Password"),
        TextField(
          controller: passwordController,
          maxLength: 20,
          obscureText: true,
        ),
        SizedBox(
          height: 16,
        ),
        Text("Birthday"),
        Row(
          children: [
            _buildDateWidget(),
            _buildMonthWidget(),
            _buildYearWidget(),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Text("Sex"),
        Row(
          children: [
            _buildMaleWidget(),
            _buildFemaleWidget(),
            _buildOtherWidget(),
          ],
        ),
      ],
    );
  }

  Widget _buildOtherWidget() {
    return Row(
      children: [
        Radio<Sex>(
          value: Sex.other,
          groupValue: _currentSex,
          onChanged: (Sex? value) {
            if (value != null) {
              setState(() {
                _currentSex = value;
              });
            }
          },
        ),
        Text("Other"),
      ],
    );
  }

  Widget _buildFemaleWidget() {
    return Row(
      children: [
        Radio<Sex>(
          value: Sex.female,
          groupValue: _currentSex,
          onChanged: (Sex? value) {
            if (value != null) {
              setState(() {
                _currentSex = value;
              });
            }
          },
        ),
        Text("Female"),
      ],
    );
  }

  Widget _buildMaleWidget() {
    return Row(
      children: [
        Radio<Sex>(
          value: Sex.male,
          groupValue: _currentSex,
          onChanged: (Sex? value) {
            if (value != null) {
              setState(() {
                _currentSex = value;
              });
            }
          },
        ),
        Text("Male"),
      ],
    );
  }

  Widget _buildYearWidget() {
    List<int> years = [];
    for (var year = 1970; year <= 2021; year++) {
      years.add(year);
    }

    List<DropdownMenuItem<int>> items = years.map(
      (int yearValue) {
        return DropdownMenuItem<int>(
          value: yearValue,
          child: Text("$yearValue"),
        );
      },
    ).toList();

    return DropdownButton<int>(
      value: _currentYear,
      onChanged: (int? value) {
        if (value != null) {
          setState(() {
            _currentYear = value;
          });
        }
      },
      items: items,
    );
  }

  Widget _buildMonthWidget() {
    List<DropdownMenuItem<int>> items = [
      DropdownMenuItem<int>(
        value: 1,
        child: Text("January"),
      ),
      DropdownMenuItem<int>(
        value: 2,
        child: Text("February"),
      ),
      DropdownMenuItem<int>(
        value: 3,
        child: Text("March"),
      ),
      DropdownMenuItem<int>(
        value: 4,
        child: Text("April"),
      ),
      DropdownMenuItem<int>(
        value: 5,
        child: Text("May"),
      ),
      DropdownMenuItem<int>(
        value: 6,
        child: Text("June"),
      ),
      DropdownMenuItem<int>(
        value: 7,
        child: Text("July"),
      ),
      DropdownMenuItem<int>(
        value: 8,
        child: Text("August"),
      ),
      DropdownMenuItem<int>(
        value: 9,
        child: Text("September"),
      ),
      DropdownMenuItem<int>(
        value: 10,
        child: Text("October"),
      ),
      DropdownMenuItem<int>(
        value: 11,
        child: Text("November"),
      ),
      DropdownMenuItem<int>(
        value: 12,
        child: Text("December"),
      ),
    ];
    return DropdownButton<int>(
      value: _currentMonth,
      onChanged: (int? value) {
        if (value != null) {
          setState(() {
            _currentMonth = value;
          });
        }
      },
      items: items,
    );
  }

  Widget _buildDateWidget() {
    List<int> days = [];
    for (var day = 1; day <= 31; day++) {
      days.add(day);
    }

    List<DropdownMenuItem<int>> items = days.map(
      (int dayValue) {
        return DropdownMenuItem<int>(
          value: dayValue,
          child: Text("$dayValue"),
        );
      },
    ).toList();

    return DropdownButton<int>(
      value: _currentDay,
      onChanged: (int? value) {
        if (value != null) {
          setState(() {
            _currentDay = value;
          });
        }
      },
      items: items,
    );
  }

  void _handleCreateUserClick() {
    print("Username = ${userNameController.text}");
    print("Password = ${passwordController.text}");
    print("Birthday = ${_currentDay}/${_currentMonth}/${_currentYear}");
    print("Sex = $_currentSex");
    print("Accept terms = $_isAcceptTerm");

    //TODO send info to API
  }
}
