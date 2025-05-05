//
//  Debouncer.swift
//  shakespearemon-ios
//
//  Created by Fabrizio Scarano on 02/05/25.
//

final class Debouncer {
    private let duration: ContinuousClock.Duration
    private var task: Task<Void, Error>?
    
    init(duration: ContinuousClock.Duration) {
        self.duration = duration
    }
    
    func debounce(_ block: @Sendable @escaping () async -> Void) {
        self.task?.cancel()
        self.task = Task { [duration] in
            try await Task.sleep(for: duration)
            await block()
        }
    }
    
    func cancel() {
        task?.cancel()
    }
}
