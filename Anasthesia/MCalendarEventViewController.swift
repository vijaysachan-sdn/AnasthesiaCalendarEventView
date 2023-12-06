//
//  MCalendarEventViewController.swift
//  Anasthesia
//
//  Created by Vijay Sachan on 05/12/23.
//
import UIKit
import CalendarKit
class MCalendarEventViewController: DayViewController {
    struct MEvent{
        let startDate:Date,endDate:Date
        let text1:String,text2:String
        let textColor:UIColor;let textFont:UIFont
        let bgColor:UIColor
        let imgNameForIcon:String
        init(startDate: Date, endDate: Date, text1: String, text2: String, textColor: UIColor, textFont: UIFont, bgColor: UIColor, imgNameForIcon: String) {
            self.startDate = startDate
            self.endDate = endDate
            self.text1 = text1
            self.text2 = text2
            self.textColor = textColor
            self.textFont = textFont
            self.bgColor = bgColor
            self.imgNameForIcon = imgNameForIcon
        }
    }
    var arr:[MEvent]!
    
    override func viewDidLoad(){
//        arr=MCalendarEventViewController.testEvents()
        super.viewDidLoad()
        
        dayView.dayHeaderView.isHidden=true
        dayView.backgroundColor = .white
        dayView.timelinePagerView.autoScrollToFirstEvent=true
    }
    
    // Return an array of EventDescriptors for particular date
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        //      var models = myAppEventStore.getEventsForDate(date) // Get events (models) from the storage / API
        
        var events = [Event]()
        for mEvent in arr{
            let event = Event()
            event.color = mEvent.bgColor//.gray
            // Specify DateInterval
            let start = mEvent.startDate
            let end=mEvent.endDate
            let text1=mEvent.text1
            let text2=mEvent.text2
            let imgName=mEvent.imgNameForIcon
            let textColor = mEvent.textColor
            
            event.dateInterval = DateInterval(start: start, end: end)
            event.text=text1
            event.text2=text2
            event.textColor=textColor
            event.imageName=imgName
            event.font=mEvent.textFont
            events.append(event)
        }
         
        return events
    }
    static func testEvents()->[MEvent]{
        var events = [MEvent]()
        let format="HH:mm"
        // Specify DateInterval
        let start = Date(timeIntervalSinceNow: -60*60*2)
        let end=Date.now
        let text1="model.title"+" "+"model.location"+" "+start.getFormattedDate(format: format) + " - " + end.getFormattedDate(format: format)
        let text2="Location aaaaa bbbb"
        let imgName="location_on-location_on_symbol"
        let textColor = UIColor.black
        let event=MEvent(startDate: start, endDate: end, text1: text1, text2: text2, textColor: .red, textFont: UIFont.systemFont(ofSize: 15), bgColor: .blue, imgNameForIcon: imgName)
        events.append(event)
        return events
    }
}
extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
/**
 EventView
 */
