//
//	Creator.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct YKCreator{

	var birth : String!
	var descriptionField : String!
	var emotion : String!
	var gender : Int!
	var gmutex : Int!
	var hometown : String!
	var id : Int!
	var inkeVerify : Int!
	var level : Int!
	var location : String!
	var nick : String!
	var portrait : String!
	var profession : String!
	var rankVeri : Int!
	var sex : Int!
	var thirdPlatform : String!
	var veriInfo : String!
	var verified : Int!
	var verifiedReason : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		birth = dictionary["birth"] as? String
		descriptionField = dictionary["description"] as? String
		emotion = dictionary["emotion"] as? String
		gender = dictionary["gender"] as? Int
		gmutex = dictionary["gmutex"] as? Int
		hometown = dictionary["hometown"] as? String
		id = dictionary["id"] as? Int
		inkeVerify = dictionary["inke_verify"] as? Int
		level = dictionary["level"] as? Int
		location = dictionary["location"] as? String
		nick = dictionary["nick"] as? String
		portrait = dictionary["portrait"] as? String
		profession = dictionary["profession"] as? String
		rankVeri = dictionary["rank_veri"] as? Int
		sex = dictionary["sex"] as? Int
		thirdPlatform = dictionary["third_platform"] as? String
		veriInfo = dictionary["veri_info"] as? String
		verified = dictionary["verified"] as? Int
		verifiedReason = dictionary["verified_reason"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if birth != nil{
			dictionary["birth"] = birth
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if emotion != nil{
			dictionary["emotion"] = emotion
		}
		if gender != nil{
			dictionary["gender"] = gender
		}
		if gmutex != nil{
			dictionary["gmutex"] = gmutex
		}
		if hometown != nil{
			dictionary["hometown"] = hometown
		}
		if id != nil{
			dictionary["id"] = id
		}
		if inkeVerify != nil{
			dictionary["inke_verify"] = inkeVerify
		}
		if level != nil{
			dictionary["level"] = level
		}
		if location != nil{
			dictionary["location"] = location
		}
		if nick != nil{
			dictionary["nick"] = nick
		}
		if portrait != nil{
			dictionary["portrait"] = portrait
		}
		if profession != nil{
			dictionary["profession"] = profession
		}
		if rankVeri != nil{
			dictionary["rank_veri"] = rankVeri
		}
		if sex != nil{
			dictionary["sex"] = sex
		}
		if thirdPlatform != nil{
			dictionary["third_platform"] = thirdPlatform
		}
		if veriInfo != nil{
			dictionary["veri_info"] = veriInfo
		}
		if verified != nil{
			dictionary["verified"] = verified
		}
		if verifiedReason != nil{
			dictionary["verified_reason"] = verifiedReason
		}
		return dictionary
	}

}
