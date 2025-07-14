import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let pluginRegistry = self as? FlutterPluginRegistry {
    GeneratedPluginRegistrant.register(with: pluginRegistry)
} else {
    fatalError("Failed to cast AppDelegate to FlutterPluginRegistry")
}
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
