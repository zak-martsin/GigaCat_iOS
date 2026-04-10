import SwiftUI
import SwiftData

struct WorkoutView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \WorkoutProgram.createdAt, order: .reverse)
    private var programs: [WorkoutProgram]

    @State private var showingAddProgram = false

    // Sample programs shown when the user has none yet
//    private let samplePrograms: [WorkoutProgram] = [
//        WorkoutProgram(name: "Push / Pull / Legs", icon: "figure.strengthtraining.traditional", colorHex: "#FF6B35"),
//        WorkoutProgram(name: "Full Body", icon: "bolt.fill", colorHex: "#6C63FF"),
//        WorkoutProgram(name: "Кардио", icon: "figure.run", colorHex: "#00C9A7"),
//    ]

//    var displayedPrograms: [WorkoutProgram] {
//        programs.isEmpty ? samplePrograms : programs
//    }

    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [Color(.systemBackground), Color(.secondarySystemBackground)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header greeting
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Привет 💪")
                                .font(.largeTitle.bold())
                            Text("Выбери программу тренировки")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)

                        // Programs grid
//                        LazyVGrid(
//                            columns: [GridItem(.flexible()), GridItem(.flexible())],
//                            spacing: 16
//                        ) {
//                            ForEach(displayedPrograms) { program in
//                                ProgramCardView(program: program)
//                            }
//                        }
//                        .padding(.horizontal)
                    }
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("GigaCat")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddProgram = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.orange)
                    }
                }
            }
//            .sheet(isPresented: $showingAddProgram) {
//                AddProgramView()
//            }
        }
    }
}
