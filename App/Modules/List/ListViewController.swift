import UIKit

protocol ListPresenterProtocol {
    //  Что View вызывает в Presenter
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorProtocol! { get set }
    var router: ListRouterProtocol! { get set }
}

class ListViewController: UIViewController {
    var presenter: ListPresenterProtocol!
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

extension ListViewController: ListViewProtocol {
    //  Что Presenter вызывает в View
    func updateValues() {
        // ...
    }
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: ListViewController())
}
