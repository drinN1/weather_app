# weather_app

## Installation

1. Install Flutter SDK from [here](https://flutter.dev/docs/get-started/install).
2. Install IDE (Android Studio, Visual Studio Code).
3. Clone this repository.
4. Run `flutter pub get` to install dependencies.

## Running the App

### iOS
1. Open terminal and navigate to the project directory.
2. Run `flutter run` to build and run the app on iOS simulator.

### Android
1. Open terminal and navigate to the project directory.
2. Ensure an Android emulator or device is connected and recognized by Flutter.
3. Run `flutter run` to build and run the app on Android.



## Folder Structure

### lib/
The main folder containing all the source code of the Flutter app.

#### api/
Contains files related to API configurations and calls.

- **config.dart**: Defines API configurations like base URL and app ID.
- **api_configurations.dart**: Contains HTTP call functions.

#### common/
Houses common functionalities and UI components.

- **design/**
  - **colors.dart**: Defines the color palette used throughout the app.
- **widgets/**
  - **app_text_field.dart**: Custom text field widget.
  - **app_button.dart**: Custom button widget.

#### modules/
Contains modules of the app, each representing a specific feature or screen.

- **home/**
  - **data/**
    - **home_state.dart**: Manages state for the home screen.
    - **home_service.dart**: Handles data fetching and manipulation.
    - **home_repository.dart**: Acts as an intermediary between the data layer and the UI.
    - **home_notifier.dart**: Provides state management using riverpod.
  - **models/**: Contains data models used in the home module.
  - **widgets/**
    - **two_texts_row.dart**: A reusable widget used multiple times in the home screen UI.
  - **home_screen.dart**: Main UI screen for the home module.

- **welcome/**
  - **welcome_screen.dart**: UI screen for the welcome module.

#### main.dart
Entry point of the Flutter app, where the app is initialized and runs.



## Packages Used
### flutter_riverpod: ^2.3.6
- **Purpose:**
flutter_riverpod is a state management library for Flutter applications. It offers a simple and intuitive way to manage state without the boilerplate code associated with traditional state management solutions like StatefulWidget or Provider. With Riverpod, you can easily manage your app's state in a more predictable and scalable manner.

- **Why I Chose It:**
I chose flutter_riverpod for its flexibility and ease of use. It provides robust state management capabilities while maintaining a minimal footprint on our codebase. Its support for dependency injection and the ability to create and manage scoped providers make it an ideal choice for managing complex state requirements across our app.

### data_class_plugin: ^0.2.1**
- **Purpose:**
data_class_plugin is a code generation tool for creating immutable data classes in Dart. It allows us to define data models concisely using annotations, reducing the boilerplate code needed for immutable data structures.

- **Why I Chose It:**
I opted for data_class_plugin to streamline the process of creating immutable data models. By leveraging code generation, we can focus on defining the structure and properties of our data classes without the need to manually implement boilerplate code for constructors, equality checks, and other common operations. This enhances code readability and maintainability while reducing the risk of errors.

### http: ^1.2.0
- **Purpose:**
http is a package that provides HTTP client functionality for making requests and receiving responses from web servers. It simplifies the process of integrating network calls into your Flutter app, enabling communication with RESTful APIs and other web services.

- **Why I Chose It:**
Networking is a fundamental aspect of many modern mobile applications, allowing them to fetch data from remote servers and interact with external services.

## Assets Folder
### Purpose:
The assets folder contains all the images used within our app.

### Why I Created It:
I created the assets folder to centralize and organize all the image resources needed for our app. By storing images in this folder, we can easily access and reference them throughout our app's codebase.


## Welcome Screen
The Welcome screen serves as the initial interface where users can set their location and get started with weather updates.![Simulator Screen Shot - iPhone 14 Pro - 2024-03-07 at 23 08 22](https://github.com/drinN1/weather_app/assets/90065300/bec0c057-34ae-4d6f-a60b-c313cda877c1)

### Description: 
Text Instruction: A welcome message prompts users to input their city's name to check the latest weather updates.

### Text Field:
 A text field allows users to enter the name of their city.

### Continue Button: 
Upon entering the city name, users can press the "Continue" button to proceed.

### Error Handling: 
If an invalid city name is entered or the field is left empty, appropriate error messages are displayed, preventing users from proceeding until the input is corrected.


![Simulator Screen Shot - iPhone 14 Pro - 2024-03-07 at 23 08 48](https://github.com/drinN1/weather_app/assets/90065300/c2b4bbcb-12f0-46ae-9c12-468c25dcf611)         ![Simulator Screen Shot - iPhone 14 Pro - 2024-03-07 at 23 09 02](https://github.com/drinN1/weather_app/assets/90065300/81730cd2-5733-4627-885b-243625d609b6)


### Functionality:
Navigation to Home Screen: Upon entering a valid city name and pressing "Continue", users are directed to the Home screen.



## Home Screen
The Home screen provides comprehensive weather information based on the user's selected city.

![Simulator Screen Shot - iPhone 14 Pro - 2024-03-07 at 23 09 23](https://github.com/drinN1/weather_app/assets/90065300/03d8f90d-0dc2-48d7-ac83-bb94af6abc83)

### Description:
App Bar: The app bar displays the app name on the left and a search icon on the right. Clicking the search icon reveals a text field where users can input a city name to search for weather updates.

![Screenshot 2024-03-07 at 23 09 53](https://github.com/drinN1/weather_app/assets/90065300/fbb586bf-0957-45c5-997e-7d2a3a5ec798)  ![Screenshot 2024-03-07 at 23 11 42](https://github.com/drinN1/weather_app/assets/90065300/14edd963-80af-4c2e-b245-6f25381dfae7)



### Weather Data Display:
 Weather data such as city name, maximum/minimum temperature, pressure, humidity, and weather conditions (e.g., clouds, rain, snow) are shown.

### Temperature Unit Selection: 
Users can toggle between Celsius and Fahrenheit units using a label located on the screen. The displayed weather data updates dynamically based on the selected unit.

![Screenshot 2024-03-07 at 23 15 31](https://github.com/drinN1/weather_app/assets/90065300/ff0a60dc-b9db-481c-992a-25737161d4e4)

### Weather Icons: 
Icons representing weather conditions (e.g., rain, clouds) change dynamically based on the current weather data.

### Pull-to-Refresh:
Users can refresh the weather data by pulling down on the screen, enabling them to receive the latest updates instantly.
