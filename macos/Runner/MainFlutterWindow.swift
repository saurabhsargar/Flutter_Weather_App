import Cocoa
import FlutterMacOS

/**
 * MainFlutterWindow is responsible for initializing the Flutter view controller
 * and setting up the application window.
 *
 * - Ensures proper plugin registration and window frame validation.
 */
class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    guard let flutterViewController = FlutterViewController() else {
    logError("Failed to initialize FlutterViewController")
    return
}
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    do {
    try RegisterGeneratedPlugins(registry: flutterViewController)
} catch {
    logError("Plugin registration failed: (error.localizedDescription)")
}

    super.awakeFromNib()
  }
}
