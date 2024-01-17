import 'package:flutter/material.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/homepage/pantau/child/pemeriksaan_mandiri/widgets/camera_flied.dart';
import 'package:stuntle/pages/widget/custom_date_picker.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class FormAddDataMandiri extends StatefulWidget {
  const FormAddDataMandiri({super.key});

  @override
  State<FormAddDataMandiri> createState() => _FormAddDataMandiriState();
}

class _FormAddDataMandiriState extends State<FormAddDataMandiri> {
  final tinggiController = TextEditingController();
  final beratController = TextEditingController();
  final catatanController = TextEditingController();

  @override
  void dispose() {
    tinggiController.dispose();
    beratController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomDatePicker(
            title: 'Tanggal Cek',
            subTitlel: 'Pilih tanggal Anda melakukan pemeriksaannya',
            onDateSelected: (_) {},
          ),
          CameraFliedWidget(
            textEditingController: tinggiController,
            hintText: "Tinggi Badan",
            subText: "Masukkan tinggi badan anak saat diperiksa (cm)",
          ),
          TextForm(
            textEditingController: beratController,
            hintText: "Berat Badan",
            subText: "Masukkan berat badan anak saat diperiksa (kg)",
          ),
          TextForm(
            textEditingController: catatanController,
            hintText: "Catatan (Opsional)",
            subText: "Masukkan catatan terkait pengukuran jika ada",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: OrangeButton(
              contentText: "Masukkan",
              minimumSize: const Size(348, 48),
              maximumSize: const Size(double.infinity, 48),
              onPressedFunc: () {},
            ),
          ),
          CustomOutlineButton(
            minimumSize: const Size(348, 48),
            maximumSize: const Size(double.infinity, 48),
            contentText: "Batalkan",
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onTapFunc: () => Navigator.pop(context),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
