import UIKit
import Social
import Accounts

/*
constraint 怎么添加没有数字到superview的约束
http://stackoverflow.com/questions/18959118/add-spacing-constraint-to-superview-in-xcode-5
*/

let defaultAvatarURL = NSURL(string:
    "https://img1.doubanio.com/icon/u3832050-4.jpg"
    )

let defaultAvatarURL_I = NSURL(string:
    "https://img1.doubanio.com/icon/u91890136-3.jpg"
)
public class RootViewController: UITableViewController, TwitterAPIRequestDelegate {

    var parsedTweets : [ParsedTweet] = []

    override public func viewDidLoad() {
//        self.tableView.rowHeight = 150
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 往下压10像素
        let  inset:UIEdgeInsets  = UIEdgeInsetsMake(20, 0, 0, 0);
        self.tableView.contentInset = inset;
        reloadTweets()
//        refreshControl!.endRefreshing()
        let refresher =  UIRefreshControl()
        refresher.addTarget(self, action: #selector(RootViewController.handleRefresh(_:)),
            forControlEvents: UIControlEvents.ValueChanged)
        refreshControl = refresher
    }

    @IBAction func handleRefresh(sender: AnyObject?) {
//        let newParsedTweet :ParsedTweet =  ParsedTweet(tweetText: "New row",
//            userName: "@refresh",
//            createdAt: NSDate().description,
//            userAvatarURL: defaultAvatarURL_I)
//        parsedTweets.insert(newParsedTweet, atIndex: 0)
        reloadTweets()
        refreshControl!.endRefreshing()

    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    /*
    http://stackoverflow.com/questions/8615862/custom-cell-row-height-setting-in-storyboard-is-not-responding
    */
//    override public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 150
//    }
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return section + 1
        return parsedTweets.count
    }

//    override public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
//        let cell = tableView.dequeueReusableCellWithIdentifier("MyIdentify")!
//        let parsedTweet = parsedTweets[indexPath.row]
//        cell.textLabel?.text = parsedTweet.userName
//        cell.detailTextLabel?.text = parsedTweet.tweetText

        let cell = tableView.dequeueReusableCellWithIdentifier("CustomTweetCell") as! ParsedTweetCell
//        cell.bounds.size.height = 150
        let parsedTweet = parsedTweets[indexPath.row]
        cell.userNameLabel.text = parsedTweet.userName
        cell.tweetTextLabel.text = parsedTweet.tweetText
        cell.createdAtLabel.text = parsedTweet.createdAt


//        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), {
//
//            if let imageData = NSData(contentsOfURL: parsedTweet.userAvatarURL!) {
//                let avatarImage = UIImage(data: imageData)
//                dispatch_async(dispatch_get_main_queue(), {
//                    cell.avatarImageView.image = avatarImage
//                })
//            }
//        })

        cell.avatarImageView.image = nil
        dispatch_async(dispatch_get_global_queue(
            QOS_CLASS_DEFAULT, 0),
                       {
                        if let imageData = NSData (contentsOfURL:
                            parsedTweet.userAvatarURL!) {
                            let avatarImage = UIImage(data: imageData)
                            dispatch_async(dispatch_get_main_queue(),
                                {
                                    if cell.userNameLabel.text == parsedTweet.userName {
                                        cell.avatarImageView.image = avatarImage
                                    } else {
                                        print ("oops, wrong cell, never mind")
                                    }
                            }) 
                        }
        })

//        if parsedTweet.userAvatarURL != nil {
//            if let imageData = NSData(contentsOfURL: parsedTweet.userAvatarURL!) {
//                cell.avatarImageView.image = UIImage(data: imageData)
//            }
//        }
        return cell
    }

    func reloadTweets() {
//        tableView.reloadData()
        print(NSThread.isMainThread() ? "On main thread" : "Not on main thread")
        let twitterParams : Dictionary = ["count":"100"]
        let twitterAPIURL = NSURL(string:
            "https://api.twitter.com/1.1/statuses/home_timeline.json")
        let request = TwitterAPIRequest()
        request.sendTwitterRequest(twitterAPIURL,
                                   params: twitterParams,
                                   delegate: self)
    }

    func handleTwitterData (data: NSData!,
                            urlResponse: NSHTTPURLResponse!,
                            error: NSError!,
                            fromRequest: TwitterAPIRequest!) {
        if let dataValue = data {
            var parseError : NSError? = nil
            let jsonObject : AnyObject?
            do {
                jsonObject = try NSJSONSerialization.JSONObjectWithData(dataValue,
                                                                        options: NSJSONReadingOptions(rawValue: 0))
            } catch var error as NSError {
                parseError = error
                jsonObject = nil
            }
            if parseError != nil {
                return
            }
            if let jsonArray = jsonObject as? [ [String:AnyObject] ] {
                self.parsedTweets.removeAll(keepCapacity: true)
                for tweetDict in jsonArray {
                    let parsedTweet = ParsedTweet()
                    parsedTweet.tweetText = tweetDict["text"]  as? String
                    parsedTweet.createdAt = tweetDict["created_at"]  as? String
                    let userDict = tweetDict["user"] as! NSDictionary
                    parsedTweet.userName = userDict["name"] as? String
                    parsedTweet.userAvatarURL = NSURL (string:
                        userDict ["profile_image_url"] as! String)
                    self.parsedTweets.append(parsedTweet)
                }
                dispatch_async(dispatch_get_main_queue(),
                               { 
                                self.tableView.reloadData()
                })
            }
        } else {
            print ("handleTwitterData received no data")
        }
    }

