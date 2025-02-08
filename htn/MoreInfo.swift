//
//  MoreInfo.swift
//  htn
//
//  Created by Akshayan on 2024-09-14.
//

import SwiftUI

struct MoreInfo: View {
    @EnvironmentObject var storage: Storage
    var discount: Objects
    
    var body: some View {
        NavigationView {
            
            VStack {
                AsyncImage(url: URL(string: discount.photoUrl)) { image in image
                        .image?.resizable()
                        .scaledToFill()
                        .frame(width:75,height:110)
                        
                }
                
                Text(discount.dstion)
                    .frame(width:380, height: 200)
                    .border(.cyan)
                    .font(.system(size: 17.0))
                Link(destination: discount.Link, label: {
                    Text("Watch Here")
                        .font(.system(size: 20.0))
                        .padding(.top,20)
                })
                
            }
        }.navigationTitle("More info")
        
    }
}

#Preview {
    MoreInfo(discount: Objects(
            id: "1",
            specificDiscount: "10% off on all items",
            dstion: "Make the most of your commute on GO Transit and UP Express by studying, napping, texting, or simply relaxing—all while aving 40%* on the full ticket price! To enjoy this discount, apply for the GO Transit Student ID and, if you don't already have one, get a PRESTO fare card.",
            Link: URL(string: "https://example.com")!,
            photoUrl: "https://www.apple.com/v/ipad/home/ck/images/overview/welcome/welcome_hero_startframe__t2k4bw3ehv2a_xlarge.jpg")
            
        )
}
