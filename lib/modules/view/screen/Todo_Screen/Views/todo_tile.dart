import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../utils/constant/global.dart';

class Todo_Tile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  Todo_Tile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  State<Todo_Tile> createState() => _Todo_TileState();
}

class _Todo_TileState extends State<Todo_Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color(0xff9395D3),
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
        child: Container(
          height: height * 0.08,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff9395D3),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Checkbox(
                    value: widget.taskCompleted, onChanged: widget.onChanged),
                Text(
                  widget.taskName,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    (date == null)
                        ? Container()
                        : Text(
                            "${date?.day}-${date?.month}-${date?.year}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    (time == null)
                        ? Container()
                        : Text(
                            "${time?.hour}:${time?.minute}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
