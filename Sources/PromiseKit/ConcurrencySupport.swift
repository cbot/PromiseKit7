import Foundation

@available(iOS 13.0, *)
public extension Guarantee {
    func getAsync() async -> T {
        return await withCheckedContinuation { body in
            self.done { result in
                body.resume(returning: result)
            }
        }
    }
}

@available(iOS 13.0, *)
public extension Promise {
    func getAsync() async throws -> T {
        return try await withCheckedThrowingContinuation { body in
            self.done { result in
                body.resume(returning: result)
            }.catch { error in
                body.resume(throwing: error)
            }
        }
    }
}

@available(iOS 13.0, *)
public extension CancellablePromise {
    func getAsync() async throws -> T {
        return try await withTaskCancellationHandler {
            self.cancel()
        } operation: {
            return try await withCheckedThrowingContinuation { body in
                self.done { result in
                    body.resume(returning: result)
                }.catch { error in
                    body.resume(throwing: error)
                }
            }
        }
    }
}
