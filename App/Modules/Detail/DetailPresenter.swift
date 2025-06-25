//import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol! { get set }
    //  Что Presenter может вызвать во View
}
protocol InteractorProtocol {
    var interactorOutput: InteractorOutput? { get set }
    //  Что Presenter может вызвать в Interactor
}
protocol RouterProtocol {
    // TODO: Проверить необходимость:
//    var view: DetailViewController? { get set }
    
    //  Что Presenter может вызвать для навигации
}

class DetailPresenter {
    weak var view: DetailViewProtocol?
    var interactor: InteractorProtocol!
    var router: RouterProtocol!
    
    init(view: DetailViewProtocol?, interactor: InteractorProtocol,router: RouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    //  Что View вызывает в Presenter
}
extension DetailPresenter: InteractorOutput {
    //  Что Interactor вызывает в Presenter
}
