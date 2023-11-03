#tag Window
Begin Window WindowQueryResult
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Query Results"
   Visible         =   True
   Width           =   600
   Begin Listbox lstRows
      AutoDeactivate  =   True
      AutoHideScrollbars=   False
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   23
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   2
      GridLinesVertical=   2
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   400
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub actionExportCSV()
		  WindowExportCSV.Data = mData
		  WindowExportCSV.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionExportJSON()
		  WindowExportJSON.Data = mData
		  WindowExportJSON.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayResult(data As SmartData.DataSet)
		  Dim i As Integer
		  Dim j As Integer
		  Dim colWidths() As String
		  Dim tmpPic As new Picture(1, 1)
		  Dim tmpWidth As Integer
		  
		  mData = data
		  
		  lstRows.DeleteAllRows()
		  lstRows.ScrollBarVertical = false
		  
		  if data.RowCount = 1 then
		    Self.Title = "Query Results [1 row]"
		  else
		    Self.Title = "Query Results [" + Str(data.RowCount) + " rows]"
		  end if
		  
		  // create headings
		  
		  lstRows.ColumnCount = data.ColumnCount
		  i = 0
		  while i < data.ColumnCount
		    lstRows.Heading(i) = data.ColumnName(i) '+" : " + rs.Field("type").StringValue
		    lstRows.ColumnType(i) = Listbox.TypeEditable
		    colWidths.Append "100"
		    i = i + 1
		  wend
		  
		  lstRows.ColumnWidths = Join(colWidths, ",")
		  
		  // populate rows
		  
		  i = 0
		  while i < data.RowCount
		    
		    lstRows.AddRow(data.Rows(i).Value(0).Value)
		    j = 1
		    while j < data.ColumnCount
		      lstRows.Cell(lstRows.LastIndex, j) = data.Rows(i).Value(j).Value
		      lstRows.CellTag(lstRows.LastIndex, j) = data.Rows(i).Value(j).Value
		      j = j + 1
		    wend
		    
		    i = i + 1
		  wend
		  
		  i = 0
		  while i < lstRows.ListCount
		    j = 0
		    while j < lstRows.ColumnCount
		      tmpWidth = tmpPic.Graphics.StringWidth(lstRows.Cell(i, j))
		      if not IsNumeric(lstRows.Cell(i, j)) then
		        tmpWidth = tmpWidth * 1.2
		      end if
		      if tmpWidth > lstRows.Width * 0.35 then
		        tmpWidth = lstRows.Width * 0.35
		      end if
		      if tmpWidth > Val(colWidths(j)) then
		        colWidths(j) = Str(tmpWidth)
		      end if
		      j = j + 1
		    wend
		    i = i + 1
		  wend
		  
		  lstRows.ColumnWidths = Join(colWidths, ",")
		  lstRows.ScrollBarVertical = true
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mData As SmartData.DataSet
	#tag EndProperty


#tag EndWindowCode

#tag Events lstRows
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim mi As MenuItem
		  Dim submi As MenuItem
		  
		  // Export
		  
		  mi = new MenuItem()
		  mi.Name = "mnuExport"
		  mi.Text = "Export"
		  
		  // Export -> CSV
		  
		  submi = new MenuItem()
		  submi.Name = "mnuExportCSV"
		  submi.Text = "CSV"
		  mi.Append submi
		  
		  // Export -> JSON
		  
		  submi = new MenuItem()
		  submi.Name = "mnuExportJSON"
		  submi.Text = "JSON"
		  mi.Append submi
		  
		  base.Append mi
		  
		  'mi = new MenuItem()
		  'mi.Name = "mnuExportCSV"
		  'mi.Text = "Export CSV"
		  'base.Append mi
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  select case hitItem.Name
		    
		  case "mnuExportCSV"
		    actionExportCSV()
		    
		  case "mnuExportJSON"
		    actionExportJSON()
		    
		  end select
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  if IsContextualClick and  me.Selected(me.RowFromXY(x, y)) then
		    return True
		  end if
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  lstRows.Cell(row, column) = lstRows.CellTag(row, column)
		  
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
