//
//  FeatureFlag.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import Foundation
import BaklavaCore

@Observable final class Flag: FeatureFlag, Codable, Identifiable {
	var id: UUID?
	var name: String
	var enabled: Bool
    var createdAt: Date?
    var updatedAt: Date?
	
	init(id: UUID?, name: String, enabled: Bool, createdAt: Date? = nil, updatedAt: Date? = nil) {
		self.id = id
		self.name = name
		self.enabled = enabled
        self.createdAt = createdAt
        self.updatedAt = updatedAt
	}
	
	enum CodingKeys: String, CodingKey {
		case _id = "id"
		case _name = "name"
		case _enabled = "enabled"
        case _createdAt = "createdAt"
        case _updatedAt = "updatedAt"
	}
}
