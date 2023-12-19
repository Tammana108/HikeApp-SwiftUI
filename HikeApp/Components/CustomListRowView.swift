//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Tammana on 19/12/23.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowIcon : String
    @State var rowLabel : String
    @State var rowTintColor : Color
    @State var rowContent : String? = nil
    @State var rowLinkLabel : String? = nil
    @State var rowLinkDestination : String? = nil
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            } else if( rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string : rowLinkDestination!)!)
                    .fontWeight(.heavy)
                    .foregroundColor(.pink)
            }else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width : 30, height : 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                }
                Text(rowLabel)
            }
        }

    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            CustomListRowView(rowIcon: "person", rowLabel: "Developer", rowTintColor: .pink, rowContent : "Tammana")
            //CustomListRowView(rowIcon: "", rowLabel: "", rowTintColor: .pink, rowLinkLabel : "Link", rowLinkDestination : "https://www.google.com/")
        }
    }
}
