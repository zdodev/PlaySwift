import Foundation

final class Main {
    private let postRepository: PostRepositoryProtocol = PostRepository()
    
    func main() {
        Task {
            do {
                let result = try await postRepository.fetchPost(id: 1)
                print(result)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

let main = Main()
main.main()

RunLoop.main.run()