//    func reloadTweets() {
//        //        tableView.reloadData()
//        print(NSThread.isMainThread() ? "On main thread" : "Not on main thread")
//        let accountStore = ACAccountStore()
//        let twitterAccountType = accountStore.accountTypeWithAccountTypeIdentifier(
//            ACAccountTypeIdentifierSinaWeibo)
//        accountStore.requestAccessToAccountsWithType(twitterAccountType,
//     options: nil,
//     completion: {
//        (granted: Bool, error: NSError!)
//        -> Void in
//        if (!granted) {
//            print ("account access not granted")
//        } else {
//            print("here")
//            let twitterAccounts = accountStore.accountsWithAccountType(twitterAccountType)
//            if twitterAccounts.count == 0 {
//                print ("no twitter accounts configured")
//                return
//            } else {
//                let twitterParams = [
//                    "count" : "20"
//                ]
//                print("here1")
//                let twitterAPIURL = NSURL(string:
//                    "http://api.t.sina.com.cn/statuses/user_timeline.json")
//                let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: twitterAPIURL, parameters: twitterParams)
//                request.account = twitterAccounts.first as! ACAccount
//                request.performRequestWithHandler({
//                    (data: NSData!, urlResponse: NSHTTPURLResponse!, error: NSError!)
//                    -> Void in
//                    self.handleTwitterData(data, urlResponse: urlResponse, error: error)
//                })
//            }
//            
//        }
//        })
//        
//    }

    func handleTwitterData(data: NSData!,
                            urlResponse: NSHTTPURLResponse!,
                            error: NSError!) {
        if let dataValue = data {
            var parseError : NSError? = nil
            let jsonObject : AnyObject?
            do {
                jsonObject = try NSJSONSerialization.JSONObjectWithData(dataValue,
                                                                        options: NSJSONReadingOptions(rawValue: 0))
//                print("###", jsonObject)
            } catch let error as NSError {
                parseError = error
                jsonObject = nil
                print(error,"##")
            }
            print("JSON error: \(parseError)\nJSON response: \(jsonObject)")

            if let jsonArray = jsonObject as? [[String:AnyObject]] {
                print("jsonArray.count=", jsonArray.count)
                self.parsedTweets.removeAll(keepCapacity: true)
                for tweetDict in jsonArray {
                    let parsedTweet = ParsedTweet()
                    parsedTweet.tweetText = tweetDict["text"]  as? String
                    parsedTweet.createdAt = tweetDict["created_at"]  as? String
                    let userDict = tweetDict["user"] as! NSDictionary
                    parsedTweet.userName = userDict["name"] as? String



                    parsedTweet.userAvatarURL = NSURL (string:
                        userDict ["profile_image_url"] as! String)
//                    parsedTweet.userAvatarURL = defaultAvatarURL
                    self.parsedTweets.append(parsedTweet)

                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                    print(NSThread.isMainThread() ? "#On main thread" : "#Not on main thread")
                })

            }

        } else {
            print ("handleTwitterData received no data") 
        }


    }







}

