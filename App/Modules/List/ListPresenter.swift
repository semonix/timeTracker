import Foundation

protocol ListViewProtocol: AnyObject {
    var presenter: ListPresenterProtocol! { get set }
    //  Что Presenter может вызвать во View
    func updateValues()
}
protocol ListInteractorProtocol {
    var interactorOutput: ListInteractorOutput? { get set }
    //  Что Presenter может вызвать в Interactor
}
protocol ListRouterProtocol {
    // TODO: Проверить необходимость:
//    var view: ListViewController? { get set }
    
    //  Что Presenter может вызвать для навигации
}

class ListPresenter {
    weak var view: ListViewProtocol?
    var interactor: ListInteractorProtocol!
    var router: ListRouterProtocol!
    
    init(view: ListViewProtocol?, interactor: ListInteractorProtocol,router: ListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: ListPresenterProtocol {
    //  Что View вызывает в Presenter
}
extension ListPresenter: ListInteractorOutput {
    //  Что Interactor вызывает в Presenter
}
