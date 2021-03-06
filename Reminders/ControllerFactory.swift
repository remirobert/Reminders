import RemindersCore
import UIKit

class ControllerFactory {
    let repository: RemindersRepository

    init(repository: RemindersRepository = InMemoryRemindersRepository()) {
        self.repository = repository
    }

    func build(from view: View, router: Router) -> UIViewController {
        let rootViewController: UIViewController
        switch view {
        case .addReminder:
            let controller = AddReminderViewController()
            let presenter = AddReminderPresenter(view: controller,
                                                 router: router,
                                                 repository: repository)
            controller.presenter = presenter
            rootViewController = controller
        case .reminders:
            let controller = RemindersViewController()
            let presenter = RemindersPresenter(view: controller,
                                               router: router,
                                               repository: repository)
            controller.presenter = presenter
            rootViewController = controller
        }
        return UINavigationController(rootViewController: rootViewController)
    }
}
