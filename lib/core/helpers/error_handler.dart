import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindchoises_test_app/core/model/app_error.dart';

class ErrorHandler {
  static AppError handle(dynamic error) {
    if (error is FirebaseAuthException) {
      return _handleFirebaseAuth(error);
    }
    if (error is FirebaseException) {
      return _handleFirebase(error);
    }
    if (error is SocketException) {
      return AppError(message: 'No internet connection');
    }
    if (error is Exception) {
      return AppError(message: error.toString());
    }
    return AppError(message: 'An unexpected system error occurred');
  }
  

  static AppError _handleFirebaseAuth(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return AppError(message: 'Email or password is incorrect');

      case 'invalid-email':
        return AppError(message: 'Invalid email format');

      case 'user-disabled':
        return AppError(message: 'This account has been disabled');

      case 'email-already-in-use':
        return AppError(message: 'This email is already in use');

      case 'weak-password':
        return AppError(
          message: 'Password is too weak. Please choose a stronger password',
        );

      case 'operation-not-allowed':
        return AppError(message: 'This operation is not allowed');

      case 'requires-recent-login':
        return AppError(message: 'Please log in again to continue');

      case 'session-expired':
        return AppError(message: 'Session expired. Please log in again');

      case 'network-request-failed':
        return AppError(message: 'No internet connection');

      case 'too-many-requests':
        return AppError(message: 'Too many attempts. Please try again later');

      default:
        return AppError(
          message: error.message ?? 'A Firebase authentication error occurred',
        );
    }
  }

  static AppError _handleFirebase(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return AppError(
          message: 'You do not have permission to perform this action',
        );

      case 'not-found':
        return AppError(message: 'Requested data was not found');

      case 'already-exists':
        return AppError(message: 'This data already exists');

      case 'unavailable':
        return AppError(message: 'Service is temporarily unavailable');

      case 'deadline-exceeded':
        return AppError(message: 'Request timed out');

      case 'cancelled':
        return AppError(message: 'Operation was cancelled');

      default:
        return AppError(message: error.message ?? 'A Firebase error occurred');
    }
  }
}