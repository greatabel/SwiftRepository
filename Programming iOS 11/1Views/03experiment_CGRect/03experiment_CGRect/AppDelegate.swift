import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = self.window ?? UIWindow()
        self.window!.rootViewController = ViewController()

        self.window!.backgroundColor = .white
        self.window!.makeKeyAndVisible()
        return true
    }




}

