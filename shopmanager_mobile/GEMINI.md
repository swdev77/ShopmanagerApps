# Gemini Code Assistant Context

## Project Overview

This is a Flutter-based mobile application for a "ShopManager". The project is in its early stages of development and currently includes a basic setup for user authentication using Firebase. The app structure follows a feature-based approach, with the authentication feature already laid out.

## Building and Running

### Prerequisites

- Flutter SDK
- An editor with the Flutter plugin (e.g., VS Code, Android Studio)
- A configured emulator or a physical device

### Running the App

1.  **Install dependencies:**
    ```shell
    flutter pub get
    ```
2.  **Run the app:**
    ```shell
    flutter run
    ```

### Running Tests

To run the existing tests, use the following command:

```shell
flutter test
```

## Development Conventions

### Project Structure

The project is organized by features. Each feature folder contains `data`, `domain`, and `presentation` layers.

-   **`data`**: Contains data sources and repositories.
-   **`domain`**: Contains business logic, use cases, and entities.
-   **`presentation`**: Contains UI-related components, such as widgets and Blocs.

### State Management

The project uses `flutter_bloc` for state management.

### Testing

-   Unit and widget tests are located in the `test` directory.
-   Acceptance tests are used to test feature-level functionality.
-   `mocktail` is used for creating mocks in tests.

## Next Steps

1.  **Implement Authentication:** The `AuthRepositoryImpl` needs to be implemented with actual Firebase authentication logic for sign-up, sign-in, and other authentication-related features.
2.  **Build UI:** Create the UI for the authentication feature, including sign-up and sign-in screens.
3.  **Develop Features:** Start building out the core features of the ShopManager application.
