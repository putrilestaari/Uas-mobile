import 'package:toko_bersama/halaman_produk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  


  Future _simpan() async {
    final respon = await http.
    post(Uri.parse('http://192.168.43.118/api_produk/login.php'),
        body: {
      'username': username.text,
      'password' : password.text,
    });
    if (respon.statusCode == 200) {
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.white,
      ),
      body: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: 'Masukan Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                      obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _simpan().then((value) {
                          if (value) {
                            final snackBar = SnackBar(
                              content: const Text('Data berhasil disimpan'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar = SnackBar(
                              content: const Text('Data gagal disimpan'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HalamanProduk())),
                            (route) => false);
                      }
                    },
                    child: Text('Login'))
              ],
            ),
          )),
    );
  }
}