import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'editDataWidget.dart';
import 'models/product.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget(this.product);

  final Product product;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: 440,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(children: <Widget>[
                      Text('Nama Produk:',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(widget.product.nama_produk,
                          style: Theme.of(context).textTheme.titleMedium),
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: [
                        Text('Harga Produk:',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text(widget.product.harga,
                            style: Theme.of(context).textTheme.titleMedium),
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
                              _navigateToEditScreen(context, widget.product);
                            },
                            child: Text('Edit',
                                style: TextStyle(color: Colors.white)),
                            color: Colors.blue),
                        RaisedButton(
                          splashColor: Colors.red,
                          onPressed: () {
                            _confirmDialog();
                          },
                          child: Text('Delete',
                              style: TextStyle(color: Colors.white)),
                          color: Colors.blue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, Product product) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(product)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Warning!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure want to delete this data?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    api.deleteProduct(widget.product.id);
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                  child: Text('Yes')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
            ],
          );
        });
  }
}
