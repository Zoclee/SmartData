#tag Window
Begin Window WindowTable
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   False
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "Table"
   Visible         =   True
   Width           =   600
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
      Left            =   368
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   353
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton cmdApply
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
      Left            =   480
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   353
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Listbox lstTable
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   282
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Column	Type	Primary Key	Not Null	Unique	Default Value"
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   59
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton cmdAddColumn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Add Column"
      Default         =   False
      Enabled         =   True
      Height          =   27
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
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   353
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin Label lblTableName
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Table Name"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   87
   End
   Begin TextField txtTableName
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
      Left            =   119
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   19
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   461
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #If TargetCocoa
		    Const NSTitledWindowMask = 1
		    Const NSClosableWindowMask = 2
		    
		    Declare Sub setStyleMask Lib "Cocoa.framework" _
		    selector "setStyleMask:" (obj_id As Integer, mask As Integer)
		    
		    setStyleMask(Self.Handle, NSTitledWindowMask Or NSClosableWindowMask)
		  #EndIf
		  
		  mSchema = new JSONItem("{""name"":""Untitled"",""columns"":[]}")
		  DisplaySchema()
		  
		  txtTableName.SelStart = 0
		  txtTableName.SelLength = Len(txtTableName.Text)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub actionAddColumn()
		  Dim colName As String
		  Dim i As Integer
		  Dim j As Integer
		  Dim cols As JSONItem
		  Dim uniqueName As Boolean
		  Dim colItem As JSONItem
		  
		  cols = mSchema.Child("columns")
		  
		  uniqueName = false
		  i = 1
		  do 
		    
		    uniqueName = true
		    j = 0
		    while (j < cols.Count) and uniqueName
		      colItem = cols.Child(j)
		      if colItem.Value("name") = "Column" + Str(i) then
		        uniqueName = false
		      else
		        j = j + 1
		      end if
		    wend
		    
		    if uniqueName then
		      colName = "Column" + Str(i)
		    else
		      i = i + 1
		    end if
		    
		  loop until uniqueName
		  
		  colItem = new JSONItem("{""name"":""" + colName + """,""type"":""INTEGER"",""pk"":false,""nn"":false,""unique"":false,""default"":""""}")
		  
		  mSchema.Child("columns").Append colItem
		  
		  DisplaySchema()
		  
		  lstTable.EditCell(lstTable.LastIndex, 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionDeleteSelectedColumn()
		  Dim cols As JSONItem
		  Dim currentIndex As Integer
		  
		  cols = mSchema.Child("columns")
		  
		  if (lstTable.ListIndex >= 0) and (lstTable.ListIndex < cols.Count) then
		    currentIndex = lstTable.ListIndex
		    
		    cols.Remove(lstTable.ListIndex)
		    
		    DisplaySchema()
		    if currentIndex < lstTable.ListCount then
		      lstTable.ListIndex = currentIndex
		    else
		      lstTable.ListIndex = lstTable.ListCount -1
		    end
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionMoveSelectedColumnDown()
		  Dim cols As JSONItem
		  Dim currentIndex As Integer
		  Dim tmpItem As JSONItem
		  
		  cols = mSchema.Child("columns")
		  
		  if (lstTable.ListIndex >= 0) and (lstTable.ListIndex < cols.Count - 1) then
		    
		    currentIndex = lstTable.ListIndex
		    
		    tmpItem = cols.Child(lstTable.ListIndex + 1)
		    cols.Child(lstTable.ListIndex + 1) = cols.Child(lstTable.ListIndex)
		    cols.Child(lstTable.ListIndex) = tmpItem
		    
		    DisplaySchema()
		    lstTable.ListIndex = currentIndex + 1
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionMoveSelectedColumnUp()
		  Dim cols As JSONItem
		  Dim currentIndex As Integer
		  Dim tmpItem As JSONItem
		  
		  cols = mSchema.Child("columns")
		  
		  if (lstTable.ListIndex > 0) and (lstTable.ListIndex < cols.Count) then
		    
		    currentIndex = lstTable.ListIndex
		    
		    tmpItem = cols.Child(lstTable.ListIndex - 1)
		    cols.Child(lstTable.ListIndex - 1) = cols.Child(lstTable.ListIndex)
		    cols.Child(lstTable.ListIndex) = tmpItem
		    
		    DisplaySchema()
		    lstTable.ListIndex = currentIndex - 1
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplaySchema()
		  Dim cols As JSONItem
		  Dim colItem As JSONItem
		  Dim i As Integer
		  Dim colName As String
		  Dim colType As String
		  Dim colPK As Boolean
		  Dim colNotNull As Boolean
		  Dim colUnique As Boolean
		  Dim colDefault As String
		  
		  txtTableName.Text = mSchema.Value("name")
		  
		  cols = mSchema.Child("columns")
		  
		  lstTable.DeleteAllRows()
		  lstTable.ColumnSortDirection(0) = 0
		  lstTable.ColumnSortDirection(1) = 0
		  lstTable.ColumnSortDirection(2) = 0
		  lstTable.ColumnSortDirection(3) = 0
		  lstTable.ColumnSortDirection(4) = 0
		  lstTable.ColumnSortDirection(5) = 0
		  lstTable.ColumnType(0) = Listbox.TypeEditable
		  lstTable.ColumnType(2) = Listbox.TypeCheckbox
		  lstTable.ColumnType(3) = Listbox.TypeCheckbox
		  lstTable.ColumnType(4) = Listbox.TypeCheckbox
		  lstTable.ColumnType(5) = Listbox.TypeEditable
		  
		  i = 0
		  while i < cols.Count
		    
		    colItem = cols.Child(i)
		    colName = colItem.Value("name")
		    colType = colItem.Value("type")
		    colPK = colItem.Value("pk")
		    colNotNull = colItem.Value("nn")
		    colUnique = colItem.Value("unique")
		    colDefault = colItem.Value("default")
		    
		    lstTable.AddRow colName
		    lstTable.Cell(lstTable.LastIndex, 1) = colType
		    lstTable.CellCheck(lstTable.LastIndex, 2) = colPK
		    lstTable.CellCheck(lstTable.LastIndex, 3) = colNotNull
		    lstTable.CellCheck(lstTable.LastIndex, 4) = colUnique
		    lstTable.Cell(lstTable.LastIndex, 5) = colDefault
		    lstTable.RowTag(lstTable.LastIndex) = colItem
		    
		    i = i + 1
		  wend
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSchema As JSONItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSchema
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim cols As JSONItem
			  Dim i As Integer
			  
			  mSchema = value
			  mSchema.Value("currentname") = mSchema.Value("name")
			  
			  cols = mSchema.Lookup("columns", nil)
			  if cols <> nil then
			    i = 0
			    while i < cols.Count
			      cols.Child(i).Value("currentname") = cols.Child(i).Value("name")
			      i = i + 1
			    wend
			  end if
			  
			  cmdApply.Caption = "Update"
			  UpdateTable = true
			  
			  DisplaySchema()
			  
			End Set
		#tag EndSetter
		Schema As JSONItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		UpdateTable As Boolean = False
	#tag EndProperty


#tag EndWindowCode

#tag Events cmdCancel
	#tag Event
		Sub Action()
		  Self.Close()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmdApply
	#tag Event
		Sub Action()
		  Dim n As Integer
		  Dim i As Integer
		  Dim foundTable As Boolean
		  Dim foundError As Boolean
		  
		  foundError = false
		  
		  if Trim(txtTableName.Text) = "" then
		    
		    n = MsgBox( "Table name is not optional.", 16, "Create Table")
		    txtTableName.Text = ""
		    txtTableName.SetFocus()
		    
		  elseif lstTable.ListCount < 1 then
		    
		    n = MsgBox( "Table columns are not optional.", 16, "Create Table")
		    
		  else
		    
		    mSchema.Value("name") = Trim(txtTableName.Text)
		    
		    if UpdateTable then
		      
		      if WindowMain.Connector.UpdateTable(mSchema) then
		        
		        WindowMain.DisplayTree()
		        
		        i = 0
		        foundTable = false
		        while (i < WindowMain.lstTree.ListCount) and (not foundTable)
		          if WindowMain.lstTree.List(i) = mSchema.Value("name") then
		            WindowMain.lstTree.ListIndex = i
		            foundTable = true
		          else
		            i = i + 1
		          end if
		        wend
		        
		        WindowMain.UpdateChanged()
		        
		        Self.Close()
		        
		      end if
		      
		    else
		      
		      if WindowMain.Connector.CreateTable(mSchema) then
		        
		        WindowMain.DisplayTree()
		        
		        i = 0
		        foundTable = false
		        while (i < WindowMain.lstTree.ListCount) and (not foundTable)
		          if WindowMain.lstTree.List(i) = mSchema.Value("name") then
		            WindowMain.lstTree.ListIndex = i
		            foundTable = true
		          else
		            i = i + 1
		          end if
		        wend
		        
		        WindowMain.UpdateChanged()
		        
		        Self.Close()
		        
		      end if
		      
		    end if
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstTable
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Dim column As Integer
		  Dim row As Integer
		  Dim base As MenuItem
		  Dim mi As MenuItem
		  Dim hitItem As MenuItem
		  Dim colItem As JSONItem
		  
		  column = Me.ColumnFromXY(x, y)
		  
		  if column = 1 then
		    
		    row = Me.RowFromXY(x, y)
		    
		    if (row >= 0) and (row < Me.ListCount) then
		      
		      colItem = Me.RowTag(row)
		      
		      
		      
		      base = new MenuItem()
		      
		      mi = new MenuItem()
		      mi.Name = "mnuBlob"
		      mi.Text = "BLOB"
		      base.Append mi
		      
		      mi = new MenuItem()
		      mi.Name = "mnuInteger"
		      mi.Text = "INTEGER"
		      base.Append mi
		      
		      mi = new MenuItem()
		      mi.Name = "mnuReal"
		      mi.Text = "REAL"
		      base.Append mi
		      
		      mi = new MenuItem()
		      mi.Name = "mnuText"
		      mi.Text = "TEXT"
		      base.Append mi
		      
		      hitItem = base.PopUp()
		      
		      if hitItem <> nil then
		        
		        colItem.Value("type") = hitItem.Text
		        DisplaySchema()
		        
		      end if
		      
		      return true
		      
		    end if
		    
		  end if
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Dim colItem As JSONItem
		  Dim tmpStr As String
		  
		  if (row >= 0) and (row < Me.ListCount) then
		    
		    colItem = Me.RowTag(row)
		    
		    
		    select case column
		      
		    case 0 // column name
		      tmpStr = lstTable.Cell(row, column)
		      colItem.Value("name") = tmpStr
		      
		    case 2 // primary key
		      colItem.Value("pk") = lstTable.CellCheck(row, column)
		      
		    case 3 // not null
		      colItem.Value("nn") = lstTable.CellCheck(row, column)
		      
		    case 4 // unique
		      colItem.Value("unique") = lstTable.CellCheck(row, column)
		      
		    case 5 // default value
		      tmpStr = lstTable.Cell(row, column)
		      colItem.Value("default") = tmpStr
		      
		    end select
		    
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  select case Asc(key)
		    
		  case 127
		    actionDeleteSelectedColumn()
		    
		  end select
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim mi As MenuItem
		  
		  mi = new MenuItem()
		  mi.Name = "mnuDelete"
		  mi.Text = "Delete"
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSep1"
		  mi.Text = "-"
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuMoveUp"
		  mi.Text = "Move Up"
		  if lstTable.ListIndex <= 0 then
		    mi.Enabled = false
		  end if
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuMoveDown"
		  mi.Text = "Move Down"
		  if (lstTable.ListIndex < 0) or (lstTable.ListIndex >= (lstTable.ListCount - 1)) then
		    mi.Enabled = false
		  end if
		  base.Append mi
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  select case hitItem.Name
		    
		  case "mnuDelete"
		    actionDeleteSelectedColumn()
		    
		  case "mnuMoveDown"
		    actionMoveSelectedColumnDown()
		    
		  case "mnuMoveUp"
		    actionMoveSelectedColumnUp()
		    
		  end select
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cmdAddColumn
	#tag Event
		Sub Action()
		  actionAddColumn()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtTableName
	#tag Event
		Sub TextChange()
		  mSchema.Value("name") = Trim(txtTableName.Text)
		  
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
		Name="UpdateTable"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
