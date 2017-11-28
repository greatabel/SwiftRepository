import Foundation
import AVFoundation

enum MusicPlayerError: Error {
    case ResourceNotFound
}

class MusicPlayer {
    private var player: AVAudioPlayer? = nil

    init(filename: String, type: String) throws {
        if let resource = Bundle.main.path(forResource: filename, ofType: type) {
            let url = NSURL(fileURLWithPath: resource)
            player = try AVAudioPlayer(contentsOf: url as URL)
            player?.numberOfLoops = -1
            player?.prepareToPlay()
        } else {
            throw MusicPlayerError.ResourceNotFound
        }
    }

    func play() {
        player?.play()
    }
    func stop() {
        player?.stop()
    }
}

