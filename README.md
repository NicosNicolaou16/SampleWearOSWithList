# Sample Wear OS with List
This is a sample project that support Wear OS app for Wear and also it uses Bloc Architecture Pattern with Dio Network Manager and Drift
Database.

NOTE: EXAMPLE ONLY FOR ANDROID

## Similar project with (Kotlin Language)
https://github.com/NicosNicolaou16/SampleWearOSComposeWithList <br />

# This Project contains:
Wear OS support <br />
Bloc Architecture Pattern with Repository and Service <br />
Dio (Network Manager) <br />
Drift Database (SQL) <br />

# References/Tutorials Follow
https://medium.com/flutter-community/flutter-building-wearos-app-fedf0f06d1b4 <br />
https://pub.dev/packages/wear <br />
https://github.com/fluttercommunity/flutter_wear_plugin <br />

# Setup in Manifest
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

Flutter SDK version: 3.13.9 <br />
Dart Version: 3.1.5 <br />

# Feeds/Urls/End Point (parsing some data from response)
## (Links References for Ends Points)
https://github.com/r-spacex/SpaceX-API (GitHub) <br />
https://docs.spacexdata.com/?version=latest (Postman) <br />
