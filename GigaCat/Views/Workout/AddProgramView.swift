import SwiftUI
import SwiftData

struct AddProgramView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var selectedIcon = "figure.strengthtraining.traditional"
    @State private var selectedColor = "#FF6B35"

    private let icons = [
        "figure.strengthtraining.traditional",
        "figure.run",
        "bolt.fill",
        "flame.fill",
        "heart.fill",
        "dumbbell.fill",
        "figure.yoga",
        "figure.boxing",
        "figure.cycling",
        "figure.swimming",
    ]

    private let colors = [
        "#FF6B35", "#6C63FF", "#00C9A7",
        "#FF3B5C", "#FFD60A", "#30B0C7",
    ]

    private var canSave: Bool { !name.trimmingCharacters(in: .whitespaces).isEmpty }

    var body: some View {
        NavigationStack {
            Form {
                // Name section
                Section("Название программы") {
                    TextField("Например: Push Pull Legs", text: $name)
                }

                // Icon picker
                Section("Иконка") {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 12) {
                        ForEach(icons, id: \.self) { icon in
                            Button {
                                selectedIcon = icon
                            } label: {
                                Image(systemName: icon)
                                    .font(.title2)
                                    .frame(width: 44, height: 44)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedIcon == icon
                                                  ? (Color(hex: selectedColor) ?? .orange).opacity(0.2)
                                                  : Color(.secondarySystemBackground))
                                    )
                                    .foregroundStyle(selectedIcon == icon
                                                     ? (Color(hex: selectedColor) ?? .orange)
                                                     : .secondary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical, 8)
                }

                // Color picker
                Section("Цвет") {
                    HStack(spacing: 14) {
                        ForEach(colors, id: \.self) { hex in
                            Button {
                                selectedColor = hex
                            } label: {
                                Circle()
                                    .fill(Color(hex: hex) ?? .orange)
                                    .frame(width: 34, height: 34)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(.white, lineWidth: selectedColor == hex ? 3 : 0)
                                            .padding(2)
                                    )
                                    .shadow(color: (Color(hex: hex) ?? .orange).opacity(0.4),
                                            radius: selectedColor == hex ? 6 : 0)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Новая программа")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Отмена") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Сохранить") {
                        saveProgram()
                    }
                    .fontWeight(.semibold)
                    .disabled(!canSave)
                }
            }
        }
    }

    private func saveProgram() {
        let program = WorkoutProgram(
            name: name.trimmingCharacters(in: .whitespaces),
            icon: selectedIcon,
            colorHex: selectedColor
        )
        modelContext.insert(program)
        dismiss()
    }
}
