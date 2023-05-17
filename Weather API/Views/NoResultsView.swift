//
//  NoResultsView.swift
//  Weather API
//
//  Created by Dmytro Vakulinsky on 17.05.2023.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack {
            Text("Sorry! No results found...")
                .font(.custom("OpenSans-Bold", size: 24))
                .foregroundColor(Color(hex: 0x289460))
                .multilineTextAlignment(.center)
            
            Text("Please try a different search request")
                .font(.custom("OpenSans-Regular", size: 16))
                .foregroundColor(Color(hex: 0x575757))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
    }
}

