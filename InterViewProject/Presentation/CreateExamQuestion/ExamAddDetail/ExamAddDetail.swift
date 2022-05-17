//
//  ExamAddDetail.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 13.05.2022.
//

import SwiftUI
import TTComponents

struct Post:Identifiable{
    var id =  UUID().uuidString
    var postImage:String
}

struct ExamAddDetail: View {
    
    
    @State private var offset = CGFloat.zero
    
    @Binding var currentShowedView:Selection
    
    @StateObject var VM = AddQuestionViewModel()
    @State var show = true
    @State var index = 1
    var body: some View {
        
        TabView(selection: $index) {
            
            
            ForEach(1...VM.questionList.count,id:\.self) { val in
                AddQuestionDetailView(examOrQuestion: false, currentShowedView: $currentShowedView, title: "Soru Oluşturma \(val)")
                    .tag(val)
                    .environmentObject(VM)
                
                    .onChange(of: VM.questionList, perform: { newValue in
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
                            withAnimation (.easeIn(duration: 50)){
                                index = newValue.count
                            }
                            
                        }
                        
                    })
            }
            
            
            
        }
        
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()   
    }
}
struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ExamAddDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExamAddDetail(currentShowedView: .constant(.showExamQuestion))
    }
}


