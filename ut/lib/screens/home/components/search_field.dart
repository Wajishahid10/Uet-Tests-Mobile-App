import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

/**
class SearchField extends StatefulWidget {
  SearchField({
    required this.suggestionsMap,
    required this.list_of_testNames_searchbar,
    Key? key,
  }) : super(key: key);

  final Map<String, String> suggestionsMap;
  final List<String> list_of_testNames_searchbar;
  @override
  _SearchFieldstate createState() => _SearchFieldstate();
}

class _SearchFieldstate extends State<SearchField> {
  late String selectedTest;

   */
class SearchField extends StatelessWidget {
  SearchField({
    required this.suggestionsMap,
    required this.list_of_testNames_searchbar,
    Key? key,
  }) : super(key: key);

  final Map<String, String> suggestionsMap;
  final List<String> list_of_testNames_searchbar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.72,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.17),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Autocomplete<String>(
        optionsBuilder: (value) {
          return list_of_testNames_searchbar
              .where((String test) =>
                  test.toLowerCase().startsWith(value.text.toLowerCase()))
              .toList();
        },
        displayStringForOption: (option) => option,
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          return TextField(
            onChanged: (value) => print(value),
            controller: textEditingController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(9)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search Tests",
                prefixIcon: Icon(Icons.search)),
            focusNode: focusNode,
          );
        },
        optionsViewBuilder: (BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: Container(
                width: SizeConfig.screenWidth * 0.72,
                height: SizeConfig.screenWidth * 0.42,
                color: kPrimaryColor.withOpacity(0.22),
                //        color: kSecondaryColor.withOpacity(0.70),
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    String option = options.elementAt(index);

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(
                              option,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
        onSelected: (value) {
          String Test_ID = suggestionsMap.keys
              .firstWhere((element) => suggestionsMap[element] == value);

          String selectedTest = value;
          /**
          setState(
            () {
              selectedTest = value;
            },
          );
          */
        },
      ),
    );
  }

  /**
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.72,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.17),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search Tests",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

   */
}
