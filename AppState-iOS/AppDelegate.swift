import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    ///
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    /**
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
