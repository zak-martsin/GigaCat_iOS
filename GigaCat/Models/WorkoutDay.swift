//
//  WorkoutDay.swift
//  GigaCat
//
//  Created by Захар Марцинкевич on 10/04/2026.
//


import Foundation
import SwiftData

@Model
final class WorkoutDay {
    var id: UUID
    var title: String

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
        self.program = program
        self.exercises = exercises
    }
}
