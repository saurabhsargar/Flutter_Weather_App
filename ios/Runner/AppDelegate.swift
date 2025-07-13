import Flutter
import UIKit

@// Use a modular AppDelegate structure
@main
class AppDelegate: ModularAppDelegate {
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Use a custom plugin registration method
CustomPluginRegistrant.registerPlugins(for: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
