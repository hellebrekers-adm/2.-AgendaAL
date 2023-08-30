page 50950 Agenda
{
    ApplicationArea = All;
    Caption = 'Agenda';
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                usercontrol(AgenadAddin; AngularAgendaAddin)
                {
                    ApplicationArea = All;

                    trigger ControlReady()
                    var
                        startDT: DateTime;
                        endDT: DateTime;
                    begin
                        startDT := CurrentDateTime;
                        endDT := CurrentDateTime;
                        CurrPage.AgenadAddin.AddNewEvent('test', startDT, endDT, 'rgba(255, 0, 0, 0.5)');
                    end;

                    trigger EventRanFromAngular(text: Text; date: DateTime)
                    begin
                        Message('event ran from angular with the text: %1 at %2', text, date);
                        AddTasks();
                    end;
                }
            }
        }
    }

    procedure AddTasks()
    var
        _truckerRecord: Record Truckplanning;
        _employeeRecord: Record Employee;
        _orderRecord: Record "Sales Header";
        _startDate: DateTime;
        _title: Text;
    begin
        // Message(GetRandomColor());
        if _truckerRecord.FindSet() then begin
            repeat
                if (_truckerRecord.Order <> '') then begin
                    if _employeeRecord.Get(_truckerRecord.Employee) then begin
                        if _orderRecord.Get("Sales Document Type"::Order, _truckerRecord.Order) then begin
                            _startDate := CreateDateTime(_orderRecord."Requested Delivery Date", _truckerRecord."Requested Delivery Time");
                            _title := _truckerRecord.Employee + '  |' + _orderRecord."No." + ' / ' + _orderRecord."Sell-to Customer No." + ' / ' + _orderRecord."Sell-to Customer Name";
                            CurrPage.AgenadAddin.AddNewEvent(_title, _startDate, _startDate, _employeeRecord.Color);
                        end;
                    end;
                end;
            until (_truckerRecord.Next() = 0);
        end;
    end;


    procedure GetRandomColor(): Text
    var
        Red, Green, Blue : Integer;
    begin
        // Generate a random number between 0 and 255 for each color component
        Red := Random(256);
        Green := Random(256);
        Blue := Random(256);

        // Return the color in hexadecimal format
        exit('rgba(' + Format(Red) + ', ' + Format(Green) + ', ' + Format(Blue) + ', ' + '255)');
    end;
}
