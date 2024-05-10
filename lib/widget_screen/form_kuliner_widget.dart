import 'package:flutter/material.dart';
import 'package:ucp2/screen/maps_screen.dart';

class FormKulinerScreen extends StatefulWidget {
  const FormKulinerScreen({Key? key}) : super(key: key);

  @override
  _FormKulinerScreenState createState() => _FormKulinerScreenState();
}

class _FormKulinerScreenState extends State<FormKulinerScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController restaurantNameController =
      TextEditingController();
  String? _alamat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Kuliner"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: restaurantNameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: "Nama Restaurant",
                hintText: "Masukkan nama restaurant",
                prefixIcon: Icon(Icons.restaurant), // Icon for restaurant
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan nama restoran";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on), // Icon for location
                      SizedBox(width: 10),
                      Text(
                        "Alamat",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  _alamat == null
                      ? const SizedBox(
                          width: double.infinity, child: Text("Alamat Kosong"))
                      : Text('$_alamat'),
                  TextButton(
                    onPressed: () async {
                      final selectedAddress = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsScreen(
                            onLocationSelected: (selectedAddress) {
                              setState(() {
                                _alamat = selectedAddress;
                              });
                            },
                          ),
                        ),
                      );
                      if (selectedAddress != null) {
                        setState(() {
                          _alamat = selectedAddress;
                        });
                      }
                    },
                    child: _alamat == null
                        ? const Text('Pilih Alamat')
                        : const Text('Ubah Alamat'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Simpan data atau kirim data ke database
                  print("Nama Restoran: ${restaurantNameController.text}");
                  print("Alamat: $_alamat");
                  Navigator.pop(context);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
