
import Foundation
import SwiftData

@Model
final class WorkoutProgram {
    var id: UUID
    var title: String

    @Relationship(deleteRule: .cascade, inverse: \WorkoutDay.program)
    var days: [WorkoutDay]

    init(
        id: UUID = UUID(),
        title: String,
        days: [WorkoutDay] = []
    ) {
        self.id = id
        self.title = title
        self.days = days
    }
}

extension WorkoutProgram {
    static var defaultPrograms: [WorkoutProgram] {
        let beginner = WorkoutProgram(title: "Beginner Program")

        let day1 = WorkoutDay(title: "Первый день", order: 1, program: beginner)
        let day2 = WorkoutDay(title: "Второй день", order: 2, program: beginner)
        let day3 = WorkoutDay(title: "Третий день", order: 3, program: beginner)

        let exercise1 = Exercise(name: "Жим лёжа", imageName: "bench_press", sets: 4, day: day1)
        let exercise2 = Exercise(name: "Отжимания", imageName: "push_ups", sets: 3, day: day1)
        day1.exercises = [exercise1, exercise2]

        let exercise3 = Exercise(name: "Подтягивания", imageName: "pull_ups", sets: 4, day: day2)
        let exercise4 = Exercise(name: "Тяга штанги", imageName: "barbell_row", sets: 3, day: day2)
        day2.exercises = [exercise3, exercise4]

        let exercise5 = Exercise(name: "Приседания", imageName: "squats", sets: 4, day: day3)
        let exercise6 = Exercise(name: "Выпады", imageName: "lunges", sets: 3, day: day3)
        day3.exercises = [exercise5, exercise6]

        beginner.days = [day1, day2, day3]

        return [beginner]

    }
}
