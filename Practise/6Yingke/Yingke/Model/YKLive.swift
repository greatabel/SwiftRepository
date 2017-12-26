//
//	Live.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct YKLive{


	var city : String!
	var creator : YKCreator!

	var id : String!
	var image : String!
	var landscape : Int!
	var like : [AnyObject]!
	var link : Int!
	var liveType : String!
	var multi : Int!
	var name : String!
	var onlineUsers : Int!
	var optimal : Int!
	var pubStat : Int!
	var roomId : Int!
	var rotate : Int!
	var shareAddr : String!
	var slot : Int!
	var status : Int!
	var streamAddr : String!
	var version : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){

		city = dictionary["city"] as? String
		if let creatorData = dictionary["creator"] as? [String:Any]{
				creator = YKCreator(fromDictionary: creatorData)
			}

		id = dictionary["id"] as? String
		image = dictionary["image"] as? String
		landscape = dictionary["landscape"] as? Int
		like = dictionary["like"] as? [AnyObject]
		link = dictionary["link"] as? Int
		liveType = dictionary["live_type"] as? String
		multi = dictionary["multi"] as? Int
		name = dictionary["name"] as? String
		onlineUsers = dictionary["online_users"] as? Int
		optimal = dictionary["optimal"] as? Int
		pubStat = dictionary["pub_stat"] as? Int
		roomId = dictionary["room_id"] as? Int
		rotate = dictionary["rotate"] as? Int
		shareAddr = dictionary["share_addr"] as? String
		slot = dictionary["slot"] as? Int
		status = dictionary["status"] as? Int
		streamAddr = dictionary["stream_addr"] as? String
		version = dictionary["version"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()

		if city != nil{
			dictionary["city"] = city
		}
		if creator != nil{
			dictionary["creator"] = creator.toDictionary()
		}
	
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if landscape != nil{
			dictionary["landscape"] = landscape
		}
		if like != nil{
			dictionary["like"] = like
		}
		if link != nil{
			dictionary["link"] = link
		}
		if liveType != nil{
			dictionary["live_type"] = liveType
		}
		if multi != nil{
			dictionary["multi"] = multi
		}
		if name != nil{
			dictionary["name"] = name
		}
		if onlineUsers != nil{
			dictionary["online_users"] = onlineUsers
		}
		if optimal != nil{
			dictionary["optimal"] = optimal
		}
		if pubStat != nil{
			dictionary["pub_stat"] = pubStat
		}
		if roomId != nil{
			dictionary["room_id"] = roomId
		}
		if rotate != nil{
			dictionary["rotate"] = rotate
		}
		if shareAddr != nil{
			dictionary["share_addr"] = shareAddr
		}
		if slot != nil{
			dictionary["slot"] = slot
		}
		if status != nil{
			dictionary["status"] = status
		}
		if streamAddr != nil{
			dictionary["stream_addr"] = streamAddr
		}
		if version != nil{
			dictionary["version"] = version
		}
		return dictionary
	}

}
