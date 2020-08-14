import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    var keys: NSDictionary?
    if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
        keys = NSDictionary(contentsOfFile: path)
    }
    let googleMapsApiKey = keys?["googleMapsApiKey"] as? String ?? ""
    GMSServices.provideAPIKey(googleMapsApiKey)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
