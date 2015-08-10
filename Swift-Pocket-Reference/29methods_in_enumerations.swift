enum NetworkAddress {

case MAC(String)
case IPv4(UInt8, UInt8, UInt8, UInt8)

    func getPrintable() -> String 
        {
            switch self 
            {
            case let .MAC(theAddress): 
                    return theAddress
            case let .IPv4(a, b, c, d): 
                    return ("\(a).\(b).\(c).\(d)")
            }
        }
}


var someAddress = NetworkAddress.IPv4(192, 168, 0, 1) 
println(someAddress.getPrintable())

someAddress = NetworkAddress.MAC("00:DE:AD:BE:EF:00") 
println(someAddress.getPrintable())