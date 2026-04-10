//
//  Exercise.swift
//  GigaCat
//
//  Created by Захар Марцинкевич on 10/04/2026.
//


import Foundation
import SwiftData

@Model
final class Exercise {
    var id: UUID
    var name: String
    var imageName: String
    var sets: Int
    var day: WorkoutDay?

    init(
        id: UUID = UUID(),
        name: String,
        imageName: String,
        sets: Int,
        day: WorkoutDay? = nil
    ) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.sets = sets
        self.day = day
    }
}