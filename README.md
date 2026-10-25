# AminSources — Portfolio Website

A responsive personal portfolio website built with **Flutter**. It introduces Amin, highlights selected projects, outlines the development toolkit and principles behind the work, and provides ways to get in touch.

## Features

- **Responsive layout** for mobile, tablet, and desktop screen sizes.
- **Portfolio sections** for the introduction, about/profile, selected projects, and contact information.
- **Project cards** populated from a local JSON asset, including each project's description, technologies, year, image, and source link.
- **BLoC-based state management** for the project list, with loading, success, and failure states.
- **Reusable design system** with app colors, typography, custom fonts, and theme configuration.
- **Contact and social links** for GitHub, Telegram, Instagram, and email.
- **Dependency injection** managed with GetIt.

## Tech stack

- [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/)
- flutter_bloc and bloc for state management
- equatable for value equality
- get_it for dependency injection
- flutter_screenutil for responsive sizing
- url_launcher for external links
- flutter_svg for SVG assets

## Getting started

### Prerequisites

Install the Flutter SDK and ensure the Dart SDK bundled with it satisfies the constraint in pubspec.yaml (Dart ^3.13.4). Confirm your setup with:

    flutter doctor

### Install dependencies

Clone the repository and fetch packages:

    git clone https://github.com/AminSources/portfolio_web_project.git
    cd portfolio_web_project
    flutter pub get

### Run locally

Run the application in Chrome:

    flutter run -d chrome

You can also run it on another supported Flutter target by selecting the corresponding device.

## Tests and static analysis

Run the automated test suite:

    flutter test

Run the Dart/Flutter analyzer:

    flutter analyze

## Build for the web

Create a production web build:

    flutter build web

The generated web files are placed in build/web/. Deploy that directory to a static hosting provider that supports Flutter web output.

## Project structure

The code is organized around a feature-first structure with separated presentation, domain, and data layers.

    lib/
    ├── app.dart
    ├── main.dart
    ├── locator.dart
    ├── core/
    │   ├── constants/       # App URLs and shared lists
    │   ├── extensions/
    │   ├── keys/
    │   ├── resources/       # Shared data-state types
    │   ├── responsive/      # Mobile/tablet breakpoints
    │   ├── theme/           # Colors, typography, fonts, and theme
    │   └── widgets/
    ├── features/
    │   └── portfolio_feature/
    │       ├── data/        # Local data source, model, repository implementation
    │       ├── domain/      # Entities, repository contract, use case
    │       └── presentation/
    │           ├── bloc/    # Project-list events, states, and BLoC
    │           ├── pages/
    │           ├── sections/
    │           └── widgets/
    └── assets/
        ├── fonts/
        ├── images/
        └── portfolio/
            └── portfolio-data.json

    test/                    # Unit and widget tests
    web/                     # Flutter web entry point and icons

## Updating portfolio content

### Add or edit a project

Update lib/assets/portfolio/portfolio-data.json. Each project is represented by an object with these fields:

| Field | Description |
| --- | --- |
| short_name | Short label used by the project card |
| used_technologies | Platform and technologies used |
| year | Project year |
| title | Display title |
| description | Short project summary |
| title_image_path | Path to the project's image asset |
| project_url | External project or repository URL |

Place any new project image in lib/assets/images/ and make sure the path in the JSON matches the asset path.

### Update social and contact links

Edit lib/core/constants/app_urls.dart to change the GitHub, Instagram, Telegram, or email links.

### Update the toolkit and design

- Edit lib/core/constants/app_lists.dart to change the toolkit and principles displayed in the About section.
- Adjust breakpoints in lib/core/responsive/app_breakpoints.dart.
- Update colors, typography, and theme settings under lib/core/theme/.

## Current portfolio projects

- **Hamsafar — Coordinate travel:** a Flutter application for planning and coordinating short trips with friends. [Source code](https://github.com/aminsources/hamsafar)
- **AminSources — Portfolio web:** this responsive portfolio website. [Source code](https://github.com/aminsources/portfolio_web_project)

## Contact

- **GitHub:** [@AminSources](https://github.com/AminSources)
- **Telegram:** [@m_amin_farshbaf](https://t.me/m_amin_farshbaf)
- **Instagram:** [@m_amin_farshbaf](https://instagram.com/m_amin_farshbaf)
- **Email:** [helloamin.com@gmail.com](mailto:helloamin.com@gmail.com)

---

Built with Flutter by [AminSources](https://github.com/AminSources).
