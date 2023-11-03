#tag Window
Begin Window WindowImportCSV
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
   Title           =   "Import CSV"
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
      TabIndex        =   8
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
   Begin PushButton cmdImport
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Import"
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
      TabIndex        =   7
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
   Begin CheckBox chkHeader
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "First line is header"
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   196
   End
   Begin Listbox lstLines
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   1
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   233
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
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   108
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label lblLines
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
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "CSV Lines"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   85
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   196
   End
   Begin RadioButton radNewTable
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Import as new table"
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   196
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
      Left            =   228
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   51
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   242
   End
   Begin CheckBox chkOnlySelected
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Only import selected lines"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   357
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   304
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub DisplayPreview()
		  Dim colCount As Integer
		  Dim tmpArr() As String
		  Dim i As integer
		  Dim j As Integer
		  Dim colWidths() As String
		  Dim rowOffset As Integer
		  
		  lstLines.DeleteAllRows()
		  
		  if Lines.Ubound >= 0 then
		    
		    tmpArr = SplitCSV(Lines(0))
		    colCount = tmpArr.Ubound + 1
		    
		    rowOffset = 0
		    
		    // create new table
		    
		    Redim ColumnNames(-1)
		    
		    if chkHeader.Value then
		      
		      // first line contains column names
		      
		      i = 0
		      while i <= tmpArr.Ubound
		        ColumnNames.Append tmpArr(i)
		        i = i + 1
		      wend
		      rowOffset = 1
		      
		    else
		      
		      // unknown column names
		      
		      i = 0
		      while i < colCount
		        ColumnNames.Append "Column" + Str(i + 1)
		        i = i + 1
		      wend
		      rowOffset = 0
		      
		    end if
		    
		    // set up columns
		    
		    lstLines.ColumnCount = colCount
		    
		    i = 0
		    while i < colCount
		      colWidths.Append "100"
		      lstLines.Heading(i) = ColumnNames(i)
		      lstLines.ColumnSortDirection(i) = 0 // disable sorting by column
		      i = i + 1
		    wend
		    
		    lstLines.ColumnWidths = Join(colWidths, ",")
		    
		    // display first three rows
		    
		    i = rowOffset
		    while (i <= Lines.Ubound) 
		      
		      tmpArr = SplitCSV(Lines(i))
		      lstLines.AddRow tmpArr(0)
		      
		      j = 1 
		      while j <= tmpArr.Ubound
		        lstLines.Cell(lstLines.LastIndex, j) = tmpArr(j)
		        j = j + 1
		      wend
		      
		      i = i + 1
		    wend
		    
		  else
		    
		    lstLines.ColumnCount = 0
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrepTEXT(value As String) As String
		  Dim result As String
		  
		  result = ReplaceAll(value, "'", "''")
		  
		  return result
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ColumnNames() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCSVFile
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim tis As TextInputStream
			  Dim tmpStr As String
			  
			  mCSVFile = value
			  
			  tis = TextInputStream.Open(mCSVFile)
			  while not tis.EOF
			    tmpStr = Trim(tis.ReadLine())
			    //tmpStr = ConvertEncoding(tmpStr, Encodings.UTF8)
			    if tmpStr <> "" then
			      Lines.Append tmpStr
			    end if
			  wend
			  tis.Close
			  
			  DisplayPreview()
			  
			End Set
		#tag EndSetter
		CSVFile As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Lines() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCSVFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events cmdCancel
	#tag Event
		Sub Action()
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmdImport
	#tag Event
		Sub Action()
		  Dim tableName As String
		  Dim n As Integer
		  Dim i As Integer
		  Dim offset As Integer
		  Dim importLines() As String
		  
		  // create a new table
		  
		  // first make sure a table with the given name does not already exist
		  
		  tableName = Trim(txtTableName.Text)
		  
		  if tableName <> "" then
		    
		    if chkHeader.Value then
		      i = 1
		      offset = 1
		    else
		      i = 0
		      offset = 0
		    end if
		    if chkOnlySelected.Value then
		      while i <= Lines.Ubound
		        if lstLines.Selected(i - offset) then
		          importLines.Append Lines(i)
		        end if
		        i = i + 1
		      wend
		    else
		      while i <= Lines.Ubound
		        importLines.Append Lines(i)
		        i = i + 1
		      wend
		    end if
		    
		    if WindowMain.Connector.ImportCSV(tableName, ColumnNames, importLines) then
		      
		      WindowMain.SelectedTable = tableName
		      WindowMain.DisplayTree()
		      
		      'break // TODO: select table
		      
		      'i = 0
		      'while i < WindowMain.lstTree.ListCount
		      'if WindowMain.lstTree.List(i) = tableName then
		      'WindowMain.lstTree.ListIndex = i
		      'end if
		      'i = i + 1
		      'wend
		      
		      WindowMain.UpdateChanged()
		      
		      Self.Close()
		      
		    end if
		    
		  else
		    
		    n = MsgBox("Please provide a valid name for the table.", 48, "Import CSV")
		    txtTableName.SetFocus()
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkHeader
	#tag Event
		Sub Action()
		  DisplayPreview()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events radNewTable
	#tag Event
		Sub Action()
		  txtTableName.Visible = true
		  
		  
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
