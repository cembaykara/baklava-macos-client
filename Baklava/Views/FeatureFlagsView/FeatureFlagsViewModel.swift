//
//  FeatureFlagsViewModel.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import Foundation
import Combine
import BaklavaServices

@Observable class FeatureFlagsViewModel {
	var flags: [Flag]? = []
	
    let service = Service(Flag.self)
	
	init() { fetchFlags() }
	
	func fetchFlags() {
        Task { flags = try? await service.getFlags() }
	}
	
    func deleteFlag(withId id: UUID?) {
        Task {
            guard let id = id else { return }
            let _ = try? await service.deleteBy(id: id)
            fetchFlags()
        }
    }
	
	func createNewFlag(fromFlag flag: Flag) {
        
        Task { try await service.createNew(object: flag) }
	}
	
	func onToggle(_ flag: Flag) {
        Task { try await service.update(flag) }
	}
}
