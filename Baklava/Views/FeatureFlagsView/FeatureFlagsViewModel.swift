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
	var flags: [Flag] = []
	
	private var cancellable = [String: AnyCancellable?]()
	private let service = Service(Flag.self)
	
	init() { fetchFlags() }
	
	func fetchFlags() {
		cancellable["fetch"] = service.getFlags()
			.receive(on: DispatchQueue.main)
			.sink { print($0) } receiveValue: { [weak self] flags in
				self?.flags = flags
			}
	}
	
	func deleteFlag(withId id: UUID?) {
		guard let id = id else { return }
		cancellable["delete"] = service.deleteBy(id: id)
			.sink { print($0) } receiveValue: { print($0) }
		fetchFlags()
	}
	
	func createNewFlag(fromFlag flag: Flag) {
		cancellable["create"] = service.createNew(object: flag)
			.sink { print($0) } receiveValue: { [weak self] flag in
				self?.flags.append(flag)
			}
	}
	
	func onToggle(_ flag: Flag) {
		cancellable["update"] = service.update(flag)
			.sink { print($0) } receiveValue: { print($0) }
		
		print(cancellable.count)
	}
	
	deinit { cancellable.removeAll() }
}
