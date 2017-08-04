
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WXApiDelegate {

    var window: UIWindow?

    // http://lecason.com/2016/01/09/iOS-Wechat-Login-Pure-Demo/
    // https://github.com/976500133/WeChatLoginAndShares
    // http://www.jianshu.com/p/3c9e25e493c6
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        WXApi.registerApp("wxca1bf553772a24cc")

        return true
    }

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return WXApi.handleOpen(url as URL!, delegate: self)
    }

    func onReq(req: BaseReq!) {
        //onReq是微信终端向第三方程序发起请求，要求第三方程序响应。第三方程序响应完后必须调用sendRsp返回。在调用sendRsp返回时，会切回到微信终端程序界面。
        print(req.type)
    }

    func onResp(resp: BaseResp!) {
        //如果第三方程序向微信发送了sendReq的请求，那么onResp会被回调。sendReq请求调用后，会切到微信终端程序界面。
//        if resp.isKindOfClass(SendAuthResp) {
            let response = resp as! SendAuthResp
            print("ErrCode : \(response.errCode)")
            print("EodeStr : \(response.errStr)")
            print("Code : \(response.code)")
            print("State : \(response.state)")
            print("Lang : \(response.lang)")
            print("Country : \(response.country)")
//        }
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

