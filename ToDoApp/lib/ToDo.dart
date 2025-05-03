import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<String> ToDos = [
    "Syed Muhammad Arsalan Shah",
    "Muhammad Abdul Ahad Khan",
  ];
  DateTime time = DateTime.now();
  String output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 120,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffe6ae8c), Color(0xffa8cecf)],
              stops: [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "ToDo APP | ${DateFormat("hh:mm a").format(time)}",
                style: GoogleFonts.anton(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          // Centered transparent logo
          Center(
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                "assets/BG2.jpg", 
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Main ListView
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: ToDos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(44, 146, 143, 143),
                    child: Text(
                      "${index + 1}",
                      style: GoogleFonts.anton(color: const Color(0xffe6ae8c)),
                    ),
                  ),
                  title: Text(
                    ToDos[index],
                    style: GoogleFonts.anton(
                      color: const Color.fromARGB(255, 180, 207, 168),
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Update Your Task",
                                  style: GoogleFonts.anton(
                                    color: const Color.fromARGB(
                                      255,
                                      179,
                                      207,
                                      168,
                                    ),
                                  ),
                                ),
                                content: TextField(
                                  onChanged: (value) {
                                    output = value;
                                  },
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        ToDos[index] = output;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.anton(
                                        color: const Color.fromARGB(
                                          255,
                                          179,
                                          207,
                                          168,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 179, 207, 168),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ToDos.removeAt(index);
                          });
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 230, 140, 140),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Add task button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffa8cecf),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Enter Your Task",
                  style: GoogleFonts.anton(color: const Color(0xffa8cecf)),
                ),
                content: TextField(
                  onChanged: (value) {
                    output = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (output.trim().isNotEmpty) {
                        setState(() {
                          ToDos.add(output.trim());
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      "Add",
                      style: GoogleFonts.anton(color: const Color(0xffa8cecf)),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
