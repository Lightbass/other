scGui := Gui(, "Time Calc")
scGui.Add("Text", "w100", "Hours")
scGui.Add("Text", "w100 xp+105", "Minutes")
scGui.Add("Text", "w100 xp+105", "Seconds")
scGui.Add("Edit", "x0 w100 vEditHours1 Number Limit2", "00")
scGui.Add("Edit", "w100 xp+105 vEditMinutes1 Number Limit2", "00")
scGui.Add("Edit", "w100 xp+105 vEditSeconds1 Number Limit2", "00")
scGui.Add("Edit", "x0 w100 vEditHours2 Number Limit2", "00")
scGui.Add("Edit", "w100 xp+105 vEditMinutes2 Number Limit2", "00")
scGui.Add("Edit", "w100 xp+105 vEditSeconds2 Number Limit2", "00")
buttonResult := scGui.Add("Button", "x0 w310", "Result")
buttonResult.OnEvent("Click", Result_Click)
scGui.Add("Text", "x0 w100 vEditHours3", "00")
scGui.Add("Text", "w100 xp+105 vEditMinutes3", "00")
scGui.Add("Text", "w100 xp+105 vEditSeconds3", "00")
scGui.Show("W310 H130")

Result_Click(*) 
{
   timeString1 := "20200101" . Format("{:02}", scGui["EditHours1"].Value) . Format("{:02}", scGui["EditMinutes1"].Value) . Format("{:02}", scGui["EditSeconds1"].Value)
   timeString2 := "20200101" . Format("{:02}", scGui["EditHours2"].Value) . Format("{:02}", scGui["EditMinutes2"].Value) . Format("{:02}", scGui["EditSeconds2"].Value)
   secondsDiff := Integer(Abs(DateDiff(timeString1, timeString2, "seconds")))
   scGui["EditHours3"].Text := Floor(secondsDiff / 3600)
   scGui["EditMinutes3"].Text := Floor(Mod(secondsDiff, 3600) / 60)
   scGui["EditSeconds3"].Text := Floor(Mod(Mod(secondsDiff, 3600), 60))
}