import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let pluginRegistrant = try? GeneratedPluginRegistrant.register(with: self) { pluginRegistrant } else { print("Plugin registration failed") }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
