import Foundation

protocol TwitterAPIRequestDelegate {
    func handleTwitterData (data: NSData!,
                            urlResponse: NSHTTPURLResponse!,
                            error: NSError!,
                            fromRequest: TwitterAPIRequest!) 
}

