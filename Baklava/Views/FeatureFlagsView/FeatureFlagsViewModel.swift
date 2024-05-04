//
//  FeatureFlagsViewModel.swift
//  Baklava
//
//  Created by Baris Cem Baykara on 21.04.2024.
//

import Foundation
import Combine
import Services

@Observable class FeatureFlagsViewModel {
	var flags: [Flag] = []
	
	private var cancellable = Set<AnyCancellable>()
	private let service = Service(Flag.self)
	
	init() { fetchFlags() }
	
	func fetchFlags() {
		service.getFlags()
			.receive(on: DispatchQueue.main)
			.sink { print($0) } receiveValue: { self.flags = $0 }
			.store(in: &cancellable)
	}
	
	func deleteFlag(withId id: UUID?) {
		guard let id = id else { return }
		service.deleteBy(id: id)
			.sink { print($0) } receiveValue: { print($0) }
			.store(in: &cancellable)
		fetchFlags()
	}
	
	func createNewFlag(fromFlag flag: Flag) {
		service.createNew(object: flag)
			.sink { print($0) } receiveValue: { self.flags.append($0) }
			.store(in: &cancellable)
	}
	
	func onToggleFlag() { }
}
