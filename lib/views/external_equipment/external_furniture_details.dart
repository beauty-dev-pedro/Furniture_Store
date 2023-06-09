import 'package:flutter/material.dart';
import 'package:furniture_store/views/details_row.dart';
import 'package:furniture_store/views/popup_menu_button.dart';

import '../../app_state.dart';
import '../../models.dart';

class ExternalDetailsView extends StatelessWidget {
  final EquipmentExt selectedExt;
  final Function(AppState val) changeState;
  final VoidCallback logout;

  const ExternalDetailsView({
    super.key,
    required this.selectedExt,
    required this.changeState,
    required this.logout,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () => changeState(AppState.externalFurniture),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white
              ),
              Text("Details of: ${selectedExt.name}"),
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
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text("Equipment Data:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              DetailsRowView(field: "ID", value: selectedExt.id.toString()),
              DetailsRowView(field: "User", value: selectedExt.user),
              DetailsRowView(field: "Name", value: selectedExt.name),
              DetailsRowView(field: "Description", value: selectedExt.description),
              DetailsRowView(field: "Created At", value: selectedExt.createdAt),
            ],
          ),
        ),
      ),
    );
  }
}