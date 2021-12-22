//
//  ContentView.swift
//  hirokiKadai3
//
//  Created by 河村宇記 on 2021/12/19.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNum1: Int?
    @State private var inputNum2: Int?
    @State private var symbol1: Bool = false
    @State private var symbol2: Bool = false
    @State private var outputNum1: Int = 0
    @State private var outputNum2: Int = 0
    @State private var total: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                NumberInputView(value: $inputNum1)
                NumberInputView(value: $inputNum2)
            }
            
            HStack {
                SymbolSwitchView(value: $symbol1)
                Spacer().frame(width: 110)
                SymbolSwitchView(value: $symbol2)
            }
            
            let unwrapedNum = [inputNum1, inputNum2].map{ $0 ?? 0 }
            Button(action: {
                outputNum1 = (symbol1 ? -1 : 1) * unwrapedNum[0]
                outputNum2 = (symbol2 ? -1 : 1) * unwrapedNum[1]
                total = outputNum1 + outputNum2
            }) {
                Text("Button")
            }
            .padding()
            
            HStack {
                Text(String(outputNum1))
                Spacer().frame(width: 100)
                Text("+")
                Spacer().frame(width: 100)
                Text(String(outputNum2))
            }
            
            Text(String(total))
                .padding()
        }
    }
}

struct NumberInputView: View {
    @Binding var value: Int?
    
    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter())
            .padding()
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct SymbolSwitchView: View {
    @Binding var value: Bool
    
    var body: some View {
        Text("+")
        Toggle("", isOn: $value).frame(width: 50)
        Text("-")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
