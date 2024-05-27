//
//  DetailHeaderView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct DetailHeaderView: View {
    
    @ObservedObject private var viewModel : ConfigureFavoriteViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: ConfigureFavoriteViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            BackDropImageView(imageURL: viewModel.output.movie.backdrop)
                .opacity(0.7)
                .frame(height: 300)
            
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .frame(height: 300)
            
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .frame(width: 30, height: 30)
                        .background(.white)
                        .foregroundStyle(.customPrimary)
                        .clipShape(Circle())
                        .padding(.leading, 16)
                        .wrapToButton {
                            dismiss()
                        }
                    
                    Spacer()
                    
                    Image(systemName: viewModel.output.isFavorite ? "heart.fill" : "heart")
                        .frame(width: 30, height: 30)
                        .background(.white)
                        .foregroundStyle(.customPrimary)
                        .clipShape(Circle())
                        .padding(.trailing, 16)
                        .wrapToButton {
                            viewModel.input.favoriteButtonClicked.send(())
                        }
                }
                .padding(.top, 64)
                
                Spacer()
                
                HStack(alignment: .bottom, spacing: 8) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.output.movie.title)
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .bold()
                            .lineLimit(1)
                            .allowsTightening(true)
                        Text(viewModel.output.movie.originalTitle)
                            .foregroundStyle(.gray.opacity(0.8))
                            .font(.headline)
                            .lineLimit(1)
                            .allowsTightening(true)
                        HStack(spacing: 8) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.white)
                            Text(String(format: "%.1f", viewModel.output.movie.voteAverage))
                                .foregroundStyle(.white)
                                .font(.callout)
                        }
                    }
                    
                    Spacer()
                    
                    PosterView(imageURL: viewModel.output.movie.poster)
                        .clipShape(.rect(cornerRadius: 8))
                        .frame(width: 90, height: 130)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .onAppear {
            viewModel.input.onAppearTrigger.send(())
        }
    }
}
