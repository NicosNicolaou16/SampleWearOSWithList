# Sample Wear OS with List

[![Linktree](https://img.shields.io/badge/linktree-1de9b6?style=for-the-badge&logo=linktree&logoColor=white)](https://linktr.ee/nicos_nicolaou)
[![Site](https://img.shields.io/badge/Site-blue?style=for-the-badge&label=Web)](https://nicosnicolaou16.github.io/)
[![X](https://img.shields.io/badge/X-%23000000.svg?style=for-the-badge&logo=X&logoColor=white)](https://twitter.com/nicolaou_nicos)
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/nicos-nicolaou-a16720aa)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@nicosnicolaou)
[![Mastodon](https://img.shields.io/badge/-MASTODON-%232B90D9?style=for-the-badge&logo=mastodon&logoColor=white)](https://androiddev.social/@nicolaou_nicos)
[![Bluesky](https://img.shields.io/badge/Bluesky-0285FF?style=for-the-badge&logo=Bluesky&logoColor=white)](https://bsky.app/profile/nicolaounicos.bsky.social)
[![Dev.to blog](https://img.shields.io/badge/dev.to-0A0A0A?style=for-the-badge&logo=dev.to&logoColor=white)](https://dev.to/nicosnicolaou16)
[![YouTube](https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/@nicosnicolaou16)
[![Google Developer Profile](https://img.shields.io/badge/Developer_Profile-blue?style=for-the-badge&label=Google)](https://g.dev/nicolaou_nicos)

This is a sample Flutter project specifically designed for **Wear OS**. It demonstrates a robust architecture utilizing the **BLoC** pattern, **Dio** for network management, and **Drift** (formerly Moor) for local database persistence and offline support.

> [!IMPORTANT]
> **NOTE: EXAMPLE FOR ANDROID (WEAR OS) ONLY.**

<p align="center">
  <img src="Screenshot_20231119_124612.png" height="200" alt="Wear OS List View">
  <img src="Screenshot_20231119_124658.png" height="200" alt="Wear OS Detail View">
</p>

## 🚀 Technologies Used

*   **[Wear OS Support](https://developer.android.com/training/wearables):** Tailored UI for circular and square smartwatch screens, battery optimization, and wearable-specific features.
*   **[Bloc Pattern](https://bloclibrary.dev/):** Manages state and separates business logic from the UI using streams.
*   **[Dio Network Manager](https://pub.dev/packages/dio):** Handles REST API requests to fetch remote data.
*   **[Drift Database](https://drift.simonbinder.eu/):** A reactive persistence library for Flutter and Dart, built on top of SQLite, providing offline functionality.

> [!IMPORTANT]  
> A detailed setup guide is available on Medium!  
> 👉 **[Standalone Wear OS Application (Setup for Jetpack Compose and Flutter)](https://medium.com/@nicosnicolaou/standalone-wear-os-application-jetpack-compose-and-flutter-5a37f4775ed8)** 👈

> [!IMPORTANT]  
> A similar project for pure Native Android (Kotlin/Compose) is also available!  
> 👉 **[SampleWearOSComposeWithList](https://github.com/NicosNicolaou16/SampleWearOSComposeWithList)** 👈


## 🔧 Setup & Configuration

### 1. Android Manifest

To ensure the app is recognized as a wearable app, add the following to your `AndroidManifest.xml`:

```xml

<manifest>

    <uses-feature android:name="android.hardware.type.watch" />

    <application>
        <!--other code here-->

        <!--Optional - Depend if the Wear OS App need app or note-->
        <meta-data android:name="com.google.android.wearable.standalone" android:value="true" />

        <!--other code here-->
    </application>
</manifest>
```

> [!IMPORTANT]  
> Check my article for the setup :point_right: [Standalone Wear OS Application (Setup for Jetpack Compose and Flutter) - Medium](https://medium.com/@nicosnicolaou/standalone-wear-os-application-jetpack-compose-and-flutter-5a37f4775ed8) :point_left: <br />

> [!IMPORTANT]
> Similar project with (Kotlin Language) :point_right: [SampleWearOSComposeWithList](https://github.com/NicosNicolaou16/SampleWearOSComposeWithList) :point_left: <br />

## 🔧 Versioning

- **Flutter SDK:** **3.41.6**
- **Dart Version:** **3.11.4**

## 📡 Data Source (SpaceX API)
This project parses data from the following endpoints:
- **GitHub:** [SpaceX-API](https://github.com/r-spacex/SpaceX-API)
- **Documentation:** [Postman SpaceX Docs](https://docs.spacexdata.com/?version=latest)

## 📚 References & Tutorials
- **Building Wear OS Apps:** [Flutter Community Medium](https://medium.com/flutter-community/flutter-building-wearos-app-fedf0f06d1b4)
- **Wear Plugin:** [pub.dev/packages/wear](https://pub.dev/packages/wear)
- **Flutter Wear Plugin GitHub:** [fluttercommunity/flutter_wear_plugin](https://github.com/fluttercommunity/flutter_wear_plugin)
- **Wear OS Compose Guide:** [Official Android Documentation](https://developer.android.com/training/wearables/compose)

## ⭐ Stargazers
If you find this project useful, please give it a star!  
[Check out the stargazers here](https://github.com/NicosNicolaou16/samplewearoswithlist/stargazers)

## 🙏 Support & Contributions
Feedback, bug reports, and feature requests are welcome! Feel free to **open an issue** or submit a **pull request**.


## Versioning

Flutter SDK version: 3.41.6 <br />
Dart Version: 3.11.4 <br />

# Feeds/Urls/End Point (parsing some data from response)

## (Links References for Ends Points)

https://github.com/r-spacex/SpaceX-API (GitHub) <br />
https://docs.spacexdata.com/?version=latest (Postman) <br />

# References/Tutorials Follow

https://medium.com/flutter-community/flutter-building-wearos-app-fedf0f06d1b4 <br />
https://pub.dev/packages/wear <br />
https://github.com/fluttercommunity/flutter_wear_plugin <br />
https://developer.android.com/training/wearables/compose <br />
