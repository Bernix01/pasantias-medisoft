//
//  JitsiView.swift
//  Medisoft
//
//  Created by Guillermo Bernal Moreira on 10/6/20.
//

import SwiftUI
import JitsiMeet

struct JitsiMeetComponent: UIViewRepresentable {
    let room: String
    let onEnd: ()-> ()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> JitsiMeetView {
        let view = JitsiMeetView()
        let opts = JitsiMeetConferenceOptions.fromBuilder { (builder) in
            builder.room = self.room
        }
        view.delegate = context.coordinator
        view.join(opts)
        return view
    }
    
    func updateUIView(_ uiView: JitsiMeetView, context: Context) {
    }
    
    typealias UIViewType = JitsiMeetView
    
    final class Coordinator: NSObject, JitsiMeetViewDelegate {
        
        private let jitsiView: JitsiMeetComponent
        
        init(_ jitsiView: JitsiMeetComponent) {
            self.jitsiView = jitsiView
        }
        
        func conferenceTerminated(_ data: [AnyHashable : Any]!) {
            jitsiView.onEnd()
        }
        
    }
    
}

struct JitsiMeetComponent_Previews: PreviewProvider {
    static var previews: some View {
        JitsiMeetComponent(room: "test1234") {}
    }
}
