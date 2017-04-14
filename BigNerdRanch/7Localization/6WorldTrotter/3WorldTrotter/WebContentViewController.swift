import UIKit
import WebKit

class WebContentViewController: UIViewController , WKNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        //创建
        let wkWebView = WKWebView()

        //设置位置和大小
        wkWebView.frame = self.view.frame;

        //创建的时候就设置位置和大小
        /*
         public init(frame: CGRect, configuration: WKWebViewConfiguration)
         */
//        wkWebView = WKWebView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))

        //添加
        self.view.addSubview(wkWebView)

        //请求
        /*
         open func load(_ request: URLRequest) -> WKNavigation?
         */
        
        wkWebView.load(NSURLRequest(url: NSURL(string:"https://www.baidu.com")! as URL) as URLRequest)
    }

}
