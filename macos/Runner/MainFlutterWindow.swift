import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    guard let windowFrame = self.screen?.visibleFrame else { return }
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true, animate: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
