#tag Window
Begin Window WindowExportCSV
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   320
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   320
   MinimizeButton  =   False
   MinWidth        =   300
   Placement       =   0
   Resizeable      =   True
   Title           =   "Export CSV"
   Visible         =   True
   Width           =   298
   Begin PushButton cmdCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   66
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   273
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton cmdExport
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Export"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   178
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   273
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox chkHeader
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Create header"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   170
   End
   Begin Listbox lstColumns
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "30"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   209
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   258
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  DisplayColumns()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DisplayColumns()
		  Dim i As Integer
		  
		  lstColumns.DeleteAllRows()
		  
		  // disable sorting
		  
		  lstColumns.ColumnSortDirection(0) = 0 
		  lstColumns.ColumnSortDirection(1) = 0
		  
		  lstColumns.ColumnType(0) = Listbox.TypeCheckbox
		  
		  if mData = nil then
		    
		    i = 0 
		    while i <= WindowMain.TableFieldName.Ubound
		      lstColumns.AddRow " "
		      lstColumns.Cell(lstColumns.LastIndex, 1) = WindowMain.TableFieldName(i)
		      lstColumns.CellCheck(lstColumns.LastIndex, 0) = true
		      lstColumns.RowTag(lstColumns.LastIndex) = i
		      i = i + 1
		    wend
		    
		  else
		    
		    i = 0 
		    while i < mData.ColumnCount
		      lstColumns.AddRow " "
		      lstColumns.Cell(lstColumns.LastIndex, 1) = mData.ColumnName(i)
		      lstColumns.CellCheck(lstColumns.LastIndex, 0) = true
		      lstColumns.RowTag(lstColumns.LastIndex) = i
		      i = i + 1
		    wend
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrepValue(value As String) As String
		  Dim result As String
		  Dim quoteValue As Boolean
		  Dim i As Integer
		  
		  result = value
		  quoteValue = false
		  
		  if InStr(0, result, ",") > 0 then
		    quoteValue = true
		  end if
		  
		  if InStr(0, result, """") > 0 then
		    result = ReplaceAll(result, """", """""")
		    quoteValue = true
		  end if
		  
		  i = 0
		  while (i <= 32) and not quoteValue 
		    if Instr(0, result, Chr(i)) > 0 then
		      quoteValue = true
		    end if
		    i = i + 1
		  wend
		  
		  if quoteValue then
		    result = """" + result + """"
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mData = value
			  
			  DisplayColumns()
			  
			End Set
		#tag EndSetter
		Data As SmartData.DataSet
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mData As SmartData.DataSet
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mQuery As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mQuery
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mQuery = value
			  
			  DisplayColumns()
			End Set
		#tag EndSetter
		Query As String
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events cmdCancel
	#tag Event
		Sub Action()
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmdExport
	#tag Event
		Sub Action()
		  Dim f As FolderItem
		  Dim dlg As new SaveAsDialog()
		  Dim tos As TextOutputStream
		  Dim lines() As String
		  Dim i As Integer
		  Dim columns() As String
		  Dim n As Integer
		  Dim csvType As New FileType
		  Dim allType As New FileType
		  
		  csvType.Name = "CSV Files"
		  csvType.MacType = "CSV"
		  csvType.MacCreator = "csv"
		  csvType.Extensions = "csv"
		  
		  allType.Name = "All Files"
		  allType.MacType = "*"
		  allType.MacCreator = "*"
		  allType.Extensions = "*"
		  
		  // generate column order
		  
		  Redim columns(-1)
		  i = 0
		  while i < lstColumns.ListCount
		    if lstColumns.CellCheck(i, 0) then
		      columns.Append lstColumns.Cell(i, 1)
		    end if
		    i = i + 1
		  wend
		  
		  if columns.Ubound >= 0 then
		    
		    dlg.Filter = csvType + allType
		    f = dlg.ShowModal()
		    
		    if f <> nil then
		      
		      tos = TextOutputStream.Create(f)
		      
		      if mData <> nil then
		        lines = mData.GetCSV(chkHeader.Value, columns)
		      else
		        lines = WindowMain.Connector.GetCSV(WindowMain.TableName, chkHeader.Value, columns, WindowMain.TableFilter)
		      end if
		      
		      i = 0
		      while i <= lines.Ubound
		        tos.WriteLine lines(i)
		        i = i + 1
		      wend
		      
		      tos.Close
		      
		      Self.Close()
		      
		    end if
		    
		  else
		    
		    n = MsgBox("No columns selected.", 16, "Export CSV")
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Query"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
