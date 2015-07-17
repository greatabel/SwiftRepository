class GithubRepository: GithubDetails{
    
    class var api:String{
        get{
            return "https://api.github.com"
        }
        
    }
    var id:UInt64 = 0
    var name:String = ""
    func detailsURL() -> String {
        return "\(GithubRepository.api)/repositories/\(id)"
    }
}
