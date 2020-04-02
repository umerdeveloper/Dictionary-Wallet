
import Foundation
struct Definitions : Codable {
    
	let emoji : String?
	let type : String?
	let example : String?
	let definition : String?
	let image_url : String?

	enum CodingKeys: String, CodingKey {

		case emoji = "emoji"
		case type = "type"
		case example = "example"
		case definition = "definition"
		case image_url = "image_url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		emoji = try values.decodeIfPresent(String.self, forKey: .emoji)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		example = try values.decodeIfPresent(String.self, forKey: .example)
		definition = try values.decodeIfPresent(String.self, forKey: .definition)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
	}

}
