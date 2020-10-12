
import Foundation
struct Guest_stars : Codable {
	let id : Int?
	let name : String?
	let credit_id : String?
	let character : String?
	let order : Int?
	let gender : Int?
	let profile_path : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case credit_id = "credit_id"
		case character = "character"
		case order = "order"
		case gender = "gender"
		case profile_path = "profile_path"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
		character = try values.decodeIfPresent(String.self, forKey: .character)
		order = try values.decodeIfPresent(Int.self, forKey: .order)
		gender = try values.decodeIfPresent(Int.self, forKey: .gender)
		profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
	}

}
