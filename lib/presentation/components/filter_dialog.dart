import 'package:flutter/material.dart';

import 'custom_button.dart';

class FilterDialog extends StatefulWidget {
  final List<String> filters;
  final List<bool> initialSelection;
  final String title;
  final void Function(List<bool>) onApply;
  final void Function()? onYesPressed;

  const FilterDialog({
    super.key,
    required this.filters,
    required this.initialSelection,
    required this.title,
    required this.onApply,
    this.onYesPressed,
  });

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
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SourceSans3',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              for (int i = 0; i < widget.filters.length; i++)
                CheckboxListTile(
                  title: Text(
                    widget.filters[i],
                    style: const TextStyle(
                      fontFamily: 'SourceSans3',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: _selectedFilters[i],
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedFilters[i] = value ?? false;
                    });
                  },
                  activeColor: const Color(0xff0A7AFF),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 24, top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'No',
                      textColor: Colors.white,
                      buttonColor: const Color(0xffDA1E28),
                      borderColor: const Color(0xffDA1E28),
                      width: MediaQuery.of(context).size.width / 3.25,
                      borderRadius: 6,
                      fontSize: 18,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CustomButton(
                      text: 'Yes',
                      textColor: Colors.white,
                      buttonColor: const Color(0xff094546),
                      borderColor: const Color(0xff094546),
                      width: MediaQuery.of(context).size.width / 3.25,
                      borderRadius: 6,
                      fontSize: 18,
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
        ),
      ),
    );
  }
}
