import UIKit

class EpisodeCell: UITableViewCell {

  @IBOutlet var artworkImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var durationLabel: UILabel!

  var loadingImageURL : URL?
}
