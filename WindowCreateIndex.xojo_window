#tag Window
Begin Window WindowCreateIndex
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   386
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
   Title           =   "Create Index"
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
      Top             =   339
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton cmdCreate
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Create"
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
      Top             =   339
      Underline       =   False
      Visible         =   True
      Width           =   100
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
      Height          =   206
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
      Top             =   63
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   258
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lblTable
      AutoDeactivate  =   True
      Bold            =   False
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
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Table"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin PopupMenu comTable
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   82
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   19
      Underline       =   False
      Visible         =   True
      Width           =   196
   End
   Begin Label lblIndexName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Index Name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   281
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   85
   End
   Begin TextField txtIndexName
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   305
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   258
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  DisplayTables()
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DisplayColumns()
		  Dim i As Integer
		  Dim tableItem As JSONItem
		  
		  lstColumns.DeleteAllRows()
		  
		  if comTable.ListIndex >= 0 then
		    
		    // disable sorting
		    
		    lstColumns.ColumnSortDirection(0) = 0 
		    lstColumns.ColumnSortDirection(1) = 0
		    
		    lstColumns.ColumnType(0) = Listbox.TypeCheckbox
		    
		    tableItem = comTable.RowTag(comTable.ListIndex)
		    
		    i = 0 
		    while i < tableItem.Child("columns").Count
		      lstColumns.AddRow " "
		      lstColumns.Cell(lstColumns.LastIndex, 1) = tableItem.Child("columns").Child(i).Value("name")
		      lstColumns.CellCheck(lstColumns.LastIndex, 0) = false
		      lstColumns.RowTag(lstColumns.LastIndex) = i
		      i = i + 1
		    wend
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayTables()
		  Dim currentIndex As Integer
		  Dim i As Integer
		  Dim tableItem As JSONItem
		  Dim tableName As String
		  Dim itemType As String
		  Dim selectedTable As String
		  
		  selectedTable = ""
		  if WindowMain.lstTree.ListIndex >= 0 then
		    itemType = WindowMain.lstTree.RowTag(WindowMain.lstTree.ListIndex)
		    if itemType = "table" then
		      selectedTable = WindowMain.lstTree.List(WindowMain.lstTree.ListIndex)
		    end if 
		  end if
		  
		  currentIndex = -1
		  i = 0
		  while i < WindowMain.Connector.TableCount
		    tableItem = WindowMain.Connector.Table(i)
		    tableName = tableItem.Value("name")
		    comTable.AddRow tableName
		    comTable.RowTag(comTable.ListCount - 1) = tableItem
		    if tableName = selectedTable then
		      currentIndex = comTable.ListCount - 1
		    end if
		    i = i + 1
		  wend
		  
		  if currentIndex >= 0 then
		    comTable.ListIndex = currentIndex
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIndexName()
		  Dim indexName As String
		  Dim i As Integer
		  
		  indexName = ""
		  
		  if comTable.ListIndex >= 0 then
		    indexName = comTable.List(comTable.ListIndex)
		    
		    i = 0
		    while i < lstColumns.ListCount
		      if lstColumns.CellCheck(i, 0) then
		        indexName = indexName + "_" + lstColumns.Cell(i, 1)
		      end if
		      i = i + 1
		    wend
		    
		  end if
		  
		  txtIndexName.Text = indexName
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events cmdCancel
	#tag Event
		Sub Action()
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmdCreate
	#tag Event
		Sub Action()
		  Dim i As Integer
		  Dim columns() As String
		  Dim n As Integer
		  
		  Redim columns(-1)
		  i = 0
		  while i < lstColumns.ListCount
		    if lstColumns.CellCheck(i, 0) then
		      columns.Append lstColumns.Cell(i, 1)
		    end if
		    i = i + 1
		  wend
		  
		  if columns.Ubound >= 0 then
		    
		    if WindowMain.Connector.CreateIndex(comTable.List(comTable.ListIndex), columns, trim(txtIndexName.Text)) then
		      
		      WindowMain.DisplayTree()
		      
		      WindowMain.UpdateChanged()
		      
		      Self.Close()
		      
		    end if
		    
		  else
		    
		    n = MsgBox("No columns selected.", 16, "Create Index")
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstColumns
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  SetIndexName()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events comTable
	#tag Event
		Sub Change()
		  DisplayColumns()
		  
		  SetIndexName()
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
