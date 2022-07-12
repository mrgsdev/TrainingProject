//
//  Weather_Widget.swift
//  Weather Widget
//
//  Created by MRGS on 12.07.2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Weather_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack{
            Text("Current Time")
                .font(.system(size: 16, weight: .black, design: .rounded))
                .padding(.bottom,2)
            Text(entry.date,style: .time)
                .font(.system(size: 16, weight: .black, design: .rounded))
        }
    }
}

@main
struct Weather_Widget: Widget {
    let kind: String = "Weather_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Weather_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This widget is designed to display the current weather infor mation.") 
    }
}

struct Weather_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Weather_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
