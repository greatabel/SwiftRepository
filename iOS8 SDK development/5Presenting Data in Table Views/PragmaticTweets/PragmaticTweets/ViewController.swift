import UIKit

let defaultAvatarURL = NSURL(string:
    "http://tp2.sinaimg.cn/5329434101/50/40068050394/0"
    )

let defaultAvatarURL_I = NSURL(string:
    "http://tp3.sinaimg.cn/1398613362/50/5606554466/1"
)
public class ViewController: UITableViewController {

    var parsedTweets: Array<ParsedTweet> = [
        ParsedTweet(tweetText:"1)iOS 8 SDK Development now in print. " +
            "Swift programming FTW!",
            userName:"@pragprog",
            createdAt:"2014-08-20 16:44:30 EDT",
            userAvatarURL: defaultAvatarURL),
        ParsedTweet(tweetText:"2)iOS 8 SDK Development now in print. " +
            "Swift programming FTW!",
            userName:"@pragprog",
            createdAt:"2014-08-20 16:44:30 EDT",
            userAvatarURL: defaultAvatarURL_I),
        ParsedTweet(tweetText:"3)iOS 8 SDK Development now in print. " +
            "Swift programming FTW!",
            userName:"@pragprog",
            createdAt:"2014-08-20 16:44:30 EDT",
            userAvatarURL: defaultAvatarURL)
    ]

    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 1
    }

    override public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let parsedTweet = parsedTweets[indexPath.row]
        cell.textLabel?.text = parsedTweet.tweetText
        
//        cell.textLabel!.text = "Row haha \(indexPath.row)"
        return cell
    }




}

