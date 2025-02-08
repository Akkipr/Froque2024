//
//  MoreInfo2.swift
//  htn
//
//  Created by Akshayan on 2024-09-15.
//

import SwiftUI

struct MoreInfo2: View {
    
    @EnvironmentObject var storage: Storage
    var extra: Objects2
    
    var body: some View {
        NavigationView {
            
            VStack {
                AsyncImage(url: URL(string: extra.photo)) { image in image
                        .image?.resizable()
                        .scaledToFill()
                        .frame(width:75,height:110)
                        
                }
                
                Text(extra.detion)
                    .frame(width:380, height: 200)
                    .border(.cyan)
                    .font(.system(size: 17.0))
                Link(destination: extra.linkUrl, label: {
                    Text("Watch Here")
                        .font(.system(size: 20.0))
                        .padding(.top,20)
                })
                
            }
        }.navigationTitle("More info")
        
    }
}

#Preview {
    MoreInfo2(extra: Objects2(
        id: "1",
        name: "10% off on all items",
        detion: "Make the most of your commute on GO Transit and UP Express by studying, napping, texting, or simply relaxing—all while saving 40%* on the full ticket price! To enjoy this discount, apply for the GO Transit Student ID and, if you don't already have one, get a PRESTO fare card.",
        linkUrl: URL(string: "https://example.com")!,
        photo: "https://www.apple.com/v/ipad/home/ck/images/overview/welcome/welcome_hero_startframe__t2k4bw3ehv2a_xlarge.jpg")
             
    )
}
