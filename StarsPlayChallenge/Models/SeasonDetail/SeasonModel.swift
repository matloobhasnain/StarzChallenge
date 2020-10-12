
import Foundation
struct SeasonModel : Codable {
	let _id : String?
	let air_date : String?
	let episodes : [Episodes]?
	let name : String?
	let overview : String?
	let id : Int?
	let poster_path : String?
	let season_number : Int?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case air_date = "air_date"
		case episodes = "episodes"
		case name = "name"
		case overview = "overview"
		case id = "id"
		case poster_path = "poster_path"
		case season_number = "season_number"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
		episodes = try values.decodeIfPresent([Episodes].self, forKey: .episodes)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
		season_number = try values.decodeIfPresent(Int.self, forKey: .season_number)
	}

}
