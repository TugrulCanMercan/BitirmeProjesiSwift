//
//  CustomNavBarContainer.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI
//NavigationView<Content> : View where Content : View
struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    @State private var color: Color? = nil
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarContent(showBackButton: showBackButton, title: title, subtitle: subtitle, navBarColor: color, showRightItem: false)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self, perform: { value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
        .onPreferenceChange(customNavigationBarColorPreferenceKey.self, perform: { value in
            self.color = value
        })
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello, world!")
                    .foregroundColor(.white)
                    .customNavigationTitle("New Title")
                    .customNavigationSubtitle("subtitle")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}
