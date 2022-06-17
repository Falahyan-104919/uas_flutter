import 'package:flutter/material.dart';
import 'package:restfull_api_app/services/api_service.dart';
import 'models/product.dart';

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.product);

  final Product product;
  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _editFormKey = GlobalKey<FormState>();
  String id = '';
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  void initState() {
    id = widget.product.id;
    _namaProdukController.text = widget.product.nama_produk;
    _hargaProdukController.text = widget.product.harga;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Produk'),
      ),
      body: Form(
        key: _editFormKey,
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
                            initialValue: widget.product.nama_produk,
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
                                  initialValue: widget.product.harga,
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
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              children: [
                                RaisedButton(
                                  child: Text('Edit'),
                                  onPressed: () {
                                    if (_editFormKey.currentState!.validate()) {
                                      api.updateProduct(
                                          id,
                                          Product(
                                              id: id,
                                              nama_produk:
                                                  _namaProdukController.text,
                                              harga:
                                                  _hargaProdukController.text));
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
