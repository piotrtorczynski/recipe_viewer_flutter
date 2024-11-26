# Recipe Viewer

A Flutter application that allows users to search for recipes and view detailed information, including ingredients, cuisine type, and preparation time.

## 🚀 Features

- **Recipe Search:** Find recipes by entering keywords.
- **Detailed View:** View ingredients, cooking time, and other details for each recipe.
- **Responsive Design:** Optimized for multiple platforms (iOS, Android, Web).
- **State Management:** Built using the **Bloc** library for predictable and scalable state management.
- **Network Requests:** Modular and testable networking layer for API calls.
- **Dependency Injection:** Using `get_it` for managing dependencies across the app.
- **Proxy Support:** Supports tools like Proxyman for API request debugging.

## 🛠️ Technologies Used

- **Flutter:** Framework for building natively compiled applications.
- **Dart:** Programming language for developing Flutter apps.
- **flutter_bloc:** For managing state in a clean and testable way.
- **get_it:** Lightweight dependency injection framework.
- **http:** For making network requests.
- **Proxyman:** Debugging and monitoring network traffic during development.

## 🌐 API Integration

This project integrates with a recipe API to fetch recipe data.  
API documentation: [Edamam Recipe API](https://developer.edamam.com/)

### Example API Request

```http
GET https://api.edamam.com/api/recipes/v2



## 🖥️ Running the App

- Clone this repository:

```bash
git clone https://github.com/piotrtorczynski/recipe_viewer_flutter.git
```

- Navigate to the project directory:

```bash
cd recipe-viewer
```

- Install dependencies:
  
```bash
flutter pub get
```

- Run the app:
  
```bash
flutter run
```
