import 'dart:ffi';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:gym_fit/screens/setting_user.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:gym_fit/screens/editthongtincanhan.dart';
import '../screens/diary.dart';
import 'package:gym_fit/screens/home.dart';
import 'package:provider/provider.dart';

import '../providers/functionuser.dart';
import '../providers/user.dart';
import './tab_bar.dart';

class UserAddDataScreen extends StatefulWidget {
  static const routeName = '/useradddata';
  @override
  State<UserAddDataScreen> createState() => _UserAddDataScreenState();
}

class _UserAddDataScreenState extends State<UserAddDataScreen> {
  final _addFormKey = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _weightFocusNode = FocusNode();
  final _heightFocusNode = FocusNode();
  final _dateofbirthFocusNode = FocusNode();
  final dateFormat = DateFormat("dd-MM-yyyy");

  late List<User> listUser;
  late String name;
  late int phone;
  late int id;
  late DateTime dateofbirth;
  var _editUser = User(
    id: 0,
    Name: '',
    Phone: 0,
    DateOfBirth: null,
    package: null,

    // Email: '',
    // Weight: 0,
    // Height: 0,
    // Address: '',
    // Password: '',
    // Target: '',
    // gender:
  );
  var _initValues = {
    'name': '',
    'phone': '',
    'email': '',
    'password': '',
    'target': '',
    'dateofbirth': '',
    'height': '',
    'weight': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      var userId = ModalRoute.of(context)?.settings.arguments as int;
      if (userId != null) {}
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameFocusNode.dispose();
    _dateofbirthFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _addFormKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _addFormKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<Users>(context, listen: false).addUser(_editUser);
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text('Something went wrong.'),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pushNamed(TabBarSrceen.rountName);
              },
            )
          ],
        ),
      );
    }
    // finally {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   Navigator.of(context).pop();
    // }

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context)
        .pushNamed(TabBarSrceen.rountName, arguments: _editUser.id);
    // Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 15, bottom: 10, right: 15, top: 50),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  bottom: 30,
                  right: 15,
                  top: 10,
                ),
                child: Text(
                  'Thông tin cá nhân',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  bottom: 30,
                  right: 15,
                  top: 10,
                ),
                child: Text(
                  'Đừng lo lắng, bạn luôn có thể thay đổi nó sau trong phần Cài Đặt.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avater.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -25,
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Color(0xFFF5F6F9),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 300.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: _addFormKey,
                          child: ListView(
                            children: <Widget>[
                              TextFormField(
                                initialValue: _initValues['name'],
                                decoration: InputDecoration(labelText: 'name'),
                                textInputAction: TextInputAction.next,
                                focusNode: _nameFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_phoneFocusNode);
                                },
                                onChanged: (value) => name = value,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please provide a value.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editUser = User(
                                    Name: value.toString(),
                                    Phone: _editUser.Phone,
                                    DateOfBirth: _editUser.DateOfBirth,
                                    package: _editUser.package,
                                    // Address: _editUser.Address,
                                    // Email: _editUser.Email,
                                    // Height: _editUser.Height,
                                    // Password: _editUser.Password,
                                    // Target: _editUser.Target,
                                    // Weight: _editUser.Weight,
                                    id: _editUser.id,
                                  );
                                },
                              ),
                              TextFormField(
                                initialValue: _initValues['phone'],
                                decoration: InputDecoration(labelText: 'phone'),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                focusNode: _phoneFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_dateofbirthFocusNode);
                                },
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please enter a phone.';
                                  }
                                  if (int.tryParse(value.toString()) == null) {
                                    return 'Please enter a valid number.';
                                  }
                                  if (int.parse(value.toString()) <= 0) {
                                    return 'Please enter a number greater than zero.';
                                  }
                                  if (value.toString().length <= 9 ||
                                      value.toString().length > 10) {
                                    return 'Please enter a number correct format';
                                  }
                                  return null;
                                },
                                onChanged: (value) => phone = int.parse(value),
                                onSaved: (value) {
                                  _editUser = User(
                                    Name: _editUser.Name,
                                    Phone: int.parse(value!),
                                    DateOfBirth: _editUser.DateOfBirth,
                                    package: _editUser.package,
                                    // Address: _editUser.Address,
                                    // Email: _editUser.Email,
                                    // Height: _editUser.Height,
                                    // Password: _editUser.Password,
                                    // Target: _editUser.Target,
                                    // Weight: _editUser.Weight,
                                    id: _editUser.id,
                                  );
                                },
                              ),
                              DateTimeField(
                                initialValue: DateTime.now(),
                                format: dateFormat,
                                focusNode: _dateofbirthFocusNode,
                                decoration:
                                    InputDecoration(labelText: 'Birth Day'),
                                textInputAction: TextInputAction.next,
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter date.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editUser = User(
                                    Name: _editUser.Name,
                                    Phone: _editUser.Phone,
                                    DateOfBirth: value,
                                    package: _editUser.package,
                                    // Address: _editUser.Address,
                                    // Email: _editUser.Email,
                                    // Height: _editUser.Height,
                                    // Password: _editUser.Password,
                                    // Target: _editUser.Target,
                                    // Weight: _editUser.Weight,
                                    id: _editUser.id,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.yellowAccent,
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          'Quay lại',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            letterSpacing: 0.5,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveForm,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          backgroundColor: Colors.yellow,
                        ),
                        child: Text(
                          'Tiep Theo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            letterSpacing: 0.5,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
