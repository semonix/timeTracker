import UIKit

protocol EditPresenterProtocol {
    // Что View вызывает в Presenter
}

class EditViewController: UIViewController {
    
    var presenter: EditPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
    }
}

extension EditViewController: EditViewProtocol {
    // Что Presenter вызывает во View
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: EditViewController())
}
