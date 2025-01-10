# Sample Wear OS with List

This is a sample project that supports a Wear OS app and utilizes the BLoC architecture pattern, Dio
for network management, and Drift for database handling.

> [!IMPORTANT]
> NOTE: EXAMPLE FOR ANDROID ONLY. <br />

<a title="simulator_image"><img src="Screenshot_20231119_124612.png" height="200" width="200"></a>
<a title="simulator_image"><img src="Screenshot_20231119_124658.png" height="200" width="200"></a>

# This Project contains:

[Wear OS](https://developer.android.com/training/wearables) support refers to adapting an app for
use on smartwatches, ensuring it works well with small
screens, conserves battery life, and utilizes features such as notifications and fitness tracking
specific to wearable devices. <br />
[Bloc Patterns](https://pub.dev/packages/flutter_bloc) along with repositories
and services, separates business logic, data access, and UI by using streams to handle state and
manage data flow. ([Bloc Pattern Documentation](https://bloclibrary.dev/getting-started/)) <br />
[Dio Network Manager](https://pub.dev/packages/dio) is responsible for making requests and
retrieving data from the remote server. <br />
[Drift Database](https://drift.simonbinder.eu/docs/getting-started/) is responsible for saving the
retrieved data from the remote server, querying data from the local database, and supporting offline
functionality. ([Drift Database Documentation](https://pub.dev/packages/drift)) <br />

# Setup

## Setup in Manifest

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

## Versioning

Flutter SDK version: 3.24.4 <br />
Dart Version: 3.5.4 <br />

# Feeds/Urls/End Point (parsing some data from response)

## (Links References for Ends Points)

https://github.com/r-spacex/SpaceX-API (GitHub) <br />
https://docs.spacexdata.com/?version=latest (Postman) <br />

# References/Tutorials Follow

https://medium.com/flutter-community/flutter-building-wearos-app-fedf0f06d1b4 <br />
https://pub.dev/packages/wear <br />
https://github.com/fluttercommunity/flutter_wear_plugin <br />
https://developer.android.com/training/wearables/compose <br />
