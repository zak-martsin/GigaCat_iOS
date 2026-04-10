import Foundation
import SwiftData

@Model
final class WorkoutProgram {
    var name: String
    var icon: String
    var createdAt: Date
    
    init(name: String, icon: String, createdAt: Date) {
        self.name = name
        self.icon = icon
        self.createdAt = createdAt
    }
}
