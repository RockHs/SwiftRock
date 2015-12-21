//
//  NSDate.swift
//  swiftRock
//
//  Created by Rock on 15/12/3.
//  Copyright © 2015年 Rock. All rights reserved.
//

import Foundation

extension NSDate {
    
    /*****************************设置NSDate时间处理********************************begin*/
     //string转nsdate
    func transToDate(dateStr: String, formatter: String!) -> NSDate! {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = formatter
        let newDate = dateFormatter.dateFromString(dateStr)
        return newDate
    }
    //string转nsdate，默认格式”yyyy-MM-dd HH:mm:ss“
    func transToDateDefaultFormatter(dateStr: String) -> NSDate! {
        return self.transToDate(dateStr, formatter: "yyyy-MM-dd HH:mm:ss")
    }
    //nsdate转string
    func transToString(date: NSDate, formatter: String!) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = formatter
        let newDateStr = dateFormatter.stringFromDate(date)
        return newDateStr
    }
    //nsdate转string，默认格式”yyyy-MM-dd HH:mm:ss“
    func transToStringDefaultFormatter(date: NSDate) -> String {
        return self.transToString(date, formatter: "yyyy-MM-dd HH:mm:ss")
    }
    //两个时间相隔多久
    func calculateDateInterval(fromDate: NSDate, toDate: NSDate) -> NSInteger {
        let diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: fromDate, toDate: toDate, options: NSCalendarOptions.init(rawValue: 0))
        var days = diffDateComponents.day
        let hours = diffDateComponents.hour
        let minutes = diffDateComponents.minute
        let seconds = diffDateComponents.second
        if hours > 0 || minutes > 0 || seconds > 0 {
            days++
        }
        return days
    }
    //跟当前时间相隔多久
    func calculateDateIntervalFromCurDate(toDate: NSDate) -> NSInteger {
        return self.calculateDateInterval(NSDate(), toDate: toDate)
    }
    //比较日期和时间（早于还是晚于）
    func compareDateEarlierThanLater(date1: NSDate, date2: NSDate) {
        print("Earlier date is: \(date1.earlierDate(date2))")
        print("Later date is: \(date1.laterDate(date2))")
        //        if date1.compare(date2) == NSComparisonResult.OrderedDescending {
        //            print("Date1 is Later than Date2")
        //        }
        //        else if date1.compare(date2) == NSComparisonResult.OrderedAscending {
        //            print("Date1 is Earlier than Date2")
        //        }
        //        else if date1.compare(date2) == NSComparisonResult.OrderedSame {
        //            print("Same dates")
        //        }
    }
    
    /*****************************设置NSDate时间处理********************************end*/
    
}