import 'package:flutter/material.dart';
import 'package:furniture_store/views/popup_menu_button.dart';
import '../../app_state.dart';
import '../../controllers/category_controller.dart';
import '../../models.dart';

class EditCategoryView extends StatelessWidget {
  final User user;
  final EquipmentCategory selectedCategory;
  final CategoryController categoryController;
  final VoidCallback logout;
  final Function(AppState val) changeState;

  EditCategoryView({
    super.key,
    required this.user,
    required this.selectedCategory,
    required this.categoryController,
    required this.logout,
    required this.changeState,
  }) {
    categoryController.name.text = selectedCategory.name;
    categoryController.description.text = selectedCategory.description;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () => changeState(AppState.categoryList),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white
              ),
              const Text("Edit Category"),
              const Spacer(),
              PopupMenuButtonView(changeState: changeState, logout: logout),
              const Padding(padding: EdgeInsets.only(right: 10)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              TextField(
                controller: categoryController.name,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    hintText: "Name"
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: categoryController.description,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Add Description"
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: voidEditCategory,
                child: const Text("Update", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  voidEditCategory() {
    categoryController.update(selectedCategory);
    changeState(AppState.categoryList);
  }
}