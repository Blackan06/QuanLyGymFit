import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/functionthucan.dart';
import '../providers/thucan.dart';
import 'package:intl/intl.dart';

class ThongTinChiTietThucAnSrceen extends StatefulWidget {
  static const routeName = "/thongtinchitietthucan";
  @override
  State<ThongTinChiTietThucAnSrceen> createState() =>
      _ThongTinChiTietThucAnSrceenState();
}

class _ThongTinChiTietThucAnSrceenState
    extends State<ThongTinChiTietThucAnSrceen> {
  final _form = GlobalKey<FormState>();
  final nameController = FocusNode();
  final soLuongController = FocusNode();
  final timeController = FocusNode();
  final caloController = FocusNode();

  final dateFormat = DateFormat("HH:mm:ss");

  var _editThucAn = ThucAn(
    id: '',
    name: '',
    soLuong: 0,
    // calo: 0.0,
    time: 0,
  );
  var _initValues = {
    'name': '',
    'soluong': '',
    'time': '',
  };
  var _isInit = true;
  var _isLoading = false;

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      var userId = ModalRoute.of(context)?.settings.arguments as String;
      if (userId != null) {
        _editThucAn =
            Provider.of<FoodToday>(context, listen: false).findbyId(userId);
        _initValues = {
          'name': _editThucAn.name,
          'soluong': _editThucAn.soLuong.toString(),
          'time': _editThucAn.time.toString(),
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    soLuongController.dispose();
    timeController.dispose();
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
    if (_editThucAn.id != null) {
      await Provider.of<FoodToday>(context, listen: false)
          .updateThucAn(_editThucAn.id, _editThucAn);
    } else {
      try {
        await Provider.of<FoodToday>(context, listen: false)
            .addThucAn(_editThucAn);
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
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin chi tiết'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 100, right: 50, left: 50, bottom: 10),
                        child: Form(
                          key: _form,
                          child: Container(
                            child: ListView(
                              children: <Widget>[
                                TextFormField(
                                  initialValue: _initValues['name'],
                                  decoration:
                                      InputDecoration(labelText: 'name'),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  focusNode: nameController,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(soLuongController);
                                  },
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Please provide a value.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _editThucAn = ThucAn(
                                      name: value.toString(),
                                      soLuong: _editThucAn.soLuong,
                                      time: _editThucAn.time,
                                      id: _editThucAn.id,
                                    );
                                  },
                                ),
                                TextFormField(
                                  initialValue: _initValues['soluong'],
                                  decoration:
                                      InputDecoration(labelText: 'soluong'),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  focusNode: soLuongController,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(timeController);
                                  },
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Please enter a soluong.';
                                    }

                                    if (int.parse(value.toString()) <= 0) {
                                      return 'Please enter a number greater than zero.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _editThucAn = ThucAn(
                                      name: _editThucAn.name,
                                      soLuong: int.parse(value.toString()),
                                      time: _editThucAn.time,
                                      id: _editThucAn.id,
                                    );
                                  },
                                ),
                                DateTimeField(
                                  initialValue: DateTime.now(),
                                  format: dateFormat,
                                  focusNode: timeController,
                                  decoration:
                                      InputDecoration(labelText: 'Time'),
                                  textInputAction: TextInputAction.next,
                                  readOnly: true,
                                  keyboardType: TextInputType.number,
                                  onShowPicker: (context, currentValue) async {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          currentValue ?? DateTime.now()),
                                    );
                                    return DateTimeField.convert(time);
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter date.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _editThucAn = ThucAn(
                                      name: _editThucAn.name,
                                      soLuong: _editThucAn.soLuong,
                                      time: int.parse(value!.toString()),
                                      id: _editThucAn.id,
                                    );
                                  },
                                ),
                                // TextFormField(
                                //   initialValue: _initValues['time'],
                                //   decoration:
                                //       InputDecoration(labelText: 'time'),
                                //   textInputAction: TextInputAction.next,
                                //   keyboardType: TextInputType.number,
                                //   focusNode: timeController,
                                //   onFieldSubmitted: (_) {
                                //     FocusScope.of(context).requestFocus();
                                //   },
                                //   onSaved: (value) {
                                //     _editThucAn = ThucAnHangNgay(
                                //       name: _editThucAn.name,
                                //       calo: _editThucAn.calo,
                                //       soLuong: _editThucAn.soLuong,
                                //       time: DateTime.now(),
                                //       id: _editThucAn.id,
                                //     );
                                //   },
                                // ),
                              ],
                            ),
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
                              onPressed: () async {
                                try {
                                  await Provider.of<FoodToday>(context,
                                          listen: false)
                                      .deleteThucAn(_editThucAn.id);
                                  Navigator.of(context).pop();
                                } catch (error) {
                                  scaffold.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Deleting failed!',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
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
                                'Xóa',
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

  Future<TimeOfDay?> timePicker(BuildContext context) {
    return showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
  }
}
