//
//  CardView.swift
//  HikeApp
//
//  Created by Tammana Sharma on 17/12/23.
//

import SwiftUI

    struct CardView: View {
        
        @State private var imageNumber : Int = 1
        @State private var randomNumber : Int = 1
        @State private var isShowingSheet : Bool = false
        func randomImage() {
            repeat {
                randomNumber = Int.random(in: 1 ... 5)
            } while( randomNumber == imageNumber)
                    
            imageNumber = randomNumber
            
        }
        var body: some View {
          ZStack {
            CustomBackgroundView()
            VStack {
           //MARK: Header
                VStack(alignment : .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [Color.colorGrayLight,
                                Color.colorGrayMedium],
                                startPoint: .top, endPoint: .bottom))
                        Spacer()
                        Button {
                            print("tapped")
                            isShowingSheet.toggle()
                        }
                        label : {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large ])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                    
                }
                .padding(.horizontal, 30)
                
                //MARK: Content
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .animation(.default, value: imageNumber)
                    
                }
                
                //MARK: Footer
                
                Button {
                    print("Explore more button tapped!")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [
                            .colorGreenLight,
                            .colorGreenMedium
                        ], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButtonStyle())
            }
        }
        .frame(width: 320, height: 570)
        
    }
    }

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
