controladdin AngularAgendaAddin
{
    VerticalShrink = true;
    HorizontalShrink = true;
    MinimumHeight = 600;
    MinimumWidth = 800;
    RequestedHeight = 700;
    RequestedWidth = 800;
    VerticalStretch = true;
    HorizontalStretch = true;
    //Load startup script
    StartupScript = 'scripts/startup.js';
    Scripts = 'https://h2909571.stratoserver.net/HellebrekerPackages/2.-AgendaExternal/js/angwrapper.js';
    //Load stylesheet
    StyleSheets = 'https://h2909571.stratoserver.net/HellebrekerPackages/2.-AgendaExternal/style/styles.css';

    //Load scripts as images so they are loaded before the control is loaded
    //Event that is fired when the control is ready from js side
    event ControlReady();
    event EventRanFromAngular(text: Text; date: DateTime);
    //Procedure that is called from business central to js side
    procedure AddNewEvent(text: text; startDateTime: DateTime; endDateTime: DateTime; backColor: text);
}
