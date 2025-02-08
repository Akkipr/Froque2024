//
//  ListUIView.swift
//  htn
//
//  Created by Akshayan on 2024-09-14.
//

import SwiftUI

struct ListUIView: View {
    @EnvironmentObject var storage: Storage
    
    var body: some View {
        NavigationView {
            TabView {
                List(storage.discounts, id: \.id) { discount in
                    NavigationLink(destination: MoreInfo(discount: discount)) {
                        HStack {
                            AsyncImage(url: URL(string: discount.photoUrl)) { image in image
                                    .image?.resizable()
                                    .scaledToFill()
                                    .frame(width:75,height:110)
                                    .padding(.leading,41)
                            }
                            Text(discount.specificDiscount)
                                .padding(.leading,40)
                            
                        }
                    }
                }.tabItem {
                    Text("Discounts")
                }
                
                
                
                
                List(storage.extras, id: \.id) { extra in
                    NavigationLink(destination: MoreInfo2(extra: extra)) {
                        HStack {
                            AsyncImage(url: URL(string: extra.photo)) { image in image
                                    .image?.resizable()
                                    .scaledToFill()
                                    .frame(width:55,height:110)
                                    .padding(.leading,41)
                            }
                            Text(extra.name)
                                .padding(.leading,90)
                            
                            
                            
                        }
                    }
                    
                }.tabItem {
                    Text("Extra-Curriculars")
                }
                
            }
            
        }
    }
}


#Preview {
    ListUIView()
        .environmentObject(Storage())
}
