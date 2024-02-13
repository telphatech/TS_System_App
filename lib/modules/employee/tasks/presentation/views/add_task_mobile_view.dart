import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/employee/tasks/presentation/views/task_dashboard_mobile_view.dart';

class AddTaskMobileView extends StatefulWidget {
  const AddTaskMobileView({Key? key});

  @override
  State<AddTaskMobileView> createState() => _AddTaskMobileViewState();
}

class _AddTaskMobileViewState extends State<AddTaskMobileView> {
  bool isWholeDaySelected = false;
  TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 0);
  String selectedProject = '';
  String selectedTaskType = '';
  String taskName = '';

  @override
  Widget build(BuildContext context) {
    String durationText = 'Duration: 00 Hours';

    if (isWholeDaySelected) {
      int durationHours = endTime.hour - startTime.hour;
      durationText = 'Duration: $durationHours Hours';
    }
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
                              hintText: 'Select Project',
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Project 1',
                                child: Text('Project 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Project 2',
                                child: Text('Project 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Project 3',
                                child: Text('Project 3'),
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
                      'Team Lead Name',
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
                              hintText: 'Select Task Type',
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Task Type 1',
                                child: Text('Task Type 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Task Type 2',
                                child: Text('Task Type 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Task Type 3',
                                child: Text('Task Type 3'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                selectedTaskType = value ?? '';
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
                      'Task Name',
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
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: 'Insert Task',
                              hintStyle: TextStyle(color: Colors.grey[800]),
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
