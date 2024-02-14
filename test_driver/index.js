var reporter = require('cucumber-html-reporter');

var currentdate = new Date(); 
var datetime =  currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/" 
                + currentdate.getFullYear() +  " @ "
                + currentdate.getHours() + ":"  
                + currentdate.getMinutes() + ":" 
                + currentdate.getSeconds() + " IST";

var options = {
        theme: 'bootstrap',
        jsonFile: '../report.json',
        output: './cucumber_report.html',
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true,
        metadata: {
            "Date and Time" : datetime,
            "App Version":"0.3.2",
            "Test Environment": "STAGING",
            "Browser": "Chrome  54.0.2840.98",
            "Platform": "Mac M1",
            "Parallel": "Scenarios",
        },
        failedSummaryReport: true,
    };

    reporter.generate(options);