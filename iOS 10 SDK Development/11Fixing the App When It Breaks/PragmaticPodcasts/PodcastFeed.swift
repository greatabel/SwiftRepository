import Foundation

struct PodcastFeed {
  
  var title : String?
  var link : URL?
  var description : String?
  var iTunesAuthor : String?
  var iTunesImageURL : URL?

  var episodes : [PodcastEpisode] = []
  
}
