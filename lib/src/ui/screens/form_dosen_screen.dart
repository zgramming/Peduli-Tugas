import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './edit_screen.dart';
import './form_pelajaran_screen.dart';

import '../widgets/form_dosen/dosen_image_picker.dart';

import '../../function/crud_function.dart';

class FormDosenScreen extends StatefulWidget {
  static const routeNamed = '/formdosen-screen';

  @override
  _FormDosenScreenState createState() => _FormDosenScreenState();
}

class _FormDosenScreenState extends State<FormDosenScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameDosen;
  TextEditingController emailDosen;
  TextEditingController telpDosen;

  @override
  void initState() {
    super.initState();
    final modelEdit = context.read(DosenModelEdit).state;
    nameDosen = modelEdit.idDosen == null
        ? TextEditingController()
        : TextEditingController(text: modelEdit.nameDosen);
    emailDosen = modelEdit.idDosen == null
        ? TextEditingController()
        : TextEditingController(text: modelEdit.emailDosen);
    telpDosen = modelEdit.idDosen == null
        ? TextEditingController()
        : TextEditingController(text: modelEdit.telpDosen);
  }

  @override
  Widget build(BuildContext context) {
    final detectKeyboardOpen = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer(builder: (ctx, watch, _) {
          final modelEdit = watch(DosenModelEdit).state;
          return Text(modelEdit.idDosen == null ? 'Tambah Dosen' : 'Ubah Dosen');
        }),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Tambah Pelajaran'),
                value: 'add_pelajaran',
              ),
              PopupMenuItem(
                child: Text('Ubah Dosen '),
                value: 'edit_dosen',
              ),
            ],
            onSelected: (String value) async {
              switch (value) {
                case 'add_pelajaran':
                  context.read(PelajaranModelEdit).state = PelajaranModel();
                  await Navigator.of(context).pushNamed(FormPelajaranScreen.routeNamed);
                  break;
                case 'edit_dosen':
                  await Navigator.of(context).pushNamed(
                    EditScreen.routeNamed,
                    arguments: AppConfig.MENU_DOSEN,
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
                DosenImagePicker(),
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
                            controller: nameDosen,
                            labelText: 'Nama Dosen',
                          ),
                          SizedBox(height: 20),
                          TextFormFieldCustom(
                            controller: emailDosen,
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email Dosen',
                            keyboardType: TextInputType.emailAddress,
                            isValidatorEnable: false,
                          ),
                          SizedBox(height: 20),
                          TextFormFieldCustom(
                            controller: telpDosen,
                            keyboardType: TextInputType.number,
                            inputFormatter: [WhitelistingTextInputFormatter.digitsOnly],
                            prefixIcon: Icon(Icons.local_phone),
                            labelText: 'Telepon Dosen',
                            isValidatorEnable: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kToolbarHeight),
              ],
            ),
          ),
          Positioned(
            child: Visibility(
              visible: detectKeyboardOpen > 0 ? false : true,
              child: RaisedButton(
                onPressed: () async {
                  await CRUDFunction.addAndUpdateDosen(
                    context,
                    _formKey,
                    nameDosen: nameDosen,
                    emailDosen: emailDosen,
                    telpDosen: telpDosen,
                  );
                },
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
