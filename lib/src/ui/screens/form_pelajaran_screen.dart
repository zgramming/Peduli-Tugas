import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import './edit_screen.dart';
import './form_tugas_screen.dart';

import '../widgets/form_pelajaran/dropdown_dosen.dart';
import '../widgets/form_pelajaran/dropdown_semester.dart';
import '../widgets/form_pelajaran/multiple_chip_choice.dart';
import '../widgets/reminder_me.dart';
import '../widgets/time_picker.dart';

import '../../function/crud_function.dart';

class FormPelajaranScreen extends StatefulWidget {
  static const routeNamed = '/formpelajaran-screen';

  @override
  _FormPelajaranScreenState createState() => _FormPelajaranScreenState();
}

class _FormPelajaranScreenState extends State<FormPelajaranScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namePelajaran = TextEditingController();
  @override
  void initState() {
    super.initState();
    final modelEdit = context.read(PelajaranModelEdit).state;
    namePelajaran = modelEdit.idPelajaran == null
        ? TextEditingController()
        : TextEditingController(text: modelEdit.namePelajaran);
  }

  @override
  Widget build(BuildContext context) {
    final detectKeyboardOpen = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer(builder: (ctx, watch, _) {
          final modelEdit = watch(PelajaranModelEdit).state;
          return Text(modelEdit.idPelajaran == null ? 'Tambah Pelajaran' : 'Ubah Pelajaran');
        }),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Tambah Tugas'),
                value: 'add_tugas',
              ),
              PopupMenuItem(
                child: Text('Ubah Pelajaran '),
                value: 'edit_pelajaran',
              ),
            ],
            onSelected: (String value) async {
              switch (value) {
                case 'add_tugas':
                  context.read(TugasModelEdit).state = TugasModel();
                  await Navigator.of(context).pushNamed(FormTugasScreen.routeNamed);
                  break;
                case 'edit_pelajaran':
                  await Navigator.of(context).pushNamed(
                    EditScreen.routeNamed,
                    arguments: AppConfig.MENU_PELAJARAN,
                  );
                  break;
                default:
                  await GlobalFunction.showToast(
                      message: 'Pilihan tidak diketahui', toastType: ToastType.Error);
                  break;
              }
            },
          ),
        ],
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
                            controller: namePelajaran,
                            prefixIcon: Icon(Icons.book),
                            labelText: 'Nama Pelajaran',
                          ),
                          SizedBox(height: 20),
                          DropdownDosen(),
                          SizedBox(height: 20),
                          DropdownSemester(),
                          SizedBox(height: 20),
                          Text('Pilih hari pelajaran',
                              style: appTheme
                                  .subtitle1(context)
                                  .copyWith(fontWeight: FontWeight.w500)),
                          SizedBox(height: 20),
                          MultipleChipChoosed(),
                          SizedBox(height: 20),
                          Text(
                            'Waktu Pelajaran',
                            style:
                                appTheme.subtitle2(context).copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 20),
                          TimePicker(),
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
              child: RaisedButton(
                onPressed: () => CRUDFunction.addAndUpdatePelajaran(
                  context,
                  _formKey,
                  namePelajaran: namePelajaran,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: colorPallete.primaryColor,
                child: Text(
                  'SIMPAN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: AppConfig.headerFont),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                textTheme: ButtonTextTheme.primary,
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
