import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gym_fit/screens/setting_user.dart';
import 'package:provider/provider.dart';
import '../providers/functionuser.dart';
import '../providers/user.dart';
import '../utils/colors_util.dart';
import 'package:intl/intl.dart';

class EditThongTinCaNhanScreen extends StatefulWidget {
  static const routeName = '/editthongtincanhan';

  @override
  State<EditThongTinCaNhanScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditThongTinCaNhanScreen> {
  final _form = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _weightFocusNode = FocusNode();
  final _heightFocusNode = FocusNode();
  final _dateofbirthFocusNode = FocusNode();
  final dateFormat = DateFormat("dd-MM-yyyy");

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
      final userId = ModalRoute.of(context)?.settings.arguments as int;

      if (userId != null) {
        _editUser = Provider.of<Users>(context, listen: false).findbyId(userId);
        _initValues = {
          'name': _editUser.Name,
          'phone': _editUser.Phone.toString(),
          'dateofbirth': _editUser.DateOfBirth.toString(),
        };
      }
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
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _form.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Users>(context, listen: false)
        .updateUser(_editUser.id, _editUser);

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context)
        .pushNamed(SettingUserSrceen.rounteName, arguments: _editUser.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cá nhân'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                hexStringToColor('41413f'),
                hexStringToColor('777777'),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      width: 115,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/avater.jpg"),
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
                                color: Colors.black,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Morgan James',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'OpenSans',
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 2,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      height: 300.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: _form,
                          child: ListView(
                            children: <Widget>[
                              TextFormField(
                                initialValue: _initValues['name'],
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  icon: Icon(Icons.person_add_alt_1_outlined),
                                ),
                                textInputAction: TextInputAction.next,
                                focusNode: _nameFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_dateofbirthFocusNode);
                                },
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
                              DateTimeField(
                                initialValue: _editUser.DateOfBirth,
                                format: dateFormat,
                                focusNode: _dateofbirthFocusNode,
                                decoration: InputDecoration(
                                  labelText: 'Birth Day',
                                  icon: Icon(Icons.cake_outlined),
                                ),
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
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_phoneFocusNode);
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
                              TextFormField(
                                initialValue: _initValues['phone'],
                                decoration: InputDecoration(
                                  labelText: 'Phone',
                                  icon: Icon(Icons.phone_callback_outlined),
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                focusNode: _phoneFocusNode,
                                onFieldSubmitted: (_) {
                                  _saveForm();
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          // child: Column(
          //   children: <Widget>[
          //     SizedBox(
          //       height: 150,
          //       width: 115,
          //       child: Stack(
          //         clipBehavior: Clip.none,
          //         fit: StackFit.expand,
          //         children: [
          //           CircleAvatar(
          //             backgroundImage: AssetImage("assets/images/avater.jpg"),
          //           ),
          //           Positioned(
          //             bottom: 0,
          //             right: -25,
          //             child: RawMaterialButton(
          //               onPressed: () {},
          //               elevation: 2.0,
          //               fillColor: Color(0xFFF5F6F9),
          //               child: Icon(
          //                 Icons.camera_alt_outlined,
          //                 color: Colors.black,
          //               ),
          //               padding: EdgeInsets.all(15.0),
          //               shape: CircleBorder(),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           'Morgan James',
          //           style: TextStyle(
          //             fontSize: 25,
          //             fontFamily: 'OpenSans',
          //             letterSpacing: 0.5,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //     const Divider(
          //       height: 20,
          //       thickness: 2,
          //       indent: 30,
          //       endIndent: 30,
          //       color: Colors.yellow,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(
          //         left: 40,
          //         top: 10,
          //       ),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(top: 3),
          //             child: Icon(
          //               Icons.person_add_alt_1_outlined,
          //               size: 27,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(),
          //             child: Text(
          //               'Nick Name',
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40, top: 10),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Icon(
          //               Icons.phone_callback_outlined,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Text(
          //               'Contact',
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40, top: 10),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Icon(
          //               Icons.email_outlined,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Text(
          //               'Email',
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //           // TextFormField(),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40, top: 10),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Icon(
          //               Icons.badge_outlined,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Text(
          //               'Package',
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //           // TextFormField(),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40, top: 10),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Icon(
          //               Icons.height_outlined,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Text(
          //               'Height',
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //           // TextFormField(),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40, top: 10),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Icon(
          //               Icons.scale_outlined,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Text(
          //               'Weight',
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //           // TextFormField(),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 40, top: 10),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Icon(
          //               Icons.cake_outlined,
          //               color: Colors.white,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 30,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: Text(
          //               'Birthday',
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontFamily: 'OpenSans',
          //                 letterSpacing: 0.5,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //           // TextFormField(),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
