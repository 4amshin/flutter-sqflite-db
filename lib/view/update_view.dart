import 'package:flutter/material.dart';
import 'package:flutter_sqlite/widget/hm_save_button.dart';
import 'package:flutter_sqlite/widget/hm_text_field.dart';

import '../database/db_instance.dart';
import '../model/product_model.dart';

class UpdateView extends StatefulWidget {
  final ProductModel? productModel;
  const UpdateView({
    Key? key,
    this.productModel,
  }) : super(key: key);

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  DbInstance dbInstance = DbInstance();

  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();

  @override
  void initState() {
    dbInstance.database();
    name.text = widget.productModel!.name!;
    category.text = widget.productModel!.category!;
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Edit Data",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          children: [
            HmTextField(
              controller: name,
              label: 'Name',
            ),
            HmTextField(
              controller: category,
              label: 'Category',
            ),
            const SizedBox(height: 20),
            HmSaveButton(
              onPressed: () async {
                await dbInstance.updateData(widget.productModel!.id!, {
                  'name': name.text,
                  'category': category.text,
                  'updatedAt': DateTime.now().toString(),
                });
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
