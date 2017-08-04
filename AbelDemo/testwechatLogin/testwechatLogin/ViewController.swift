import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        // 微信登录请求
//        let req = SendAuthReq()
//        req.scope = "snsapi_userinfo"
//        req.state = "123"
//        WXApi.send(req)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


        let req = SendAuthReq()
        req.scope = "snsapi_userinfo"
        req.state = "123"
        WXApi.sendAuthReq(req, viewController: nil, delegate: nil)

//        if WXApi.isWXAppInstalled() {
//            print("weixin ready")
//            let req = SendAuthReq()
//            req.scope = "snsapi_userinfo"
//            req.state = "123"
//            WXApi.sendAuthReq(req, viewController: nil, delegate: nil)
//
//
//        } else {
//            // 把微信登录的按钮隐藏掉
//
//            // 微信登录请求
//            let req = SendAuthReq()
//            req.scope = "snsapi_userinfo"
//            req.state = "123"
//            WXApi.send(req)
//        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

