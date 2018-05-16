import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Get reference to our main storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        // Grab the main view controller, you'll see the name "Main" below.. Change this as needed
        let mainViewController:UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "Main")

            // Get reference to the LeftMenu view
        let leftViewController:UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "LeftMenu")
        let rightViewController:UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "RightMenu")

        // Override point for customization after application launch.
        let slideMenuController = SlideMenuController(mainViewController: mainViewController,
                                                      leftMenuViewController: leftViewController,
                                                      rightMenuViewController: rightViewController)

        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

