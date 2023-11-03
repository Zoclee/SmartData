#tag Window
Begin Window WindowChart
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   390
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   390
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "Chart"
   Visible         =   True
   Width           =   600
   Begin PagePanel pagChart
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   390
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin Listbox lstColumns
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   3
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
         Height          =   217
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "pagChart"
         InitialValue    =   ""
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   114
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   276
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton cmdPlot
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Plot"
         Default         =   False
         Enabled         =   True
         Height          =   27
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pagChart"
         Italic          =   False
         Left            =   196
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   343
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
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
         InitialParent   =   "pagChart"
         Italic          =   False
         Left            =   84
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   343
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Canvas canSmartData
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   1385885695
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pagChart"
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   179
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   146
      End
      Begin Label lblXAxis
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pagChart"
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
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "x-axis"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   20
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   44
      End
      Begin PopupMenu comXAxis
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pagChart"
         InitialValue    =   ""
         Italic          =   False
         Left            =   20
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   45
         Underline       =   False
         Visible         =   True
         Width           =   220
      End
      Begin Canvas canChart
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   False
         Height          =   335
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pagChart"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   600
      End
      Begin Label lblXAxis1
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pagChart"
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
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "y-axis"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   89
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   44
      End
      Begin Canvas canSmartData1
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   1385885695
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pagChart"
         Left            =   444
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   347
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   146
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Redim QualitativeColors(-1)
		  
		  QualitativeColors.Append &c4d4d4d
		  QualitativeColors.Append &c5da5da
		  QualitativeColors.Append &cfaa43a
		  QualitativeColors.Append &c60bd68
		  QualitativeColors.Append &cf17cb0
		  QualitativeColors.Append &cb2912f
		  QualitativeColors.Append &cb276b2
		  QualitativeColors.Append &cdecf3f
		  QualitativeColors.Append &cf15854
		  
		  DisplayColumns()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  PositionSmartData()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  PositionSmartData()
		  
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
		  
		  i = 0 
		  while i <= WindowMain.TableFieldName.Ubound
		    comXAxis.AddRow WindowMain.TableFieldName(i)
		    lstColumns.AddRow " "
		    lstColumns.Cell(lstColumns.LastIndex, 1) = WindowMain.TableFieldName(i)
		    lstColumns.CellCheck(lstColumns.LastIndex, 0) = false
		    lstColumns.RowTag(lstColumns.LastIndex) = i
		    i = i + 1
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PositionSmartData()
		  canSmartData.Left = (lstColumns.Left + lstColumns.Width) + (Self.Width - (lstColumns.Left + lstColumns.Width) - canSmartData.Width) / 2
		  canSmartData.Top = (Self.Height - canSmartData.Height) / 2
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Columns() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Data As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private QualitativeColors() As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		xMax As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		xMin As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		yMax As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		yMin As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events cmdPlot
	#tag Event
		Sub Action()
		  Dim i As Integer
		  Dim j As Integer
		  Dim n As Integer
		  Dim tmpArr() As String
		  Dim lines() As String
		  Dim lineData() As JSONItem
		  
		  if comXAxis.ListIndex >= 0 then
		    
		    // generate column order
		    
		    Redim columns(-1)
		    columns.Append comXAxis.List(comXAxis.ListIndex)
		    i = 0
		    while i < lstColumns.ListCount
		      if lstColumns.CellCheck(i, 0) then
		        columns.Append lstColumns.Cell(i, 1)
		      end if
		      i = i + 1
		    wend
		    
		    if columns.Ubound >= 1 then
		      
		      lines = WindowMain.Connector.GetCSV(WindowMain.TableName, false, columns, "")
		      
		      tmpArr = Split(Lines(0), ",")
		      xMin = Val(tmpArr(0))
		      xMax = xMin
		      yMin = Val(tmpArr(1))
		      yMax = yMin
		      
		      Data = new JSONItem("[]")
		      j = 0
		      while j <= tmpArr.Ubound
		        lineData.Append new JSONItem("[]")
		        Data.Append lineData(j)
		        j = j + 1
		      wend
		      
		      i = 0
		      while i <= Lines.Ubound
		        
		        tmpArr = Split(Lines(i), ",")
		        
		        if Val(tmpArr(0)) < xMin then
		          xMin = Val(tmpArr(0))
		        end if
		        if Val(tmpArr(0)) > xMax then
		          xMax = Val(tmpArr(0))
		        end if
		        lineData(0).Append Val(tmpArr(0))
		        
		        if tmpArr.Ubound <= lineData.Ubound then
		          j = 1
		          while (j <= tmpArr.Ubound) 
		            if Val(tmpArr(j)) < yMin then
		              yMin = Val(tmpArr(j))
		            end if
		            if Val(tmpArr(j)) > yMax then
		              yMax = Val(tmpArr(j))
		            end if
		            lineData(j).Append Val(tmpArr(j))
		            j = j + 1
		          wend
		        end if
		        
		        i = i + 1
		      wend
		      
		      pagChart.Value = 1
		      
		    else
		      
		      n = MsgBox("Please select the columns to plot.", 16, "Plot Chart")
		      
		    end if
		    
		  else
		    
		    n = MsgBox("Please select the column to be used for the x-axis.", 16, "Plot Chart")
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmdCancel
	#tag Event
		Sub Action()
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events canChart
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim i As Integer
		  Dim j As Integer
		  Dim blockX1 As Integer
		  Dim blockY1 As Integer
		  Dim blockX2 As Integer
		  Dim blockY2 As Integer
		  Dim chartX1 As Integer
		  Dim chartY1 As Integer
		  Dim chartX2 As Integer
		  Dim chartY2 As Integer
		  Dim xScale As Double
		  Dim yScale As Double
		  Dim prevX As Double
		  Dim prevY As Double
		  Dim nextX As Double
		  Dim nextY As Double
		  Dim scaleStep As Double
		  Dim scaleVal As Double
		  Dim tmpStr As String
		  Dim legendWidth As Integer
		  
		  g.ForeColor = &Cffffff
		  g.FillRect 0, 0, g.Width, g.Height
		  
		  g.TextFont = "Arial"
		  g.TextUnit = FontUnits.Pixel
		  g.TextSize = 12
		  
		  blockX1 = 10 + g.StringWidth(Str(xMax)) + 20
		  blockY1 = 10
		  blockX2 = g.Width - 10
		  blockY2 = g.Height - 10 - g.TextHeight - 10 - g.TextHeight
		  
		  // draw block
		  
		  g.ForeColor = &c000000
		  g.DrawRect blockX1, blockY1, blockX2 - blockX1 + 1, blockY2 - blockY1 + 2
		  
		  // draw x-axis name
		  
		  g.DrawString Columns(0), blockX1 + (blockX2 - blockX1 - g.StringWidth(Columns(0))) / 2, g.Height - 10 - g.TextHeight + g.TextAscent
		  
		  if Data.Count > 0 then
		    
		    if Data.Child(0).Count > 1 then
		      
		      if (xMax > xMin) and (yMax > yMin) then
		        
		        chartX1 = blockX1 + 10
		        chartX2 = blockX2 - 10
		        chartY1 = blockY1 + 10
		        chartY2 = blockY2 - 10
		        
		        xScale = (chartX2 - chartX1) / (xMax - xMin)
		        yScale = (chartY2 - chartY1) / (yMax - yMin) 
		        
		        // draw x-axis scale 
		        
		        scaleStep = Floor((yMax - yMin) / 4)
		        scaleVal = Floor(yMin)
		        while scaleVal < yMax
		          nextY = chartY1 + (yMax - scaleVal) * yScale
		          g.DrawLine blockX1 - 5, nextY, blockX1, nextY
		          tmpStr = Str(scaleVal)
		          g.DrawString tmpStr, blockX1 - 10 - g.StringWidth(tmpStr), nextY + g.TextAscent / 2
		          scaleVal = scaleVal + scaleStep
		        wend
		        
		        // draw y-axis scale
		        
		        scaleStep = Floor((xMax - xMin) / 4)
		        scaleVal = Floor(xMin)
		        while scaleVal < xMax
		          nextX = chartX1 + scaleVal * xScale
		          g.DrawLine nextX, blockY2, nextX, blockY2 + 5
		          tmpStr = Str(scaleVal)
		          g.DrawString tmpStr, nextX - g.StringWidth(tmpStr) / 2, blockY2 + 10 + g.TextAscent
		          scaleVal = scaleVal + scaleStep
		        wend
		        
		        // plot charts
		        
		        i = 1
		        while i < Data.Count
		          
		          g.ForeColor = QualitativeColors(i - 1 mod (QualitativeColors.Ubound + 1))
		          
		          prevX = chartX1 + Data.Child(0).Value(0) * xScale
		          prevY = chartY1 + (yMax - Data.Child(i).Value(0)) * yScale
		          
		          j = 1
		          while j < Data.Child(0).Count
		            
		            nextX = chartX1 + Data.Child(0).Value(j) * xScale
		            nextY = chartY1 + (yMax - Data.Child(i).Value(j)) * yScale
		            
		            g.DrawLine prevX, prevY, nextX, nextY
		            
		            prevX = nextX
		            prevY = nextY
		            
		            j = j + 1
		          wend 
		          
		          i = i + 1
		        wend
		        
		        if Columns.Ubound >= 1 then
		          
		          // legend
		          
		          legendWidth = g.StringWidth(Columns(1))
		          i = 2
		          while i <= Columns.Ubound
		            if g.StringWidth(Columns(i)) > legendWidth then
		              legendWidth = g.StringWidth(Columns(i))
		            end if
		            i = i + 1
		          wend
		          
		          g.ForeColor = &cffffff30
		          g.FillRect chartX1 + 5, chartY1 + 5, legendWidth + 10 + g.TextHeight, g.TextHeight * Columns.Ubound + 10
		          
		          i = 1
		          while i <= Columns.Ubound
		            g.ForeColor = QualitativeColors(i - 1 mod (QualitativeColors.Ubound + 1))
		            g.FillRect chartX1 + 10, chartY1 + 10 + g.TextHeight * (i - 1) + 2, g.TextHeight - 4, g.TextHeight - 4
		            
		            g.ForeColor = &c000000
		            g.DrawString Columns(i), chartX1 + 10 + g.TextHeight, chartY1 + 10 + g.TextHeight * (i - 1) + g.TextAscent
		            
		            i = i + 1
		          wend
		          
		        end if
		        
		      end if
		      
		    end if
		    
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
	#tag ViewProperty
		Name="xMax"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="xMin"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="yMax"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="yMin"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
#tag EndViewBehavior
