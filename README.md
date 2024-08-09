# auvnet_internship

## Table of Contents

1. [Project Setup and Installation Guide](#setup)
2. [Architectural Overview](#architecture)
3. [API Documentation](#api)
4. [Rationale](#rationale)

<a name="setup"></a>
## 1. Project Setup and Installation Guide

### Prerequisites

- **Flutter SDK**: Ensure that the Flutter SDK is installed on your machine. You can follow the official Flutter [installation guide](https://flutter.dev/docs/get-started/install) to set it up.
- **Dart**: Dart is required as it is the programming language used for Flutter. Ensure that Dart is included when setting up Flutter.
- **IDE**: Any IDE can be used for development, but Visual Studio Code (VS Code) or Android Studio is recommended for better integration with Flutter.

### Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your-repository-url.git
    cd your-project-directory
    ```

2. **Install Dependencies**: 
    Run the following command to install the required dependencies:
    ```bash
    flutter pub get
    ```

3. **Run the Application**:
    To run the application on an emulator or connected device:
    ```bash
    flutter run
    ```

<a name="architecture"></a>
## 2. Architectural Overview

The project is organized into several key directories, each with a specific purpose:

### Directories

- **consts**: Contains constant files such as `appString.dart`, `colors.dart`, etc., which hold string literals and color schemes used throughout the app.
  
- **models**: This directory is where the data models are defined. These models represent the data structure and are used to map data from APIs or local sources.
  
- **services**: Contains the service classes responsible for handling data fetching, API calls, and other data-related tasks.
  
- **views**: Contains the UI components and screens of the application. Each feature of the app typically has its own sub-directory:
  - **carview**: Manages the cart-related views and logic.
  - **catView**: Handles views related to categories.
  - **HomeView**: Includes the main home screen and associated components.
  - **loginview**: Manages the login screen and associated logic.
  - **product_details**: Handles the product details view and its associated logic.

- **cubite**: Each feature's view has a corresponding `cubite` directory, which includes files like `cubite.dart`, `state.dart`, and other related files. These manage the state of each feature using the Cubit pattern (part of the Bloc library).

### Key Files

- **main.dart**: The entry point of the application.
- **reuseWidgets.dart**: Contains reusable widgets that can be used across different views.

<a name="api"></a>
## 3. API Documentation

For testing and interacting with the API, you can use the following Postman collection:

[Postman API Collection](https://www.getpostman.com/collections/94db931dc503afd508a5)

Import this collection into Postman to view and test all the available endpoints.

<a name="rationale"></a>
## 4. Rationale

### Why this Architecture?

- **Scalability**: The directory structure allows the app to scale easily as more features are added. Each feature is isolated within its own folder, making it easier to manage.
  
- **Reusability**: By separating views, models, services, and constants, code reusability is maximized. For instance, reusable widgets are stored in `reuseWidgets.dart` to avoid code duplication.
  
- **State Management**: The use of Cubit (part of the Bloc library) ensures that the state of the application is managed efficiently and is predictable. Each feature's state is managed separately, allowing for better modularity and testability.
  
- **Separation of Concerns**: Each directory and file has a clear responsibility, which aligns with the principles of clean code and separation of concerns. This makes the codebase more maintainable and easier to understand.
