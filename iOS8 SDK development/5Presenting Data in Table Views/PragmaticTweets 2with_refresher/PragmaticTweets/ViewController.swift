import UIKit
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
public class ViewController: UITableViewController {

    var parsedTweets: Array<ParsedTweet> = [
        ParsedTweet(tweetText:"1)iOS 8 SDK Development now in print. " +
            "Swift programming FTW!",
            userName:"@pragprog",
            createdAt:"2014-08-20 16:44:30 EDT",
            userAvatarURL: defaultAvatarURL),
        ParsedTweet(tweetText:"2)Python Programming " +
            "Python programming FTW!",
            userName:"@abel",
            createdAt:"2014-08-20 16:44:30 EDT",
            userAvatarURL: defaultAvatarURL_I),
        ParsedTweet(tweetText:"3)Elixir in action " +
            "Elixir programming FTW!",
            userName:"@stone",
            createdAt:"2014-08-20 16:44:30 EDT",
            userAvatarURL: defaultAvatarURL)
    ]

    override public func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 往下压10像素
        let  inset:UIEdgeInsets  = UIEdgeInsetsMake(20, 0, 0, 0);
        self.tableView.contentInset = inset;
        reloadTweets()

        let refresher =  UIRefreshControl()
        refresher.addTarget(self, action: "handleRefresh:",
            forControlEvents: UIControlEvents.ValueChanged)
        refreshControl = refresher
    }

    @IBAction func handleRefresh(sender: AnyObject?) {
        let newParsedTweet :ParsedTweet =  ParsedTweet(tweetText: "New row",
            userName: "@refresh",
            createdAt: NSDate().description,
            userAvatarURL: defaultAvatarURL_I)
        parsedTweets.insert(newParsedTweet, atIndex: 0)
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
    override public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
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
        if parsedTweet.userAvatarURL != nil {
            if let imageData = NSData(contentsOfURL: parsedTweet.userAvatarURL!) {
                cell.avatarImageView.image = UIImage(data: imageData)
            }
        }
        return cell
    }

    func reloadTweets() {
        tableView.reloadData()
    }



}

