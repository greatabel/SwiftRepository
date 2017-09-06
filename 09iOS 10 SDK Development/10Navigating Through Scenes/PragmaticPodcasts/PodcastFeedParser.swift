import Foundation

class PodcastFeedParser : NSObject, XMLParserDelegate {

  var currentFeed : PodcastFeed?
  var currentElementText: String?

  var onParserFinished : (() -> Void)?
  
  var episodeParser : PodcastEpisodeParser?
  
  init(contentsOf url: URL) {
    super.init()
    let urlSession = URLSession(configuration: .default)
    let dataTask = urlSession.dataTask(with: url) {dataMb, responseMb, errorMb in
      if let data = dataMb {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
      }
    }
    dataTask.resume()
  }
  
// MARK: - XMLParserDelegate implementation
  
  func parserDidStartDocument(_ parser: XMLParser) {
    currentFeed = PodcastFeed()
  }
  
  func parser(_ parser: XMLParser, didStartElement elementName: String,
              namespaceURI: String?, qualifiedName qName: String?,
              attributes attributeDict: [String : String] = [:]) {
    switch elementName {
    case "title", "link", "description", "itunes:author":
      currentElementText = ""
    case "itunes:image":
      if let urlAttribute = attributeDict["href"] {
        currentFeed?.iTunesImageURL = URL(string: urlAttribute)
      }
    case "item":
      episodeParser = PodcastEpisodeParser(feedParser: self,
                                           xmlParser: parser)
      parser.delegate = episodeParser
    default:
      currentElementText = nil
    }
  }

  func parser(_ parser: XMLParser, foundCharacters string: String) {
    currentElementText?.append(string)
  }
  
  func parser(_ parser: XMLParser, didEndElement elementName: String,
              namespaceURI: String?, qualifiedName qName: String?) {
    switch elementName {
    case "title":
      currentFeed?.title = currentElementText
    case "link":
      if let linkText = currentElementText {
        currentFeed?.link = URL(string: linkText)
      }
    case "description":
      currentFeed?.description = currentElementText
    case "itunes:author":
      currentFeed?.iTunesAuthor = currentElementText
    case "item":
      if var episode = episodeParser?.currentEpisode {
        if episode.iTunesImageURL == nil {
          episode.iTunesImageURL = currentFeed?.iTunesImageURL
        }
        currentFeed?.episodes.append(episode)
      }
      episodeParser = nil
    default:
      break
    }
  }
  
  func parserDidEndDocument(_ parser: XMLParser) {
    onParserFinished?()
  }
  
}
