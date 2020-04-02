
import Foundation

struct Json4Swift_Base : Codable {
	let definitions : [Definitions]?
	let word : String?
	let pronunciation : String?

	enum CodingKeys: String, CodingKey {

		case definitions = "definitions"
		case word = "word"
		case pronunciation = "pronunciation"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		definitions = try values.decodeIfPresent([Definitions].self, forKey: .definitions)
		word = try values.decodeIfPresent(String.self, forKey: .word)
		pronunciation = try values.decodeIfPresent(String.self, forKey: .pronunciation)
	}

}
