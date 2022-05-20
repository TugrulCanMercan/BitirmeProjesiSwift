//
//  ExamDraftList.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import SwiftUI

struct ExamDraftListView: View {
    var body: some View {
        List{
            ForEach(1...3,id:\.self) { _ in
                Text("ads")
            }
        }
    }
}

struct ExamDraftList_Previews: PreviewProvider {
    static var previews: some View {
        ExamDraftListView()
    }
}
