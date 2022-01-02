import Combine

protocol JSONPlaceholderWebRepository: WebRepository {
    func loadOneMemo() -> AnyPublisher<Memo, Error>
    func loadAllMemos() -> AnyPublisher<[Memo], Error>
}
