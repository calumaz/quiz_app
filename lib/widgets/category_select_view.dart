import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategorySelectView extends StatefulWidget {
  const CategorySelectView({super.key, required this.categoryCount});
  final Map<String, int> categoryCount;

  @override
  State<CategorySelectView> createState() => _CategorySelectViewState();
}

class _CategorySelectViewState extends State<CategorySelectView> {
  late Map<String, bool> _categoryCheckboxes = {};

  @override
  void initState() {
    for (var key in widget.categoryCount.keys) {
      _categoryCheckboxes[key] = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.categoryCount.length,
        itemBuilder: (context, index) {
          final item = widget.categoryCount.entries.elementAt(index);
          return ListTile(
              title: Row(
                children: [
                  Checkbox(
                      value: _categoryCheckboxes[item.key],
                      onChanged: ((value) {
                        setState(() {
                          _categoryCheckboxes[item.key] = value!;
                        });
                      })),
                  Text(item.key),
                ],
              ),
              trailing: Text(item.value.toString()));
        });
  }
}
