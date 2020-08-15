# Flutter Google Maps Api Demo

A Flutter project to demonstrate the basic usage of Google Maps.  

It uses the following packages:
1. Google Maps for Flutter [google_maps_flutter](https://pub.dev/packages/google_maps_flutter).
2. Flutter Geolocator Plugin [geolocator](https://pub.dev/packages/geolocator).  

![Preview](https://github.com/sueraychang/google_maps_demo_flutter/blob/master/screenshot.png)

## Getting Started

### Get the API key 
To use Google Maps we need the API keys, so please follow both the [Maps SDK for Android's Get API key](https://developers.google.com/maps/documentation/android-sdk/get-api-key), and [Maps SDK for iOS' Get API key](https://developers.google.com/maps/documentation/ios-sdk/get-api-key) processes to get the keys.  

### Add the keys for Android & iOS
Because API keys sholdn't appear in the git repo, we should use .gitignore to hide it.

* Android  
Add the API key into `local.properties`. 
```txt
...
google.map.key = YOUR-KEY-HERE
...
```

* iOS  
Create a `keys.plist` file and add googleMapsApiKey into it. Place the file into <project folder>/ios/Runner/.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>googleMapsApiKey</key>
	<string>YOUR-KEY-HERE</string>
</dict>
</plist>
```
Add rules in .gitignore to ignore both two files.
