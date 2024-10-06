import SwiftUI

struct OpeningView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("emoryBlue")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("emoryEagle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(x: -10)
                    Text("EmoryCals")
                        .fontWeight(.medium)
                        .font(.title2)
                    Spacer()
                    
                    // Sign Up NavigationLink
                    NavigationLink(destination: SignUpScreen()) {
                        signupButtonView(title: "Sign Up", color: "graysignup")
                    }
                    .padding()
                    
                    // Log In NavigationLink
                    NavigationLink(destination: LogInScreen()) {
                        signupButtonView(title: "Log In", color: "yellowsignup")
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct SignUpScreen: View {
    var body: some View {
        Color("emoryBlue")
            .ignoresSafeArea()
        
    }
}

struct LogInScreen: View {
    var body: some View {
        Color("emoryBlue")
            .ignoresSafeArea()
    }
}

// Preview
#Preview {
    OpeningView()
}
