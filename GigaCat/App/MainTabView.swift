import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Workout", systemImage: "dumbbell") {
                
            }
            Tab("Progress", systemImage: "chart.bar") {
                
            }
            Tab("Calories", systemImage: "carrot") {
                
            }
            Tab("Profile", systemImage: "person") {
                
            }
        }
        .tint(.primary)
    }
}
