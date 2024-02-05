import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:to_do_list/common/common.dart';
import 'package:to_do_list/common/dart/extension/datetime_extension.dart';
import 'package:to_do_list/common/util/app_keyboard_util.dart';
import 'package:to_do_list/common/widget/constant_widget.dart';
import 'package:to_do_list/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:to_do_list/common/widget/w_round_button.dart';
import 'package:after_layout/after_layout.dart';
import 'package:to_do_list/common/widget/w_rounded_container.dart';
import 'package:to_do_list/screen/main/write/vo_write_todo_result.dart';

class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
  WriteTodoDialog({super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog>
    with AfterLayoutMixin {
  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
        body: RoundedContainer(
      color: context.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              "할일을 작성해주세요.".text.size(18).bold.make(),
              const Spacer(),
              _selectedDate.formattedDate.text.make(),
              IconButton(
                icon: const Icon(
                  Icons.calendar_month,
                ),
                onPressed: _selectDate,
              ),
            ],
          ),
          height20,
          Row(
            children: [
              Expanded(
                  child: TextField(
                focusNode: node,
                controller: textController,
              )),
              RoundButton(
                text: "추가",
                onTap: () {
                  widget.hide(WriteTodoResult(
                      date: _selectedDate, text: textController.text));
                },
              ),
            ],
          )
        ],
      ),
    ));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    print("123");
    AppKeyboardUtil.show(context, node);
  }

  void _selectDate() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
        initialDate: _selectedDate);

    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }
}
