import SwiftUI

struct ProgramCardView: View {
    let program: WorkoutProgram

    // Convert stored hex string to Color
    private var accentColor: Color {
        Color(hex: program.colorHex) ?? .orange
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Icon circle
            ZStack {
                Circle()
                    .fill(accentColor.opacity(0.18))
                    .frame(width: 52, height: 52)
                Image(systemName: program.icon)
                    .font(.title2)
                    .foregroundStyle(accentColor)
            }

            Spacer()

            Text(program.name)
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 140, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.regularMaterial)
                .shadow(color: accentColor.opacity(0.15), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .strokeBorder(accentColor.opacity(0.2), lineWidth: 1)
        )
    }
}
