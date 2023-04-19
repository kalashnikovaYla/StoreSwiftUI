//
//  ContentView.swift
//  StoreSwiftUI
//
//  Created by sss on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var segmentedIndex = 0
    @State var offsetX = 0
    
    var name = [
        "Nike W Air",
        "Nike Infinity",
        "Reebok Turbo"
    ]
    
    var description = [
        "Модель Nike Air Huarache возвращает вам популярность на уличном уровне. Гладкая кожа на верхней части сочетается с супер-дышащей, идеально блестящей неопреновой тканью для легкости. Фирменный стиль stripped away создает любимый стиль бега 90-х. Амортизация Nike Air обеспечивает длительный комфорт",
        
        "Кроссовки Nike Epic React Flyknit 3 с ярким дизайном, плавными линиями и легкой конструкцией выводят линейку на новый уровень. Легкий и долговечный пеноматериал Nike React отличается невероятной мягкостью и упругостью. При каждом шаге пеноматериал реагирует на давление, быстро возвращая исходную форму. Чем энергичнее шаг, тем больше возврат энергии. Легкий верх из эластичного материала Flyknit для вентиляции во время бега. Он повторяет форму стопы для поддержки при каждом шаге. Новая форма литой области пятки создана на основе отзывов бегунов",
        
        "Современный дизайн кроссовок выделяется четкими геометрическими линиями. Верх выполнен из сочетания искусственной кожи и сетчатого текстиля. Детали: инновационная подметка упруго пружинит. Упругая промежуточная подошва FuelFoam для амортизации. Детали: шнуровка, текстильная внутренняя отделка"
    ]
   
    var price = ["21 999 ₽", "24 660 ₽", "8 999 ₽"]
    var imageName = ["im1", "im2", "im3"]
    
    var body: some View {
        
        ScrollView {
            VStack {
                Spacer()
                Text("Кроссовки " + name[segmentedIndex])
                    .font(.largeTitle)
                    .padding(8)
                    .multilineTextAlignment(.center)
                   
                Image(imageName[segmentedIndex]).resizable()
                    .frame(width: 360, height: 360)
                    .scaledToFill()
                    .cornerRadius(10)
                
                Picker(selection: Binding(get: {
                    segmentedIndex
                }, set: { newValue in
                    segmentedIndex = newValue
                })) {
                    ForEach(0 ..< name.count, id: \.self) {
                        Text(name[$0]).tag($0)
                    }
                } label: {
                    Text("")
                }.pickerStyle(.segmented)
                    .frame(height: 100)

                Spacer(minLength: 0)
                HStack {
                    Text("Цена: " + price[segmentedIndex])
                        .font(.headline)
                    Spacer()
                    
                    Button {
                        //TODO: Share
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up.circle")
                                .font(.title)
                                .foregroundColor(.black)
                            Text("Поделиться")
                                .font(.headline)
                                .tint(.black)
                        }
                    }

                }.padding()
                
                Button {
                    
                } label: {
                    Text("Добавить в корзину")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .tint(.white)
                        .background(.orange)
                        .cornerRadius(24)
                
                        
                }

                Text(description[segmentedIndex])
                    .padding(5)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
