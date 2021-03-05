import StripeTerminal

/// Implementation of the ConnectionTokenProvider protocol that
/// uses the networking adapter provided by clients of Hardware
/// to fetch a connection token
final class DefaultConnectionTokenProvider: ConnectionTokenProvider {
    private let provider: CardReaderConfigProvider

    init(provider: CardReaderConfigProvider) {
        self.provider = provider
    }

    public func fetchConnectionToken(_ completion: @escaping ConnectionTokenCompletionBlock) {
        provider.fetchToken(completion: completion)
    }
}
