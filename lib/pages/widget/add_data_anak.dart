import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/cubit/child/child_cubit.dart';
import 'package:stuntle/data/model/child_data.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/custom_date_picker.dart';
import 'package:stuntle/pages/widget/custom_dropdown.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class AddDataAnakWidget extends StatefulWidget {
  const AddDataAnakWidget({super.key});

  @override
  State<AddDataAnakWidget> createState() => _AddDataAnakWidgetState();
}

class _AddDataAnakWidgetState extends State<AddDataAnakWidget> {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController weightTextController = TextEditingController();
  final TextEditingController longTextController = TextEditingController();
  final TextEditingController headBabyTextController = TextEditingController();

  String? _selectedDate;

  void handlDateSelected(String? date) {
    setState(() {
      _selectedDate = date;
    });
  }

  String? _selectedChildGender;
  String? _selectedChildCondition;

  void _handleChildGenderSelected(String? value) {
    setState(() {
      _selectedChildGender = value;
    });
  }

  void _handleChildConditionSelected(String? value) {
    setState(() {
      _selectedChildCondition = value;
    });
  }

  bool isNotEmptyForm() {
    if (nameTextController.text.isNotEmpty &&
        weightTextController.text.isNotEmpty &&
        longTextController.text.isNotEmpty &&
        headBabyTextController.text.isNotEmpty &&
        _selectedDate != null &&
        _selectedChildCondition != null &&
        _selectedChildGender != null) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    nameTextController.dispose();
    weightTextController.dispose();
    longTextController.dispose();
    headBabyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //name flied
        TextForm(
            textEditingController: nameTextController,
            hintText: 'Nama Anak',
            subText: 'Masukkan nama anak Anda'),

        //child date birth
        CustomDatePicker(
          title: 'Tanggal Lahir Anak',
          subTitlel: 'Pilih tanggal lahir dari anak Anda',
          onDateSelected: handlDateSelected,
        ),

        //dropdown child gender
        CustomDropDown(
          data: const ["laki", "perempuan"],
          labelText: 'Jenis Kelamin',
          subText: 'Pilih jenis kelamin dari anak Anda',
          onValueSelected: _handleChildGenderSelected,
        ),

        //kondisi lahir anak
        CustomDropDown(
          data: const ['prematur', 'sehat', 'lainnya'],
          labelText: 'Kondisi Lahir',
          subText: 'Pilih kondisi lahir dari anak Anda',
          onValueSelected: _handleChildConditionSelected,
        ),

        //berat badan anak
        TextForm(
            textEditingController: weightTextController,
            hintText: 'Berat Badan Lahir',
            subText: 'Masukkan berat badan lahir anak dalam kg'),

        //panjang badan anak
        TextForm(
            textEditingController: longTextController,
            hintText: 'Panjang Badan Lahir',
            subText: 'Masukkan panjang badan lahir anak dalam cm'),

        //lingkar anak
        TextForm(
            textEditingController: headBabyTextController,
            hintText: 'Lingkar Kepala',
            subText: 'Masukkan keliling lingkar kepala dalam cm'),
        SizedBox(
          width: double.infinity,
          child: OrangeButton(
            contentText: "Simpan",
            minimumSize: const Size(328, 48),
            maximumSize: const Size(double.infinity, 48),
            onPressedFunc: () {
              if (isNotEmptyForm()) {
                Child data = Child(
                    namaAnak: nameTextController.text,
                    tanggalLahirAnak: _selectedDate!,
                    jenisKelamin: _selectedChildGender!,
                    kondisiLahir: _selectedChildCondition!,
                    beratBadanLahir: double.parse(weightTextController.text),
                    panjangBadanLahir: double.parse(longTextController.text),
                    lingkarKepala: double.parse(headBabyTextController.text));

                context.read<ChildCubit>().addChildUserData(data);
              }
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
