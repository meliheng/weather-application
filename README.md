# Weather Application

## Project Description
This weather application provides users with real-time weather information, forecasts, and alerts based on their location.

## Installation Instructions
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd weatherapplication
   ```
3. Install the necessary packages:
   ```bash
   flutter pub get
   ```
4. Create `.env` file at the project root:

    Add your own movie API key like:

    ```
    RAPID_API_KEY = 'your_api_key'
    RAPID_API_HOST = weather-api167.p.rapidapi.com
    ```
5. Run the application:
   ```bash
   flutter run
   ```

## Packages Used

### Dependencies


1. **intl**: 
   - A package for internationalization and localization. It helps format dates, numbers, and currencies based on locale.

2. **lottie**: 
   - A package for rendering animations in your Flutter app. It allows you to use Adobe After Effects animations exported as JSON.

3. **font_awesome_flutter**: 
   - Provides Font Awesome icons as Flutter widgets, allowing you to easily use a wide range of icons in your app.

4. **auto_route**: 
   - A powerful routing package for Flutter that simplifies navigation and route management in your application.

5. **http**: 
   - A package for making HTTP requests. It allows you to fetch data from the internet, such as weather information.

6. **flutter_dotenv**: 
   - Loads environment variables from a `.env` file into your Flutter app, which is useful for managing API keys and configuration settings.

7. **flutter_bloc**: 
   - A state management library that implements the BLoC (Business Logic Component) pattern, helping you separate business logic from UI code.

8. **equatable**: 
   - A package that helps to create value-based equality for Dart classes, making it easier to compare objects.

9. **get_it**: 
    - A simple service locator for Dart and Flutter projects, allowing you to manage dependencies easily.

10. **objectbox**: 
    - A high-performance NoSQL database for Flutter, enabling you to store and query data efficiently.

11. **objectbox_flutter_libs**: 
    - Provides additional libraries for using ObjectBox with Flutter.

12. **path**: 
    - A package for manipulating file paths in a platform-agnostic way.

13. **path_provider**: 
    - A Flutter plugin that provides access to commonly used locations on the filesystem, such as the temporary and application directories.

14. **workmanager**: 
    - A package that allows you to run background tasks in your Flutter application.

15. **geolocator**: 
   - A package that provides access to the device's location. It allows you to request the current location of the device and receive location updates.

16. **provider**: 
   - A state management library that helps you manage the state of your application by providing a simple way to notify widgets of changes to the state.

17. **rxdart**: 
   - provides reactive programming tools, specifically for working with Streams in an enhanced and more feature-rich way. It is built on top of Dart's native Stream API and incorporates concepts from the Reactive Extensions (Rx) library.


### Dev Dependencies

1. **flutter_test**: 
   - The Flutter testing framework, which provides tools for writing and running tests for your Flutter applications.

2. **flutter_lints**: 
   - A package that provides a set of lint rules for Flutter projects to improve code quality and consistency.

3. **auto_route_generator**: 
   - A code generator that works with the `auto_route` package to generate route-related code automatically.

4. **build_runner**: 
   - A package that helps with code generation in Dart projects.

5. **objectbox_generator**: 
   - A code generator for ObjectBox that helps create data models and queries.

---

## Architecture

The project follows the principles of **Clean Architecture**, which divides the codebase into distinct layers, each with a specific responsibility:

1. **Domain Layer**:
    - Contains the core business logic of the application.
    - Includes `Entities`, `Use Cases`, and interfaces for repositories.

2. **Data Layer**:
    - Responsible for data handling, such as API calls or local storage.
    - Implements the repository interfaces defined in the domain layer.
    - Includes `Models` and `Data Sources`.

3. **Presentation Layer**:
    - Manages the UI and user interaction.
    - Uses `Bloc` for state management and contains widgets and screens.

4. **Core Layer**:
    - Provides shared functionality and utility classes used across multiple layers.
    - Includes constants, extensions and common configurations to reduce code duplication and ensure consistency throughout the app.

By adhering to Clean Architecture, the app achieves better modularity, testability, and scalability.

## Screenshots

<img src="https://github.com/meliheng/movie-case-study/blob/main/assets/screen_shots/1.png" alt="Screenshot 1" width="200"/> <img src="https://github.com/meliheng/movie-case-study/blob/main/assets/screen_shots/2.png" alt="Screenshot 2" width="200"/> <img src="https://github.com/meliheng/movie-case-study/blob/main/assets/screen_shots/3.png" alt="Screenshot 3" width="200"/>

---