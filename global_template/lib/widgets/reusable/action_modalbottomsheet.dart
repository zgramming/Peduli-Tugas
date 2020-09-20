import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

enum TypeAction { DeleteAndEdit, Delete, Edit, None }

class ActionModalBottomSheet extends StatelessWidget {
  final WrapAlignment align;
  final double spacing;
  final List<ActionCircleButton> children;
  final TypeAction typeAction;
  final TextDirection textDirection;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  ActionModalBottomSheet({
    this.align = WrapAlignment.end,
    this.spacing = 20.0,
    this.children = const <ActionCircleButton>[],
    this.typeAction = TypeAction.DeleteAndEdit,
    this.textDirection = TextDirection.ltr,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    bool deleteIsVisible;
    bool editIsVisible;

    switch (typeAction) {
      case TypeAction.Delete:
        deleteIsVisible = true;
        editIsVisible = false;
        break;
      case TypeAction.Edit:
        deleteIsVisible = false;
        editIsVisible = true;
        break;
      case TypeAction.None:
        deleteIsVisible = false;
        editIsVisible = false;
        break;
      default:
        deleteIsVisible = true;
        editIsVisible = true;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Wrap(
        alignment: align,
        spacing: spacing,
        textDirection: textDirection,
        children: [
          ActionCircleButton(
            isVisible: deleteIsVisible,
            backgroundColor: colorPallete.red,
            foregroundColor: colorPallete.white,
            icon: Icons.delete,
            onTap: onDelete,
          ),
          ActionCircleButton(
            isVisible: editIsVisible,
            backgroundColor: colorPallete.primaryColor,
            foregroundColor: colorPallete.white,
            icon: Icons.mode_edit,
            onTap: onEdit,
          ),
          ...children
        ],
      ),
    );
  }
}
