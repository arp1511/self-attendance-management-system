import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../models/attendance_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Mark Attendance
  Future<String?> markAttendance(String userId) async {
    try {
      String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      // Check if attendance already marked today
      var existingRecord = await _firestore
          .collection('attendance')
          .where('userId', isEqualTo: userId)
          .where('date', isEqualTo: todayDate)
          .get();

      if (existingRecord.docs.isNotEmpty) {
        return "You have already marked your attendance for today.";
      }

      DateTime now = DateTime.now();
      String time = DateFormat('HH:mm:ss').format(now);

      await _firestore.collection('attendance').add({
        'userId': userId,
        'timestamp': FieldValue.serverTimestamp(),
        'date': todayDate,
        'time': time,
        'status': 'Present',
      });

      return null; // Success
    } catch (e) {
      return e.toString();
    }
  }

  // Get User's Attendance History (Stream)
  Stream<List<AttendanceRecord>> getUserAttendanceHistory(String userId) {
    return _firestore
        .collection('attendance')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => AttendanceRecord.fromFirestore(doc)).toList();
    });
  }

  // Get User's stats for dashboard
  Future<Map<String, dynamic>> getUserStats(String userId) async {
    var snapshot = await _firestore
        .collection('attendance')
        .where('userId', isEqualTo: userId)
        .get();

    int totalPresent = snapshot.docs.length;
    
    // For percentage calculation, we need to know when they signed up or a fixed period
    // Let's assume a fixed period or just a "streak" or "total" for now.
    // Let's calculate percentage based on days since first attendance
    if (totalPresent == 0) return {'totalPresent': 0, 'percentage': 0.0};

    // Very simple calculation for first-day-to-now period
    // In a real app, this should be more sophisticated (e.g., business days)
    // Here we'll just show total for now.
    
    return {
      'totalPresent': totalPresent,
      'percentage': 100.0, // Placeholder
    };
  }
}
