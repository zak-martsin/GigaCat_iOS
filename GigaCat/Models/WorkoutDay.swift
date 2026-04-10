import Foundation
import SwiftData

@Model
final class WorkoutDay {
    var id: UUID
    var title: String
    var order: Int
    var program: WorkoutProgram?

    @Relationship(deleteRule: .cascade, inverse: \Exercise.day)
    var exercises: [Exercise]

    init(
        id: UUID = UUID(),
        title: String,
        order: Int,
        program: WorkoutProgram? = nil,
        exercises: [Exercise] = []
    ) {
        self.id = id
        self.title = title
        self.order = order
        self.program = program
        self.exercises = exercises
    }
}