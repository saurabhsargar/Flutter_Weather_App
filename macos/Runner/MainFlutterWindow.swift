import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
    private let pluginManager = PluginManager()
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    guard let windowFrame = NSScreen.main?.visibleFrame else { return }
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    PluginManager.registerPlugins(with: flutterViewController)

    super.awakeFromNib()
  }
}
