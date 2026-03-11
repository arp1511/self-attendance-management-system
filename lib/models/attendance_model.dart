import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceRecord {
  final String id;
  final String userId;
  final DateTime timestamp;
  final String date; // YYYY-MM-DD
  final String time; // HH:mm:ss
  final String status;

  AttendanceRecord({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.date,
    required this.time,
    required this.status,
  });

  factory AttendanceRecord.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AttendanceRecord(
      id: doc.id,
      userId: data['userId'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      status: data['status'] ?? 'Present',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'timestamp': timestamp,
      'date': date,
      'time': time,
      'status': status,
    };
  }
}
