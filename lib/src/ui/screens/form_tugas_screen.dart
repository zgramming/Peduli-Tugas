import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../widgets/form_tugas/date_picker.dart';
import '../widgets/time_picker.dart';
import '../widgets/form_tugas/dropdown_pelajaran.dart';
import '../widgets/reminder_me.dart';

import '../../function/crud_function.dart';

class FormTugasScreen extends StatefulWidget {
  static const routeNamed = '/formtugas-screen';

  @override
  _FormTugasScreenState createState() => _FormTugasScreenState();
}

class _FormTugasScreenState extends State<FormTugasScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameTugas;
  TextEditingController deskripsiTugas;

  @override
  void initState() {
    super.initState();
    final modelEdit = context.read(TugasModelEdit).state;
    nameTugas = modelEdit.idTugas == null
        ? TextEditingController()
        : TextEditingController(text: modelEdit.nameTugas);
    deskripsiTugas = modelEdit.idTugas == null
        ? TextEditingController()
        : TextEditingController(text: modelEdit.deskripsiTugas);
  }

  @override
  Widget build(BuildContext context) {
    final detectKeyboardOpen = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer(builder: (ctx, watch, _) {
          final modelEdit = watch(TugasModelEdit).state;
          return Text(modelEdit.idTugas == null ? 'Tambah Tugas' : 'Ubah Tugas');
        }),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormFieldCustom(
                            controller: nameTugas,
                            labelText: 'Nama Tugas',
                            prefixIcon: Icon(Icons.work),
                          ),
                          SizedBox(height: 20),
                          DropdownPelajaran(),
                          SizedBox(height: 20),
                          Text(
                            'Deadline Tugas',
                            style:
                                appTheme.subtitle2(context).copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              DatePicker(),
                              TimePicker(),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormFieldCustom(
                            controller: deskripsiTugas,
                            prefixIcon: Icon(Icons.details),
                            labelText: 'Deskripsi',
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Ingatkan Aku',
                            style:
                                appTheme.subtitle2(context).copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 20),
                          ReminderMe(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kToolbarHeight * 1.5),
              ],
            ),
          ),
          Positioned(
            child: Visibility(
              visible: detectKeyboardOpen > 0 ? false : true,
              child: Consumer(
                builder: (context, watch, _) {
                  final loadingBuilder = watch(GlobalLoadingBuilder).state;
                  return RaisedButton(
                    onPressed: loadingBuilder
                        ? null
                        : () async => await CRUDFunction.addAndUpdateTugas(
                              context,
                              _formKey,
                              nameTugas: nameTugas,
                              deskripsiTugas: deskripsiTugas,
                            ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: colorPallete.primaryColor,
                    child: Text(
                      'SIMPAN',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontFamily: AppConfig.headerFont),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    textTheme: ButtonTextTheme.primary,
                  );
                },
              ),
            ),
            bottom: kToolbarHeight / 2,
            left: sizes.width(context) / 15,
            right: sizes.width(context) / 15,
          )
        ],
      ),
    );
  }
}
