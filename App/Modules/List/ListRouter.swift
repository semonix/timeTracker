import Foundation

class ListRouter {
    weak var view: ListViewController?
}
extension ListRouter: ListRouterProtocol {
    //  Что Presenter вызывает в Router
}
