//
//  SettingsView.swift
//  HikeApp
//
//  Created by Tammana on 19/12/23.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternativeAppIcon : [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
        
    ]
    var body: some View {
        List {
            Section {
                HStack(){
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size : 80, weight : .black))
                    VStack {
                        Text("Hike")
                            .font(.system(size : 66, weight : .black))
                        Text("Editor's Choice")
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size : 80, weight : .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [
                    Color.colorGreenLight,
                    Color.colorGreenMedium,
                    Color.colorGreenDark
                ], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                VStack(spacing : 8) {
                    Text("Where can you find perfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better when you are actually there. The hike that you hope to do again someday.\nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom , 16)
                .frame(maxWidth : .infinity)
                
            }
            .listRowSeparator(.hidden)
            
            Section(header: Text("ALTERNATE ICONS")) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing : 12){
                        ForEach(alternativeAppIcon.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternativeAppIcon[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternativeAppIcon[item]) {error in
                                    if error != nil {
                                        print("Failed to change the App Icon : \(String(describing: error?.localizedDescription))")
                                    }
                                    
                                }
                                
                                
                            }
                            label : {
                                Image("\(alternativeAppIcon[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width : 80, height : 80)
                                    .cornerRadius(16)
                            }
                        }
                    }
                }
                .padding(.top, 12)
                Text("Choose your favourite app icon from the collection above.")
                    .frame(maxWidth : .infinity)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                  
                    
                    
            }
            .listRowSeparator(.hidden)
            
            Section(header: Text("ABOUT THE APP"), footer: HStack {
                Spacer()
                Text("Copyright © All right reserved.")
                Spacer()
            }) {
                CustomListRowView(rowIcon: "apps.iphone", rowLabel: "Application", rowTintColor: .blue, rowContent: "HIKE")
                CustomListRowView(rowIcon: "info.circle", rowLabel: "Compatibility", rowTintColor: .red, rowContent: "iOS, iPadOS")
                CustomListRowView(rowIcon: "swift", rowLabel: "Technology", rowTintColor: .orange, rowContent: "Swift")
                CustomListRowView(rowIcon: "gear", rowLabel: "Version", rowTintColor: .purple, rowContent: "1.0")
                CustomListRowView(rowIcon: "gear", rowLabel: "Developer", rowTintColor: .mint, rowContent: "Tammana Sharma")
                CustomListRowView(rowIcon: "gear", rowLabel: "Designer", rowTintColor: .pink, rowContent: "Dhananjay")
                CustomListRowView(rowIcon: "gear", rowLabel: "Website", rowTintColor: .indigo, rowLinkLabel: "GOOGLE", rowLinkDestination : "https://www.google.com")
                
            }
        }
       
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
