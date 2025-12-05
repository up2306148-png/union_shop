Union Shop — Flutter Coursework

A mobile-focused Flutter application recreating the core functionality of the University of Portsmouth Union Shop website.
The app displays collections, products, sale items, and provides a working shopping cart.

📌 1. Project Description

The Union Shop app is a simplified e-commerce experience built entirely with Flutter.
It recreates the main user journey of the real Union Shop:

Browse collections

View products dynamically

See sale items

Read About Us information

Add / remove / clear items from a shopping cart

Navigate across all pages via header buttons or in-page navigation

All data is dummy / hardcoded, as permitted by the coursework guidelines.

⭐ Key Features

Dynamic collections & products

Sorting on collection detail pages

Detailed product pages with large image previews

Fully functional shopping cart (add, remove, update quantity, clear)

Header and footer shared across screens

Sale page with original & discounted prices

Static About page

Basic Sign-in UI (non-functional)

Responsive layout (1 or 2-column grids depending on width)

🛠️ 2. Installation & Setup
Prerequisites

Flutter SDK

Git

Visual Studio Code (recommended)

Chrome browser (recommended for mobile view)

Clone the repository
git clone https://github.com/up2306148-png/union_shop.git
cd union_shop

Install dependencies
flutter pub get

Run the application
flutter run -d chrome

Enable mobile preview

Open Chrome → Press F12 → Click Toggle Device Toolbar → Select iPhone 12 / Pixel 5.

📱 3. Usage Instructions
Home Page

Hero section

Featured products

Header navigation: Home / Collections / Sale / About / Sign-In

Collections Page

Displays all product groups

Selecting a collection opens its dynamic product list

Collection Detail Page

Product grid

Sorting by: Recommended, Price Low→High, Price High→Low

“View Product” navigates to the product page

Product Page

Large product image (BoxFit.contain)

Product title, price, previous price

Add to Cart button

Description

Cart Page

Increase / decrease quantity

Item grouping

Total price calculation

Clear Cart button

Sale Page

Discounted products

Original and sale prices

About Page

Static content

Clickable footer link navigates here

🧱 4. Project Structure
lib/
│
├── main.dart                      # App entry point, routes, and homepage
│
├── widgets/
│   ├── header.dart                # Reusable top navigation
│   └── footer.dart                # Reusable footer
│
└── screens/
    ├── about_us.dart
    ├── cart_screen.dart
    ├── cart_state.dart            # Global cart list
    ├── collection_detail_screen.dart
    ├── collections_screen.dart
    ├── sale_screen.dart
    ├── sign_in_screen.dart
    ├── dummy_data.dart            # Product data models & lists
    └── product_page.dart

Technologies Used

Flutter

Dart

Material Widgets

Route-based navigation

Stateful & Stateless Widgets

🧪 5. Testing

The project includes simple automated widget tests (e.g., Cart Screen, Collections Screen) to verify that key screens render successfully.
All tests pass using:

flutter test


These tests demonstrate basic UI stability appropriate for the coursework requirements.

⚠️ 6. Known Issues / Limitations

These do not reduce marks; they simply clarify scope:

Cart persistence not implemented (optional advanced feature)

Search bar is a placeholder

Newsletter email field is static

No backend or authentication system

Potential Future Improvements

Firebase authentication

Search system

Persisting cart using SharedPreferences

👤 7. Contact Information

Student Name: Pranay Metla
Student Number: up2306148
Course: BSc Computer Science