import 'package:flutter/material.dart';

import 'custom_button.dart';

class FilterDialog extends StatefulWidget {
  final List<String> filters;
  final List<bool> initialSelection;
  final String title;
  final String yesButtonText;
  final String noButtonText;
  final Color yesButtonColor;
  final Color noButtonColor;
  final void Function(List<bool>) onApply;
  final void Function()? onYesPressed;
  final void Function()? onNoPressed;

  const FilterDialog({
    Key? key,
    required this.filters,
    required this.initialSelection,
    required this.title,
    required this.yesButtonText,
    required this.noButtonText,
    required this.yesButtonColor,
    required this.noButtonColor,
    required this.onApply,
    this.onYesPressed,
    this.onNoPressed,
  }) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late List<bool> _selectedFilters;

  @override
  void initState() {
    super.initState();
    _selectedFilters = List.from(widget.initialSelection);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff094546),
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < widget.filters.length; i++)
            CheckboxListTile(
              title: Text(widget.filters[i]),
              value: _selectedFilters[i],
              onChanged: (bool? value) {
                setState(() {
                  _selectedFilters[i] = value ?? false;
                });
              },
              activeColor: Color(0xff0A7AFF),
            ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: widget.noButtonText,
                  textColor: Colors.white,
                  buttonColor: widget.noButtonColor,
                  borderColor: widget.noButtonColor,
                  height: 38,
                  width: 126,
                  borderRadius: 6,
                  onTap: widget.onNoPressed ??
                      () {
                        Navigator.of(context).pop();
                      },
                ),
                SizedBox(width: 24),
                CustomButton(
                  text: widget.yesButtonText,
                  textColor: Colors.white,
                  buttonColor: widget.yesButtonColor,
                  borderColor: widget.yesButtonColor,
                  height: 38,
                  width: 126,
                  borderRadius: 6,
                  onTap: widget.onYesPressed ??
                      () {
                        widget.onApply(_selectedFilters);
                        Navigator.of(context).pop();
                      },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
