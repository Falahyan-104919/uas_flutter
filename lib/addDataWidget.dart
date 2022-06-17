import 'package:flutter/material.dart';
import 'package:restfull_api_app/services/api_service.dart';
import 'models/product.dart';

class AddDataWidget extends StatefulWidget {
  AddDataWidget({Key? key}) : super(key: key);
  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Produk'),
      ),
      body: Form(
          key: _addFormKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: [
                            Text('Nama Produk:'),
                            TextFormField(
                              controller: _namaProdukController,
                              decoration: InputDecoration(
                                hintText: 'Nama Produk',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Nama Produk tidak boleh kosong';
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Column(
                                children: [
                                  Text('Harga Produk:'),
                                  TextFormField(
                                    controller: _hargaProdukController,
                                    decoration: InputDecoration(
                                      hintText: 'Harga Produk',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Harga Produk tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createProduct(Product(
                                      nama_produk: _namaProdukController.text,
                                      harga: _hargaProdukController.text,
                                      id: '8',
                                    ));
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Tambah',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
