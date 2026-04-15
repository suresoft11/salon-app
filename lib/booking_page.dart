import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingPage extends StatefulWidget {
  final String service;

  const BookingPage({super.key, required this.service});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final Color hibiscus = const Color(0xFFC2185B);

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() => selectedTime = time);
    }
  }

  Future<void> confirmBooking() async {
    // ✅ Name validation
    if (nameController.text.trim().length < 3) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter a valid name")));
      return;
    }

    // ✅ Phone validation
    if (phoneController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid 10-digit phone number")),
      );
      return;
    }

    // ✅ Date & time validation
    if (selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select date and time")),
      );
      return;
    }

    String date =
        "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
    String time = selectedTime!.format(context);

    String message =
        '''
Hello Sri Vijaya's Beauty Salon,

New Booking Request:

👤 Name: ${nameController.text}
📞 Phone: ${phoneController.text}
💇 Service: ${widget.service}
📅 Date: $date
⏰ Time: $time

Please confirm availability.
''';

    final Uri uri = Uri.parse(
      "https://wa.me/919150643388?text=${Uri.encodeComponent(message)}",
    );

    await launchUrl(uri, mode: LaunchMode.externalApplication);

    // ✅ Confirmation dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "Booking Sent",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: const Text(
            "Your booking request has been sent via WhatsApp.",
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hibiscus,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.service), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 👤 Name field (only alphabets)
            TextField(
              controller: nameController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
              decoration: const InputDecoration(
                labelText: "Customer Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // 📞 Phone field (only numbers)
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
                counterText: "",
              ),
            ),

            const SizedBox(height: 15),

            // 📅 Select Date
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hibiscus,
                foregroundColor: Colors.white,
              ),
              onPressed: pickDate,
              child: Text(
                selectedDate == null
                    ? "Select Date"
                    : "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              ),
            ),

            const SizedBox(height: 10),

            // ⏰ Select Time
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hibiscus,
                foregroundColor: Colors.white,
              ),
              onPressed: pickTime,
              child: Text(
                selectedTime == null
                    ? "Select Time"
                    : "Time: ${selectedTime!.format(context)}",
              ),
            ),

            const SizedBox(height: 30),

            // ✅ Confirm Booking
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hibiscus,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: confirmBooking,
              child: const Text(
                "Confirm Booking",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
