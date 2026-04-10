import Foundation
import SwiftData

@Model
final class WorkoutProgram {
    var name: String
    var icon: String        // SF Symbol name
    var colorHex: String    // accent color
    var createdAt: Date
    
    init(name: String, icon: String = "figure.strengthtraining.traditional", colorHex: String = "#FF6B35") {
        self.name = name
        self.icon = icon
        self.colorHex = colorHex
        self.createdAt = Date()
    }
}
