import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let flutterEngine = (UIApplication.shared.delegate as? FlutterAppDelegate)?.flutterEngine {
    GeneratedPluginRegistrant.register(with: flutterEngine)
}
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
