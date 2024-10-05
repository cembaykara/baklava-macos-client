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
        Task {
            let newFlags = try? await service.getFlags()
            if let newFlags { flags = newFlags }
        }
    }
    
    func deleteFlag(withId id: UUID?) async {
        guard let id = id else { return }
        let isDeleted = try? await service.deleteBy(id: id)
        if let isDeleted {
            if isDeleted {
                flags?.removeAll(where: { $0.id == id })
            }
        }
    }
    
    func createNewFlag(fromFlag flag: Flag) async {
        let flag = try? await service.createNew(object: flag)
        if let flag { flags?.append(flag) }
    }
    
    func onToggle(_ flag: Flag) {
        Task { try await service.update(flag) }
    }
}
