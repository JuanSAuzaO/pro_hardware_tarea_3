import 'package:flutter/material.dart';
import '../../repository/product_record_repository.dart';
import '../layouts/text_input.dart';

class NewProductModal extends StatefulWidget {
  const NewProductModal({ Key ? key ,
  required this.onProductCreated}) : super(key: key);

  final void Function(Map<String, dynamic> product) onProductCreated;

  @override
  State<NewProductModal> createState() => _NewProductModalState();
}

class _NewProductModalState extends State<NewProductModal> {
  final _controller = TextEditingController();
  final _controller_2 = TextEditingController();
  final _controller_3 = TextEditingController();
  final ProductRecordRepository productRecordRepository = ProductRecordRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        color: Color(0xFF003366)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: const Color(0xFF2980b9),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      'Post a product!',
                      style: TextStyle(
                        fontSize: 26
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextInput(
                      'Product Name',
                      _controller
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextInput(
                      'Product Description',
                      _controller_2
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextInput(
                      'Product Price',
                      _controller_3
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_controller_3.text.isEmpty) {
                _controller_3.text = 0.toString();
              }
              final Map<String, dynamic> body = {
                'product': {
                  'name': _controller.text,
                  'description': _controller_2.text,
                  'price_cents':
                  (double.parse(_controller_3.text)*100).toInt()
                },
              };
              widget.onProductCreated(body);
              _navigate();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                232, 45
              ),
            ),
            child: const Text('Guardar',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _navigate() {
    Navigator.of(context).pop();
  }
}