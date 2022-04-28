//
//  AddQuestionDetail.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 28.04.2022.
//

import SwiftUI
import TTComponents




 enum QuestionOptions{

    case options(Int)


    var result:String{
        switch self {
        case .options(let count):
            switch count{
            case 0: return "A"
            case 1: return "B"
            case 2: return "C"
            case 3: return "D"
            case 4: return "E"
            default:
                return "Hatalı"
            }
        }
    }

}




struct AddQuestionDetailView: View {
    
    
    
    @State var show = false
    
    @State var questionContent:String = ""
    
    
    
    
    
    @StateObject var VM = AddQuestionViewModel()
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                    
                    List{
                        Section {
                            Button {
                                withAnimation {
                                    show.toggle()
                                }
                            } label: {
                                Text(VM.selectedPickere.isEmpty ? "Kategori" : VM.selectedPickere)
                                    .foregroundColor(.black)
                            }

                        }
                        Section {
                            TextEditor(text: $questionContent)
                                .onChange(of: questionContent, perform: { newValue in
                                    VM.questionContent = newValue
                                    })

                        } header: {
                            
                            Text("Soru İçeriği")
                                .font(.callout)
                        }
                        Section{
                             
                            questionList()
                                                       
                            
                        } header: {
                            Text("Şıklar")
                                .font(.callout)
                            
                            Button {
                                if VM.quesitons.count < 5 {
                                    VM.quesitons.append("")
                                }
                            } label: {
                                HStack{
                                    Text("Ekle")
                                    Image(systemName: "plus")
                                } .frame(maxWidth: .infinity,alignment: .trailing)
                              
                            }
                        }  
                    }
                   
                    Button {
                        VM.getCategory()
                    } label: {
                        Text("Kaydet")
                            .frame(height: 50)

                    }
                    .disabled(VM.saveButtonDisabled)

                }
                
                
                if show{
                    TTPicker(backGroundColor: .secondary, content: {
                        ForEach(VM.category,id:\.self) { itm in
                            Text(itm)
                        }
                    }, select: $VM.selectedPickere)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                        }
                     
                    }
                }
                
            }
            .navigationTitle("Soru Oluşturma")
        }
     
            
        
        
     
    }
    @ViewBuilder
    func questionList() -> some View{
        ForEach(VM.quesitons.indices,id:\.self) { val in
                if val <= 4{
                    VStack{
                        HStack{
                            
                            Text("\(QuestionOptions.options(val).result)) Şıkkı")
                                .foregroundColor(VM.questionAnswer == QuestionOptions.options(val).result ? .blue : .black)
                                .onTapGesture {
                                    VM.questionAnswer = QuestionOptions.options(val).result
                                }
                            TextField("\(QuestionOptions.options(val).result) şıkkını oluşturun" , text: $VM.quesitons[val])
                        }
                    }

                }
            }
        .onDelete(perform: delete)
    }
    
    
    // BU VİEW MODELDE OLACAK
    func delete(at offsets: IndexSet) {
        VM.quesitons.remove(atOffsets: offsets)
       }
}

struct AddQuestionDetail_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestionDetailView()
    }
}
