# Task Progress for Ecommerce App
A Flutter Mobile Application built for the 2024 A2SV Summer Internship in the mobile team.

## Table of contents
- [Task 9](#task-9)
- [Task 10](#task-10)
- [Task 11](#task-11)
- [Task 12](#task-12)
- [Task 13](#task-13)
- [Task_14](#task-14)
- [Task_15](#task-15)
- [Task_16](#task-16)
  
## Task 9: Entities, Use Cases, and Repositories

### Task Objectives
 - ✔️ Create entities for the products in the eCommerce Mobile App.
 - ✔️ Define use cases for inserting, updating, deleting, and getting a product.
 - ✔️ Implement repositories to handle data operations for the products.

### Testing the usecase
![Screenshot 2024-08-07 120634](https://github.com/user-attachments/assets/7aacc7a7-908d-4c72-9a8d-830d9f5178a7)


## Task 10: Data Overview Layer

### Task Objectives
- ✔️ Step 1: Folder Setup
- ✔️ Step 2: Implement Models
- ✔️ Step 3: Documentation

### Testing model layer
![Screenshot 2024-08-07 170342](https://github.com/user-attachments/assets/0821d2db-31b0-4b33-a9d0-b7ba6641779c)


## Task 11: Contracts of Data Sources 

### Task Objectives
- ✔️ Contract and Repository
  - ✔️ Implementation of a contract defining repository methods
  - ✔️ Interfaces or abstract classes for repository dependencies
  - ✔️ Basic structure of the repository

## Task 12: Implement Repository

### Task Objectives
- ✔️ Contract and Repository:
 - ✔️ Use local datasource when network is unavailable
 - ✔️ Use remote datasource when network is available

### Commit links
- https://github.com/AryamEzra/2024-internship-mobile-tasks/commit/7e7a750c32afa4debaed16a9f723fe4f265c9738


## Task 13: Implement Network Info

### Task Objectives
- ✔️ Step 1: Create the NetworkInfo Class 
 - ✔️ Class Definition
    - Create a new Dart file named network_info.dart and correctly define the NetworkInfo abstract class along with the NetworkInfoImpl class that implements it, using the provided starting point.
 - ✔️ Constructor and Implementation
   -  Implement the NetworkInfoImpl class constructor that takes an InternetConnectionChecker instance.
   -  Implement the isConnected getter method using the provided resource, ensuring proper usage of the connectionChecker instance.

- ✔️ Step 2: Use NetworkInfo in the Repository 
 - ✔️ Import and Dependency Injection 
 - ✔️ Network Connectivity Usage 
 - ✔️ Error Handling
   
### Commit links
- https://github.com/AryamEzra/2024-internship-mobile-tasks/commit/cefb3da59eee3f01999d23b3770624447a0e06cb


## Task 14 - Task 14: Implement Local Data Source

### Task Objectives
- ✔️ Add SharedPreferences to project packages
 - ✔️ Implementing local datasource 
 - ✔️ Complete ProductLocalDatasourceImpl class
 - ✔️ Write test

### Commit links:
- https://github.com/AryamEzra/2024-internship-mobile-tasks/commit/be47c42af14482aa3635884044f2147073073fc2

  
## Task 15: Implement Remote Data Source

### Task Objectives
- ✔️ Implementing remote datasource
 - ✔️ Complete ProductRemoteDatasourceImpl class
 - ✔️ Write test


## Task 16: Improve Code Organization and Reusability

### Task Objectives
- ✔️ Code Organization
- ✔️ Reusability 
- ✔️ Integration and Funcionality
 
### Commit links:
- https://github.com/AryamEzra/2024-internship-mobile-tasks/commit/bff2d6de75a8de51acc141b576069a56ded25cc8

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
