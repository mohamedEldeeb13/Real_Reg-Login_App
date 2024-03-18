//
//  VerticalCell.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 16/03/2024.
//

import SwiftUI

struct VerticalCell: View {
    let product : Product
    var body: some View {
        HStack
        {
            if let image = product.image , let url = URL(string: image) {
                AsyncImage(url: url,transaction: .init(animation: .bouncy(duration: 1))) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    case .failure(let error):
                        placeHolder()
                            .overlay {
                                Text(error.localizedDescription)
                                    .foregroundStyle(.blue)
                                    .bold()
                                    .lineLimit(1)
                            }
                    @unknown default:
                        EmptyView()
                    }// end of switch
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .background(Color(.systemBackground))
            }else{
                placeHolder()
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text(product.name ?? "")
                    .font(.title3)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                
                Text(product.description ?? "")
                    .font(.footnote)
            }// end of Vstack
            .lineLimit(2)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
        }// end of Hstack
        .background(Color.tabBarBackground)
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .shadow(radius: 3)
        .padding(.vertical,5)
        
    }
}


struct placeHolder: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .foregroundColor(.white)
            .background(.gray)
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    VerticalCell(product:.init(id: nil, price: nil, oldPrice: nil, discount: nil, image: nil, name: "ProductName", description: "descripton", images: nil, inFavorites: nil, inCart: nil))
}
