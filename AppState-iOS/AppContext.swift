import Foundation

/**
 */
final class Context<Owner: NSObject>: NSObject {
    ///
    private(set) weak var owner: Owner!

    ///
    var date = Date()

    /**
     */
    required init(owner: Owner) {
        self.owner = owner
    }
}

///
typealias AppContext = Context<RootViewController>
