
import Foundation
struct Last_episode_to_air : Codable {
	let air_date : String?
	let episode_number : Int?
	let id : Int?
	let name : String?
	let overview : String?
	let production_code : String?
	let season_number : Int?
	let show_id : Int?
	let still_path : String?
	let vote_average : Double?
	let vote_count : Int?

	enum CodingKeys: String, CodingKey {

		case air_date = "air_date"
		case episode_number = "episode_number"
		case id = "id"
		case name = "name"
		case overview = "overview"
		case production_code = "production_code"
		case season_number = "season_number"
		case show_id = "show_id"
		case still_path = "still_path"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
		episode_number = try values.decodeIfPresent(Int.self, forKey: .episode_number)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		production_code = try values.decodeIfPresent(String.self, forKey: .production_code)
		season_number = try values.decodeIfPresent(Int.self, forKey: .season_number)
		show_id = try values.decodeIfPresent(Int.self, forKey: .show_id)
		still_path = try values.decodeIfPresent(String.self, forKey: .still_path)
		vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
		vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
	}

}
