import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    if let screenFrame = NSScreen.main?.visibleFrame { self.setFrame(screenFrame, display: true) }

    PluginManager.registerPlugins(with: flutterViewController)

    super.awakeFromNib()
  }
}
