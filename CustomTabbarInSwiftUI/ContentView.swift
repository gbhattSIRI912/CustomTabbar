//
//  ContentView.swift
//  CustomTabbarInSwiftUI
//
//  Created by Gaurav Bhatt on 12/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var index: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if self.index == 0 {
                    MailsView()
                } else if self.index == 1 {
                    Files()
                } else if self.index == 2 {
                    HomeView()
                } else if self.index == 3 {
                   MediaView()
                    
                } else {
                    ProfileView()
                }
                
            }
            .padding(.bottom, -35)
            CustomTabbar(index: $index)
        }
        
    }
}

#Preview {
    ContentView(index: 0)
}

struct CustomTabbar: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }, label: {
                VStack {
                    Image("Mail")
                    Text("Mail")
                }
                
            })
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }, label: {
                VStack {
                    Image("Files")
                    Text("Files")
                }
            })
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            .offset(x: 10)
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }, label: {
                Image("QR").renderingMode(.original)
            })
            .offset(x: 23, y: -36)
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }, label: {
                VStack {
                    Image("Media")
                    Text("Media")
                }
            })
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))
            .offset(x: 5)
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 4
            }, label: {
                VStack {
                    Image("Generic")
                    Text("Generic")
                }
            })
            .foregroundColor(Color.black.opacity(self.index == 4 ? 1 : 0.2))
        }
        .padding(.horizontal, 20)
        .padding(.top, 35)
        .background(Color.white)
        .clipShape(CShape())
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            path.addArc(center: CGPoint(x: (rect.width / 2) + 4, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            
        }
    }
    
    
}
