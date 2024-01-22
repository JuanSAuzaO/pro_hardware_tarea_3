import 'package:flutter/material.dart';
import 'components/new_product_modal.dart';
import 'components/product.card.dart';
import 'layouts/h1.dart';
import '../repository/product_record_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic name;
  dynamic description;
  dynamic price;
  final ProductRecordRepository productRecordRepository = ProductRecordRepository();
  void showErrors (dynamic response) {
    name = response['name'] == null ? '' : 'Name: ${response['name'][0]}\n';
    description = response['description'] == null ? '' : 'Description: ${response['description'][0]}\n';
    price = response['price_cents'] == null ? '' : 'Price: ${response['price_cents'][0]}\n';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You have the following errors:',
            style: TextStyle(
              color: Colors.red,
              fontSize: 26,
              fontWeight: FontWeight.w600
            ),
          ),
          content: Text(
            '$name'
            '$description'
            '$price',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 26,
              fontWeight: FontWeight.w600
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 26,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
            child: Center(
              child: H1('Pro Hardware Extreme', color: Colors.white,)
            )
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>?>(
              future: productRecordRepository.fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No products to show',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) =>
                  ProductCard(
                    snapshot.data![index]['name'],
                    snapshot.data![index]['description'],
                    snapshot.data![index]['price_cents']
                  ),
                  separatorBuilder: (_,__) => const SizedBox(height: 40,),
                  itemCount: snapshot.data!.length,
                );
              },
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 24, bottom: 24),
        child: SizedBox(
          width: 55,
          height: 55,
          child: FloatingActionButton(
            onPressed: () => _showNewProductModal(context),
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 32
            ),
          ),
        ),
      ),
    );
  }
  void _showNewProductModal (BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => NewProductModal(
        onProductCreated: (Map<String, dynamic> product) async {
          final response = await productRecordRepository.createProduct(product);
          if (response == true) {
            setState(() {});
          } else {
            showErrors(response);
          }
        },
      ),
    );
  }
}