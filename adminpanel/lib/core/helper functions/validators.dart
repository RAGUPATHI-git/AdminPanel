import 'package:flutter/widgets.dart';

class Dvalidators {
  String? notEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? lengthValidator(value, min, max) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    if (value.length < max) {
      return 'Must be at least {$min} characters';
    }
    if (value.length > min) {
      return 'Must be less than {$max} characters';
    }
    return null;
  }

  String? emailValidation(value){
      if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
  }


  String? passwordValidation(value){
     if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one number';
  }
  return null;
  }


  String? confirmPassword(value, TextEditingController passwordController){
      if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != passwordController.text) {
    return 'Passwords do not match';
  }
  return null;
  }

  String? phoneNumberValidator(value){
      if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }
  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }
  return null;
  }


  String? numberValidator(value){
    if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Only numbers are allowed';
  }
  return null;
  }
}
