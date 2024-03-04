import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/employee/tasks/presentation/views/task_dashboard_mobile_view.dart';

class AddTaskMobileView extends StatefulWidget {
  const AddTaskMobileView({super.key});

  @override
  State<AddTaskMobileView> createState() => _AddTaskMobileViewState();
}

class _AddTaskMobileViewState extends State<AddTaskMobileView> {
  bool isWholeDaySelected = false;
  TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 9, minute: 0);

  String selectedProject = '';
  String selectedTaskType = '';
  String taskName = '';
  String durationText = 'Duration: 00 Hours';

  void calculateDuration() {
    if (isWholeDaySelected) {
      int durationHours = 9 + endTime.hour - startTime.hour;
      setState(() {
        durationText =
            'Duration: ${durationHours.toString().padLeft(2, '0')} Hours';
      });
    } else {
      final start = DateTime(2024, 1, 1, startTime.hour, startTime.minute);
      final end = DateTime(2024, 1, 1, endTime.hour, endTime.minute);
      final duration = end.difference(start);

      setState(() {
        durationText =
            'Duration: ${(duration.inHours).toString().padLeft(2, '0')} Hours';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TaskDashboard()),
            );
          },
        ),
        title: const Text(
          'Add Task',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          color: const Color.fromRGBO(238, 238, 238, 1),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                title: const Text(
                  "Whole Day",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                value: isWholeDaySelected,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color.fromARGB(255, 157, 37, 116),
                onChanged: (newValue) {
                  setState(() {
                    isWholeDaySelected = newValue!;

                    if (isWholeDaySelected) {
                      calculateDuration();
                    } else {
                      final start = DateTime(
                          2024, 1, 1, startTime.hour, startTime.minute);
                      final end =
                          DateTime(2024, 1, 1, endTime.hour, endTime.minute);
                      final duration = end.difference(start);
                      durationText =
                          'Duration: ${(duration.inHours).toString().padLeft(2, '0')} Hours';
                    }
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.not_started_outlined),
                    Expanded(
                      child: Text(
                        " Start Time",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Icon(Icons.stop_circle_outlined),
                    Expanded(
                      child: Text(
                        " End Time",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(255, 209, 209, 209),
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: const TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  hintText: DateFormat.Hm().format(
                                    DateTime(
                                      2024,
                                      1,
                                      1,
                                      startTime.hour,
                                      startTime.minute,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: startTime,
                                  );
                                  if (selectedTime != null) {
                                    setState(() {
                                      startTime = selectedTime;
                                      calculateDuration();
                                    });
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.access_time,
                                color: Color.fromARGB(255, 157, 37, 116),
                              ),
                              onPressed: () async {
                                TimeOfDay? selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime: startTime,
                                );
                                if (selectedTime != null) {
                                  setState(() {
                                    startTime = selectedTime;
                                    calculateDuration();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(255, 209, 209, 209),
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: const TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  hintText: DateFormat.Hm().format(
                                    DateTime(
                                      2024,
                                      1,
                                      1,
                                      endTime.hour,
                                      endTime.minute,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: endTime,
                                  );
                                  if (selectedTime != null) {
                                    setState(() {
                                      endTime = selectedTime;
                                      calculateDuration();
                                    });
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.access_time,
                                color: Color.fromARGB(255, 157, 37, 116),
                              ),
                              onPressed: () async {
                                TimeOfDay? selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime: endTime,
                                );
                                if (selectedTime != null) {
                                  setState(() {
                                    endTime = selectedTime;
                                    calculateDuration();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        durationText,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Group Name',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            iconEnabledColor:
                                const Color.fromARGB(255, 157, 37, 116),
                            iconSize: 35,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: 'Select Group Name',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Group 1',
                                child: Text('Group 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Group 2',
                                child: Text('Group 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Group 3',
                                child: Text('Group 3'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                selectedProject = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Task',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: 'Insert Task Name',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedTaskType = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Task Description',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            maxLines: 4,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.only(left: 10, top: 30),
                              hintText: 'Insert Task Description',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                taskName = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 70, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // ignore: avoid_print
                                    print('$durationText');
                                    // ignore: avoid_print
                                    print('Selected Project: $selectedProject');
                                    // ignore: avoid_print
                                    print(
                                        'Selected Task Type: $selectedTaskType');
                                    // ignore: avoid_print
                                    print('Task Name: $taskName');
                                  },
                                  icon: const Icon(Icons.check,
                                      color: Colors.white),
                                  label: const Text(
                                    'Save Changes',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 157, 37, 116),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TaskDashboard()),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Color.fromARGB(255, 157, 37, 116),
                                  ),
                                  label: const Text(
                                    'Discard',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 157, 37, 116),
                                    ),
                                    maxLines: 1,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 157, 37, 116),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
