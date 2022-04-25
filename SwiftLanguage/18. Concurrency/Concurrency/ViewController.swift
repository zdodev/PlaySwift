import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setImage()
    }
    
    @IBAction func tappedDownloadButton(_ sender: UIButton) {
        setImage()
    }
    
    private func setImage() {
        Task {
            imageView.image = await downloadImage()
        }
    }
    
    private func downloadImage() async -> UIImage {
        let url = URL(string: "https://random.imagecdn.app/200/200")!
        let (data, _) = try! await URLSession.shared.data(from: url, delegate: nil)
        let image = UIImage(data: data)!
        
        return image
    }
}
