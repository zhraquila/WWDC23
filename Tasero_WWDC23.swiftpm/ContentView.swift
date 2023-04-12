import SwiftUI

extension CGRect {
    var center : CGPoint {
        return CGPoint(x:self.midX, y:self.midY)
    }
}

struct PuzzleGame: View {
    @State var piecePositions: [CGRect] = []
    @State var draggingPiece: Int? = nil
    
    init() {
        createPiecePositions()
    }
    
    var body: some View {
        ZStack {
            Image("300CANTI")
                .resizable()
                .scaledToFit()
            
            ForEach(0..<piecePositions.count, id: \.self) { index in
                Image("piece\(index + 1)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .position(piecePositions[index].center)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                draggingPiece = index
                            }
                            .onEnded { value in
                                draggingPiece = nil
                            }
                    )
            }
        }
    }
    
    func createPiecePositions() {
        piecePositions = [
            CGRect(x: 100, y: 100, width: 50, height: 50),
            CGRect(x: 200, y: 100, width: 50, height: 50),
            CGRect(x: 100, y: 200, width: 50, height: 50),
            CGRect(x: 200, y: 200, width: 50, height: 50)
        ]
    }
}
struct ContentView: View {
    var body: some View {
        PuzzleGame()
    }
}
