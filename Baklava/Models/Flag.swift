//
//  FeatureFlag.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import Foundation
import Core

@Observable final class Flag: FeatureFlag, Codable, Identifiable {
	var id: UUID?
	var name: String
	var enabled: Bool
	
	init(id: UUID?, name: String, enabled: Bool) {
		self.id = id
		self.name = name
		self.enabled = enabled
	}
	
	enum CodingKeys: String, CodingKey {
		case _id = "id"
		case _name = "name"
		case _enabled = "enabled"
	}
}
