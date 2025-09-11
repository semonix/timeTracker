//import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol! { get set }
    //  Что Presenter может вызвать во View
    func updateValues()
}
protocol DetailInteractorProtocol {
    var interactorOutput: DetailInteractorOutput? { get set }
    //  Что Presenter может вызвать в Interactor
}
protocol DetailRouterProtocol {
    // TODO: Проверить необходимость:
//    var view: DetailViewController? { get set }
    
    //  Что Presenter может вызвать для навигации
}

class DetailPresenter {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorProtocol!
    var router: DetailRouterProtocol!
    
    init(view: DetailViewProtocol?, interactor: DetailInteractorProtocol,router: DetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    //  Что View вызывает в Presenter
}
extension DetailPresenter: DetailInteractorOutput {
    //  Что Interactor вызывает в Presenter
}
