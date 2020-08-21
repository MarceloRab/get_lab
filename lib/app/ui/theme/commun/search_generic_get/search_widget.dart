import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_lab/app/ui/theme/commun/search_generic_get/searcher.dart';

class SearchWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final VoidCallback onCancelSearch;

  //final Searcher searcher;
  final TextCapitalization textCapitalization;
  final String hintText;

  //final ProductsController controller =
  //Modular.get<ProductsController>();
  final Searcher controller;

  const SearchWidget({
    @required this.controller,
    @required this.onCancelSearch,
    this.color,
    this.textCapitalization,
    this.hintText,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    // to handle notches properly
    return SafeArea(
      //top: true,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildBackButton(),
          Expanded(child: _buildTextField()),
          _buildClearButton(),
        ],
      ),
    );
  }

  Widget _buildClearButton() {
    return Obx(() {
      if (!controller.isModSearch.value || controller.search.value.isEmpty)
        return SizedBox.shrink();
      return IconButton(
        padding: EdgeInsets.only(top: 12),
        icon: Icon(
          Icons.close,
          color: color,
        ),
        onPressed: () {
          //searcher.onClearSearchQuery;
          controller.procure = '';
        },
      );
    });
  }

  Widget _buildBackButton() {
    return IconButton(
      padding: EdgeInsets.only(top: 12),
      icon: Icon(Icons.arrow_back, color: color),
      onPressed: onCancelSearch,
    );
  }

  Widget _buildTextField() {
    final TextEditingController textController = _getController();

    // dentro de uma lista vazi caso procura numa lista ainda vazia
    return TextField(
      controller: textController,
      //textAlign: TextAlign.left,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.only(top: 12.0),
        hintText: hintText,
      ),
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      style: const TextStyle(fontSize: 18.0),
      onChanged: (text) {
        controller.procure = text;
      },
    );
  }

  TextEditingController _getController() {
    final TextEditingController textController = TextEditingController();

    textController.value =
        TextEditingValue(text: controller.search.value ?? '');
    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: textController.text?.length ?? 0),
    );
    return textController;
  }
}
