
import SwiftUI
import Foundation
struct Page2View: View {
    @Binding var text3: String
    @State private var chatgptResponse: ChatGPTResponse?
    
    var body: some View {
        VStack {
            Text(chatgptResponse?.message ?? "Not found")
        }
        .padding()
        .task {
            do {
                chatgptResponse = try await fetchGPTResponse()
            } catch {
                print("Error fetching GPT response: \(error)")
            }
        }
    }
    
    func fetchGPTResponse() async throws -> ChatGPTResponse {
        let endpoint = "http://192.168.1.207:5002/api/hello/\(text3)"
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(ChatGPTResponse.self, from: data)
    }
}

struct ChatGPTResponse: Codable {
    var message: String
}
let json = """
{
    "name": "Durian",
    "points": 600,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!


#Preview {
    Page2View(text3: .constant("hello"))
}

