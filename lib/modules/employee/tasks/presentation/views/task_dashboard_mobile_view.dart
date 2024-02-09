import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/employee/tasks/presentation/views/add_task_mobile_view.dart';

class TaskDashboard extends StatelessWidget {
  const TaskDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Timesheet',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      DateFormat('dd MMMM yyyy').format(DateTime.now()),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Container(
                color: Colors.grey[200],
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 31,
                  itemBuilder: (context, index) {
                    DateTime currentDate =
                        DateTime.now().add(Duration(days: index - 2));
                    String formattedDate = DateFormat('dd').format(currentDate);
                    String formattedDay = DateFormat('E').format(currentDate);
                    bool isCurrent = index == 2;

                    return Container(
                      width: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? const Color.fromARGB(255, 157, 37, 116)
                            : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: isCurrent
                                  ? Colors.white
                                  : const Color.fromARGB(255, 157, 37, 116),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            formattedDay,
                            style: TextStyle(
                              color: isCurrent
                                  ? Colors.white
                                  : const Color.fromARGB(255, 157, 37, 116),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 600,
                  width: 100,
                  child: Container(
                    color: Colors.grey[200],
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        DateTime startTime = DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day, 9, 0);

                        DateTime currentDate =
                            startTime.add(Duration(hours: index));

                        String formattedTime =
                            DateFormat('hh:mm').format(currentDate);

                        String formattedDay =
                            DateFormat('a').format(currentDate);

                        return Expanded(
                          child: Container(
                            height: 85,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  formattedTime,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  formattedDay,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 79, 78, 78),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 600,
                    child: Container(
                      color: Colors.grey[200],
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          DateTime startTime = DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 9, 0);
                          startTime = startTime.add(Duration(hours: index));
                          DateTime endTime =
                              startTime.add(const Duration(hours: 1));

                          String timeRange =
                              '${DateFormat('hh:00 a').format(startTime)}-${DateFormat('hh:00 a').format(endTime)}';

                          return Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.assignment_turned_in_rounded,
                                    color: Color.fromARGB(255, 157, 37, 116),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Task Name',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 157, 37, 116),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const Text(
                                          'Project Name\n',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 69, 69, 69),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          timeRange,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 104, 104, 104),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskMobileView()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 157, 37, 116),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
