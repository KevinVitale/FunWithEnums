import UIKit

/**
 */
enum AppViewState {
    case tabs(AppContext)
    case modal(AppContext)
    case alert(AppContext, title: String, message: String, actions: [UIAlertAction]?)
    case unknown
}

/**
 */
extension AppViewState {
    ///
    var transition: AppTransition {
        switch self {
        case .tabs(let context):
            return .set([
                InitialController(context: context)
              , AlertController(context: context)
            ])
        case .modal(let context):
            return .present(ModalController(context: context))
        case .alert(_, let title, let message, let actions):
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            for action in actions ?? [] {
                alert.addAction(action)
            }
            return .present(alert)
        case .unknown: return .set([])
        }
    }
}

/**
 */
enum AppTransition {
    case present(UIViewController)
    case set([UIViewController])
}

/**
 */
extension AppViewState: Equatable {
    /**
     */
    static func == (lhs: AppViewState, rhs: AppViewState) -> Bool {
        switch (lhs, rhs) {
        case (.tabs, .tabs): return true
        case (.modal, .modal): return true
        case (.alert, .alert): return true
        case (.unknown, .unknown): return true
        default: return false
        }
    }
}

/**
 */
extension AppViewState: CustomDebugStringConvertible {
    ///
    var debugDescription: String {
        switch self {
        case .alert(let context, _, _, _): return "Alert: --- \(String(describing: context.owner!))"
        case .tabs(let context): return "Tabs --- \(String(describing: context.owner!))"
        case .modal(let context): return "Modal --- \(String(describing: context.owner!))"
        case .unknown: return "<Unknown>"
        }
    }
}
