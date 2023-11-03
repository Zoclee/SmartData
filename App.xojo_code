#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim tis As TextInputStream
		  Dim tmpStr As String
		  
		  mMutex = new Mutex("zoclee_smartdata")
		  
		  ReleaseDate = new Dictionary()
		  ReleaseDate.Value("2.0") = 1494287999
		  ReleaseDate.Value("2.1") = 1502740792
		  
		  #if TargetMacOS then
		    DataFolder = SpecialFolder.ApplicationData
		  #elseif TargetLinux then
		    DataFolder = SpecialFolder.ApplicationData
		  #else
		    DataFolder = SpecialFolder.SharedApplicationData
		  #endif
		  
		  if not DataFolder.Child("Zoclee").Exists then
		    DataFolder.Child("Zoclee").CreateAsFolder
		  end if
		  DataFolder = DataFolder.Child("Zoclee")
		  
		  if not DataFolder.Child("SmartData").Exists then
		    DataFolder.Child("SmartData").CreateAsFolder
		  end if
		  DataFolder = DataFolder.Child("SmartData")
		  
		  // load settings
		  
		  if DataFolder.Child("settings.dat").Exists then
		    
		    tis = TextInputStream.Open(DataFolder.Child("settings.dat"))
		    tmpStr = tis.ReadAll()
		    tis.Close
		    
		    try
		      Settings = new JSONItem(tmpStr)
		    catch
		    end try
		    
		    if Settings = nil then
		      Settings = new JSONItem("{""left"":-1,""top"":-1,""width"":-1,""height"":-1}")
		      SaveDataFile(Settings, DataFolder.Child("settings.dat"))
		    end if
		    
		  else
		    
		    Settings = new JSONItem("{""left"":-1,""top"":-1,""width"":-1,""height"":-1}")
		    SaveDataFile(Settings, DataFolder.Child("settings.dat"))
		    
		  end if
		  
		  // load recent files
		  
		  if DataFolder.Child("recent.dat").Exists then
		    
		    tis = TextInputStream.Open(DataFolder.Child("recent.dat"))
		    tmpStr = tis.ReadAll()
		    tis.Close
		    
		    try
		      Recent = new JSONItem(tmpStr)
		    catch
		    end try
		    
		    if Recent = nil then
		      Recent = new JSONItem("[]")
		      SaveDataFile(Recent, DataFolder.Child("recent.dat"))
		    else
		      LoadRecentFiles()
		    end if
		    
		  else
		    
		    Recent = new JSONItem("[]")
		    SaveDataFile(Recent, DataFolder.Child("recent.dat"))
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  Dim n As Integer
		  Dim msg() As String
		  Dim i As Integer
		  Dim tmpArr() As String
		  
		  msg = error.Stack
		  
		  i = 0 
		  while i <= msg.Ubound
		    if Trim(msg(i)) = "" then
		      msg.Remove(i)
		    else
		      tmpArr = split(msg(i), "%")
		      msg(i) = tmpArr(0)
		      i = i + 1
		    end if
		  wend
		  
		  n = MsgBox(Join(msg, EndOfLine), 16, "Unhandled Exception")
		  
		  return true
		  
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function FileConnect() As Boolean Handles FileConnect.Action
			Dim dlg As new OpenDialog()
			Dim f As FolderItem
			
			f = dlg.ShowModal()
			
			if f <> nil then
			WindowMain.actionConnect(f)
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewDatabase() As Boolean Handles FileNewDatabase.Action
			WindowMain.actionNewDatabase()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_0() As Boolean Handles FileRecent_0.Action
			WindowMain.actionConnect FileRecent.Item(0).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_1() As Boolean Handles FileRecent_1.Action
			WindowMain.actionConnect FileRecent.Item(1).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_10() As Boolean Handles FileRecent_10.Action
			WindowMain.actionConnect FileRecent.Item(10).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_11() As Boolean Handles FileRecent_11.Action
			WindowMain.actionConnect FileRecent.Item(11).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_12() As Boolean Handles FileRecent_12.Action
			WindowMain.actionConnect FileRecent.Item(12).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_13() As Boolean Handles FileRecent_13.Action
			WindowMain.actionConnect FileRecent.Item(13).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_14() As Boolean Handles FileRecent_14.Action
			WindowMain.actionConnect FileRecent.Item(14).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_15() As Boolean Handles FileRecent_15.Action
			WindowMain.actionConnect FileRecent.Item(15).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_2() As Boolean Handles FileRecent_2.Action
			WindowMain.actionConnect FileRecent.Item(2).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_3() As Boolean Handles FileRecent_3.Action
			WindowMain.actionConnect FileRecent.Item(3).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_4() As Boolean Handles FileRecent_4.Action
			WindowMain.actionConnect FileRecent.Item(4).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_5() As Boolean Handles FileRecent_5.Action
			WindowMain.actionConnect FileRecent.Item(5).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_6() As Boolean Handles FileRecent_6.Action
			WindowMain.actionConnect FileRecent.Item(6).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_7() As Boolean Handles FileRecent_7.Action
			WindowMain.actionConnect FileRecent.Item(7).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_8() As Boolean Handles FileRecent_8.Action
			WindowMain.actionConnect FileRecent.Item(8).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_9() As Boolean Handles FileRecent_9.Action
			WindowMain.actionConnect FileRecent.Item(9).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			WindowAbout.ShowModal()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpReleaseNotes() As Boolean Handles HelpReleaseNotes.Action
			WindowReleaseNotes.ShowModal()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpUpdate() As Boolean Handles HelpUpdate.Action
			ShowURL "https://www.zoclee.com/smartdata/download.php"
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddHistory(query As String)
		  Dim i As Integer
		  Dim history As new JSONItem("[]")
		  Dim tos As TextOutputStream
		  Dim queryHistory() As String
		  
		  if trim(query) <> "" then
		    
		    queryHistory = LoadQueryHistory()
		    
		    queryHistory.Insert(0, query)
		    
		    i = 1
		    while i <= queryHistory.Ubound
		      if queryHistory(i) = query then
		        queryHistory.Remove(i)
		      else
		        i = i + 1
		      end if
		    wend
		    
		    while queryHistory.Ubound >= 2000 
		      queryHistory.Remove(queryHistory.Ubound)
		    wend
		    
		    i = 0
		    while i <= queryHistory.Ubound
		      history.Append QueryHistory(i)
		      i = i + 1
		    wend
		    
		    tos = TextOutputStream.Create(DataFolder.Child("history.dat"))
		    tos.Write history.ToString()
		    tos.Close
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRecentFile(f As FolderItem)
		  Dim recentItem As new JSONItem("{}")
		  Dim dupLookup As new Dictionary
		  Dim i As Integer
		  Dim tmpStr As String
		  
		  recentItem.Value("path") = f.NativePath
		  Recent.Insert(0, recentItem)
		  
		  // remove duplicate items
		  
		  i = 0
		  while i < Recent.Count
		    tmpStr = Recent.Child(i).Value("path")
		    if dupLookup.HasKey(tmpStr) then
		      Recent.Remove(i)
		    else
		      dupLookup.Value(tmpStr) = 1
		      i = i + 1
		    end if
		  wend
		  
		  // limit recent items to 16 items
		  
		  while Recent.Count > 16
		    Recent.Remove (App.Recent.Count - 1)
		  wend
		  
		  SaveDataFile(Recent, DataFolder.Child("recent.dat"))
		  
		  LoadRecentFiles()
		  WindowMain.LoadRecentFiles()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadQueryHistory() As String()
		  Dim tis As TextInputStream
		  Dim tmpStr As String
		  Dim tmpItem As JSONItem
		  Dim i As Integer
		  Dim queryHistory() As String
		  
		  // load history
		  
		  if DataFolder.Child("history.dat").Exists then
		    
		    tis = TextInputStream.Open(DataFolder.Child("history.dat"))
		    tmpStr = tis.ReadAll()
		    tis.Close
		    
		    try
		      tmpItem = new JSONItem(tmpStr)
		      
		      i = 0
		      while i < tmpItem.Count
		        if Trim(tmpItem.Value(i)) <> "" then
		          QueryHistory.Append tmpItem.Value(i)
		        end if
		        i = i + 1
		      wend
		      
		    catch
		    end try
		    
		  end if
		  
		  return queryHistory
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRecentFiles()
		  Dim i As Integer
		  Dim mi As MenuItem
		  Dim recentItem As JSONItem
		  Dim f As FolderItem
		  Dim tmpStr As String
		  
		  while FileRecent.Count > 0 
		    FileRecent.Remove(0)
		  wend
		  
		  i = 0
		  while i < App.Recent.Count
		    
		    try
		      recentItem = App.Recent.Child(i)
		      tmpStr = recentItem.Value("path")
		      f = new FolderItem(tmpStr, FolderItem.PathTypeNative)
		      mi = new MenuItem
		      mi.Name = "FileRecent_" + Str(i)
		      mi.Text = f.Name
		      mi.Tag = f
		      FileRecent.Append mi
		    catch
		    end try
		    
		    i = i + 1
		  wend
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveQuery(index As Integer)
		  Dim i As Integer
		  Dim history As new JSONItem("[]")
		  Dim tos As TextOutputStream
		  Dim queryHistory() As String
		  
		  queryHistory = LoadQueryHistory()
		  
		  if (index >= 0) and (index <= queryHistory.Ubound) then
		    
		    queryHistory.Remove(index)
		    
		    i = 0
		    while i <= queryHistory.Ubound
		      history.Append QueryHistory(i)
		      i = i + 1
		    wend
		    
		    tos = TextOutputStream.Create(DataFolder.Child("history.dat"))
		    tos.Write history.ToString()
		    tos.Close
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveDataFile(data As JSONItem, file As FolderItem)
		  Dim tos As TextOutputStream
		  
		  tos = TextOutputStream.Create(file)
		  tos.Write data.ToString()
		  tos.Close
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CreateCancel As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CreateEncrypt As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CreateKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DataFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		mMutex As Mutex
	#tag EndProperty

	#tag Property, Flags = &h0
		Recent As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ReleaseDate As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Settings As JSONItem
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = PRODUCT_ID, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PRODUCT_NAME, Type = String, Dynamic = False, Default = \"SmartData", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ZAP_SERVER_URL, Type = Text, Dynamic = False, Default = \"www.zoclee.com/manage/", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CreateCancel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CreateEncrypt"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CreateKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
