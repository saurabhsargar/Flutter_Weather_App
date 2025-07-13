import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    if let screenFrame = NSScreen.main?.frame { self.setFrame(screenFrame.insetBy(dx: 50, dy: 50), display: true) }

    do { try RegisterGeneratedPlugins(registry: flutterViewController) } catch { print("Plugin registration failed: (error)") }

    super.awakeFromNib()
  }
}
