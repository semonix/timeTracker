import UIKit

protocol DetailPresenterProtocol {
    //  Что View вызывает в Presenter
    var view: DetailViewProtocol? { get set }
    var interactor: InteractorProtocol! { get set }
    var router: RouterProtocol! { get set }
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
    }
}

extension DetailViewController: DetailViewProtocol {
    //  Что Presenter вызывает в View
}

