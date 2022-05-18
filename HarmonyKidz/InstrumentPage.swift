//
//  InstrumentPage.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import Foundation
import SwiftUI

struct InstrumentPage: View {
    var body: some View {
        Home()
    }
}
    


struct InstrumentPage_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentPage()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct Home : View {
    
    @State var page = 0
    
    var body: some View{
        
        VStack{
            VStack{
                GeometryReader{g in
                    
                    //Using GeomtryReader For Getting Remaining Height...
                    Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
                }
                
                PageControl(page: self.$page)
                .padding(.top, 20)
            }
            .padding(.vertical)
        }
        .navigationBarHidden(true)
        .padding(.top, 100)
    }
}

struct List : View {
            
        var body: some View{
            
            HStack (spacing: 0){
                
                ForEach(data){i in
                        
                        // Mistakenly Used Geometry Reader.....
                    GeometryReader{g in
                        Card(width: UIScreen.main.bounds.width, data: i)
                    }
                    
                        
                    }
                }
            }
        }
    

struct Card : View {
    
    var width :  CGFloat
    var data : Type
    
    var body: some View{
        
        VStack{
            
            VStack{
                
                Text(self.data.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top,5)
                
                Image(self.data.image)
                    .resizable()
                    .frame(width: self.width - 600, height: 600)
                    .cornerRadius(20)
                    .padding()
                
                Button(action: {
                    //NAMA PAGENYA
                }) {
                    Text("Play")
                        .foregroundColor(.black)
                        .padding(.vertical,30)
                        .padding(.horizontal, 100)
                }
                .background(.white)
                .clipShape(Capsule())
                .padding(.top, 2)
                .padding(.bottom)
                
                // For filling Empty Space......
            }
            .background(Color.gray)
            .cornerRadius(20)

        }
        .frame(width: self.width)
    }
}

struct Carousel : UIViewRepresentable{
    
    
    func makeCoordinator() -> Coordinator {
        
        return Carousel.Coordinator(parent1: self)
    }
    
    
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    
    
    func makeUIView(context: Context) -> UIScrollView{
       
        // ScrollView
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        //1.0 For Disabling Vertical Scroll.....
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        // Now Going to embed swiftUI View Into UIView...
        
        let view1 = UIHostingController(rootView: List())
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        
        var parent : Carousel
        
        init(parent1: Carousel){
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            // Using This Function For Getting Current Page
            // Follow Me...
            
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.parent.page = page
        }
    }
}

// UIPageControl

struct PageControl : UIViewRepresentable {
    
    @Binding var page : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        view.currentPage = page
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        //Updating Page Indicator When Ever Page Change...
        
        DispatchQueue.main.async {
            
            uiView.currentPage = self.page
        }
    }
}

struct Type : Identifiable {
    
    var id : Int
    var name : String
    var image : String

}

var data = [

    Type(id: 0, name : "Guitarku", image: "guitar"),
    Type(id: 1, name : "Pianoku", image: "drum"),
    Type(id: 2, name : "Tamborinku", image: "keyboard"),
    Type(id: 3, name : "Drumku", image: "xylophone"),

]
