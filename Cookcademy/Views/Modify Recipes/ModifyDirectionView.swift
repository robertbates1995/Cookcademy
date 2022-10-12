//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Robert Bates on 10/12/22.
//

import SwiftUI

struct ModifyDirectionView: View {
    
    @Binding var direction: Direction
    
    let createAction: (Direction) -> Void
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ModifyDirectionView_Previews: PreviewProvider {
    @State static var emptyDirection = Direction(description: "", isOptional: false)
    static var previews: some View {
        ModifyDirectionView(direction: $emptyDirection) { _ in return}
    }
}
