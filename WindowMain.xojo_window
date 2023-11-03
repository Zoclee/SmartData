#tag Window
Begin Window WindowMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   946911231
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "SmartData"
   Visible         =   True
   Width           =   600
   Begin Listbox lstTree
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   264
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
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
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox lstRows
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
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
      Height          =   232
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   205
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   False
      SelectionType   =   1
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   32
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   377
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas canQueryToolbar
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   40
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   268
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   False
      Width           =   200
   End
   Begin AppToolbar tbarMain
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Visible         =   True
   End
   Begin TextField txtRowFilter
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Row Filter"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   205
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   119
   End
   Begin ScrollBar scrollRows
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   232
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   583
      LineStep        =   1
      LiveScroll      =   False
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   32
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   17
   End
   Begin Label lblQueryResult
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   417
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0 rows affected"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   288
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   165
   End
   Begin Timer tmrColumnWidths
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Label lblRowCount
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
      Left            =   460
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0 rows"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   120
   End
   Begin Canvas canSmartData
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   1385885695
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   248
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   276
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   False
      Width           =   146
   End
   Begin SyntaxEditor txtQuery
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      ColorScheme     =   ""
      CommentColor    =   &c00000000
      CursorColor     =   &c00000000
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      FunctionColor   =   &c00000000
      HasBackColor    =   False
      HasSelection    =   False
      Height          =   88
      HelpTag         =   ""
      HighlightColor  =   &c00000000
      HighlightTextColor=   &c00000000
      Index           =   -2147483648
      InitialParent   =   ""
      KeywordColor    =   &c00000000
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      NumberColor     =   &c00000000
      OperatorColor   =   &c00000000
      Scope           =   0
      SelectedHighlightColor=   &c00000000
      SelectedHighlightTextColor=   &c00000000
      Source          =   ""
      StringColor     =   &c00000000
      SymbolColor     =   &c00000000
      Syntax          =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Top             =   312
      Transparent     =   True
      TypeColor       =   &c00000000
      UseFocusRing    =   False
      Visible         =   False
      Width           =   600
   End
   Begin PushButton cmdRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   327
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  Dim n As Integer
		  Dim result As Boolean
		  
		  result = false
		  
		  if Connector <> nil then
		    
		    if Connector.DataChanged then
		      
		      n = MsgBox("You have unsaved changes." + EndOfLine + "Do you want to save these changes?", 51, "Unsaved Changes")
		      
		      if n = 6 then // Yes
		        Connector.Commit()
		        Connector.Close()
		        
		      elseif n = 2 then // Cancel
		        result = true
		        
		      elseif n = 7 then // No
		        Connector.Rollback()
		        Connector.Close()
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  if not result then
		    UpdateWindowSettings()
		  end if
		  
		  return result
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  actionConnect obj.FolderItem
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  PrevMouseX = X
		  PrevMouseY = Y
		  
		  if (X > (lstTree.Left + lstTree.Width - 1)) and (X < lstRows.Left) then
		    
		    DragMode = DragModeEnum.TableWidth
		    return true
		    
		  elseif (Y > (lstTree.Top + lstTree.Height - 1)) and (Y < txtQuery.Top) then
		    
		    DragMode = DragModeEnum.QueryHeight
		    return true
		    
		  else
		    
		    DragMode = DragModeEnum.None
		    return false
		    
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if (PrevMouseY <> Y) or (PrevMouseX <> X) then
		    
		    select case DragMode
		      
		    case DragModeEnum.QueryHeight
		      
		      if ((lstTree.Height - (PrevMouseY - Y)) > 100) and _
		        ((txtQuery.Height + (PrevMouseY - Y)) > 120) then
		        
		        SetTablesHeight(lstTree.Height - (PrevMouseY - Y))
		        
		        PrevMouseX = X
		        PrevMouseY = Y
		        
		      end if
		      
		    case DragModeEnum.TableWidth
		      
		      if ((lstTree.Width + (X - PrevMouseX)) > 75) and _
		        ((lstRows.Width + (PrevMouseX - X)) > 320) then
		        
		        SetTablesWidth(lstTree.Width + (X - PrevMouseX))
		        
		        PrevMouseX = X
		        PrevMouseY = Y
		        
		      end if
		      
		    end select
		    
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  if (X > (lstTree.Left + lstTree.Width - 1)) and (X < lstRows.Left) then
		    
		    Self.MouseCursor = System.Cursors.ArrowEastWest
		    
		  elseif (Y > (lstTree.Top + lstTree.Height - 1)) and (Y < txtQuery.Top) and ((X < canQueryToolbar.Left) or (X > (canQueryToolbar.Left + canQueryToolbar.Width))) then
		    
		    Self.MouseCursor = System.Cursors.ArrowNorthSouth
		    
		  else
		    
		    Self.MouseCursor = System.Cursors.StandardPointer
		    
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  select case DragMode
		    
		  case DragModeEnum.QueryHeight
		    UpdateWindowSettings()
		    
		  case DragModeEnum.TableWidth
		    UpdateWindowSettings()
		    
		  end select
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim cmdItems() As String
		  Dim dbFile As FolderItem
		  Dim winLeft As Integer
		  Dim winTop As Integer
		  Dim winWidth As Integer
		  Dim winHeight As Integer
		  
		  #if Target64Bit then
		    Self.Title = "SmartData 64-bit v" + Str(App.MajorVersion) + "." +Str(App.MinorVersion) + "." +Str(App.BugVersion)
		  #else
		    Self.Title = "SmartData 32-bit v" + Str(App.MajorVersion) + "." +Str(App.MinorVersion) + "." +Str(App.BugVersion)
		  #endif 
		  
		  winLeft = App.Settings.Lookup("left", -1)
		  winTop = App.Settings.Lookup("top", -1)
		  winWidth = App.Settings.Lookup("width", -1)
		  winHeight = App.Settings.Lookup("height", -1)
		  
		  if (winLeft >= 0) and (winTop >= 0) and (winWidth > 0) and (winHeight > 0) then
		    
		    if winHeight > Screen(0).AvailableHeight then
		      winHeight = Screen(0).AvailableHeight
		    end if
		    
		    #if TargetWin32 then
		      
		      if (winHeight >= (Screen(0).AvailableHeight * 0.8)) and (winWidth >= (Screen(0).AvailableWidth)) then
		        Self.Maximize
		      else
		        Self.Width = winWidth
		        Self.Height = winHeight
		        Self.Left = winLeft
		        Self.Top = winTop
		      end if
		      
		    #else
		      
		      Self.Width = winWidth
		      Self.Height = winHeight
		      Self.Left = winLeft
		      Self.Top = winTop
		      
		    #endif
		    
		  end if
		  
		  SetTablesWidth(App.Settings.Lookup("tableswidth", -1))
		  SetTablesHeight(App.Settings.Lookup("tablesheight", -1))
		  
		  CalibrateLayout()
		  
		  canSmartData.Top = (Self.Height - canSmartData.Height) /2
		  canSmartData.Left = (Self.Width - canSmartData.Width) / 2
		  canSmartData.Visible = true
		  
		  select case App.Settings.Lookup("colorscheme", "defaultlight")
		  case "defaultdark"
		    txtQuery.ColorScheme = SyntaxEditor.ColorSchemeEnum.DefaultDark
		  case "defaultlight"
		    txtQuery.ColorScheme = SyntaxEditor.ColorSchemeEnum.DefaultLight
		  case "none"
		    txtQuery.ColorScheme = SyntaxEditor.ColorSchemeEnum.None
		  case else
		    txtQuery.ColorScheme = SyntaxEditor.ColorSchemeEnum.DefaultLight
		  end select
		  
		  LoadRecentFiles()
		  
		  Self.AcceptFileDrop(DropFileTypes.All)
		  
		  // parse command line
		  
		  #if TargetWindows then
		    
		    cmdItems = parseCommandline()
		    
		    if cmdItems.Ubound >= 1 then
		      dbFile = new FolderItem(cmdItems(1), FolderItem.PathTypeNative)
		      actionConnect(dbFile)
		    end if
		    
		  #endif
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  CalibrateLayout()
		  
		  if Connector <> nil then
		    canSmartData.Top = lstTree.Top +( lstTree.Height - canSmartData.Height) /2
		    canSmartData.Left = lstTree.Width + (Self.Width - lstTree.Width - canSmartData.Width) / 2
		  else
		    canSmartData.Top = (Self.Height - canSmartData.Height) /2
		    canSmartData.Left = (Self.Width - canSmartData.Width) / 2
		  end if
		  
		  DisplayPage()
		  
		  CurrentWindowWidth = Self.Width
		  CurrentWindowHeight = Self.Height
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  CalibrateLayout()
		  
		  if Connector <> nil then
		    canSmartData.Top = lstTree.Top +( lstTree.Height - canSmartData.Height) /2
		    canSmartData.Left = lstTree.Width + (Self.Width - lstTree.Width - canSmartData.Width) / 2
		  else
		    canSmartData.Top = (Self.Height - canSmartData.Height) /2
		    canSmartData.Left = (Self.Width - canSmartData.Width) / 2
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  if (Self.Width >= CurrentWindowWidth * 0.9) and (Self.Height >= CurrentWindowHeight * 0.9) then
		    Self.Width = Self.MinWidth
		    Self.Height = Self.MinHeight
		    Self.Invalidate(false)
		  end if
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditAppkEditClear() As Boolean Handles EditAppkEditClear.Action
			select case self.Focus.Name
			
			case "_WindowMain._wrapper_txtQuery"
			txtQuery.Delete()
			
			end select
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCopy() As Boolean Handles EditCopy.Action
			select case self.Focus.Name
			
			case "_WindowMain._wrapper_txtQuery"
			txtQuery.Copy()
			
			end select
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCut() As Boolean Handles EditCut.Action
			select case self.Focus.Name
			
			case "_WindowMain._wrapper_txtQuery"
			txtQuery.Cut()
			
			end select
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditPaste() As Boolean Handles EditPaste.Action
			select case self.Focus.Name
			
			case "_WindowMain._wrapper_txtQuery"
			txtQuery.Paste()
			
			end select
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileConnect() As Boolean Handles FileConnect.Action
			actionConnect()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewDatabase() As Boolean Handles FileNewDatabase.Action
			actionNewDatabase()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_0() As Boolean Handles FileRecent_0.Action
			actionConnect FileRecent.Item(0).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_1() As Boolean Handles FileRecent_1.Action
			actionConnect FileRecent.Item(1).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_10() As Boolean Handles FileRecent_10.Action
			actionConnect FileRecent.Item(10).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_11() As Boolean Handles FileRecent_11.Action
			actionConnect FileRecent.Item(11).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_12() As Boolean Handles FileRecent_12.Action
			actionConnect FileRecent.Item(12).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_13() As Boolean Handles FileRecent_13.Action
			actionConnect FileRecent.Item(13).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_14() As Boolean Handles FileRecent_14.Action
			actionConnect FileRecent.Item(14).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_15() As Boolean Handles FileRecent_15.Action
			actionConnect FileRecent.Item(15).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_2() As Boolean Handles FileRecent_2.Action
			actionConnect FileRecent.Item(2).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_3() As Boolean Handles FileRecent_3.Action
			actionConnect FileRecent.Item(3).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_4() As Boolean Handles FileRecent_4.Action
			actionConnect FileRecent.Item(4).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_5() As Boolean Handles FileRecent_5.Action
			actionConnect FileRecent.Item(5).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_6() As Boolean Handles FileRecent_6.Action
			actionConnect FileRecent.Item(6).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_7() As Boolean Handles FileRecent_7.Action
			actionConnect FileRecent.Item(7).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_8() As Boolean Handles FileRecent_8.Action
			actionConnect FileRecent.Item(8).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRecent_9() As Boolean Handles FileRecent_9.Action
			actionConnect FileRecent.Item(9).Tag
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRollback() As Boolean Handles FileRollback.Action
			actionRollback()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
			actionCommit()
			
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
		Sub actionChart()
		  WindowChart.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionCloseConnection()
		  if Connector <> nil then
		    Connector.Close()
		    Connector = nil
		  end if
		  
		  lstTree.Visible = false
		  lstTree.DeleteAllRows()
		  txtRowFilter.Visible = false
		  cmdRefresh.Visible = false
		  lblRowCount.Visible = false
		  lstRows.Visible = false
		  lstRows.DeleteAllRows()
		  canQueryToolbar.Visible = false
		  lblQueryResult.Visible = false
		  txtQuery.Visible = false
		  
		  canSmartData.Top = (Self.Height - canSmartData.Height) /2
		  canSmartData.Left = (Self.Width - canSmartData.Width) / 2
		  canSmartData.Visible = true
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionCommit()
		  if Connector <> nil then
		    
		    Connector.Commit()
		    Connector.BeginTransaction()
		    
		    FileSave.AutoEnable = false
		    FileRollback.AutoEnable = false
		    tbarMain.toolCommit.Enabled = false
		    tbarMain.toolRollback.Enabled = false
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionConnect(dbFile As FolderItem = nil, encKey As String = "")
		  Dim f As FolderItem
		  Dim dlg As new OpenDialog()
		  Dim n As Integer
		  Dim openDB As Boolean
		  Dim sqliteType As New FileType
		  Dim allType As New FileType
		  Dim dbType As New FileType
		  
		  sqliteType.Name = "SQLite Database Files"
		  sqliteType.MacType = "SQLITE"
		  sqliteType.MacCreator = "sqlite"
		  sqliteType.Extensions = "sqlite"
		  
		  dbType.Name = "Database Files"
		  dbType.MacType = "DB"
		  dbType.MacCreator = "db"
		  dbType.Extensions = "db"
		  
		  allType.Name = "All Files"
		  allType.MacType = "*"
		  allType.MacCreator = "*"
		  allType.Extensions = "*"
		  
		  mColumnLayout = new Dictionary()
		  
		  #if Target64Bit then
		    Self.Title = "SmartData 64-bit v" + Str(App.MajorVersion) + "." +Str(App.MinorVersion) + "." +Str(App.BugVersion)
		  #else
		    Self.Title = "SmartData 32-bit v" + Str(App.MajorVersion) + "." +Str(App.MinorVersion) + "." +Str(App.BugVersion)
		  #endif 
		  
		  openDB = true
		  
		  if Connector <> nil then 
		    
		    if Connector.DataChanged then
		      
		      openDB = false
		      
		      n = MsgBox("You have unsaved changes." + EndOfLine + "Do you want to save these changes?", 51, "Unsaved Changes")
		      
		      if n = 6 then // Yes
		        Connector.Commit()
		        Connector.Close()
		        openDB = true
		        
		      elseif n = 2 then // Cancel
		        openDB = false
		        
		      elseif n = 7 then // No
		        Connector.Rollback()
		        Connector.Close()
		        openDB = true
		        
		      end if
		      
		    else
		      Connector.Close()
		      
		    end if
		    
		  end if
		  
		  if openDB then
		    
		    actionCloseConnection()
		    
		    if dbFile <> nil then
		      f = dbFile
		    else
		      dlg.Filter = allType + sqliteType + dbType
		      f = dlg.ShowModal()
		    end if
		    
		    if f <> nil then
		      
		      Connector = new SmartData.SQLiteConnector(f, encKey)
		      
		      if Connector.Connected then
		        
		        App.AddRecentFile f
		        
		        #if Target64Bit then
		          Self.Title = "SmartData 64-bit v" + Str(App.MajorVersion) + "." +Str(App.MinorVersion) + "." +Str(App.BugVersion) + " - [" + f.NativePath + "]"
		        #else
		          Self.Title = "SmartData 32-bit v" + Str(App.MajorVersion) + "." +Str(App.MinorVersion) + "." +Str(App.BugVersion) + " - [" + f.NativePath + "]"
		        #endif 
		        
		        Connector.BeginTransaction()
		        
		        TablesExpanded = true
		        IndicesExpanded = false
		        
		        DisplayTree()
		        
		        txtQuery.Source = ""
		        
		      else
		        
		        if Connector.ErrorCode = 1 then // authentication failed
		          Connector = nil
		          WindowOpenDatabase.DatabaseFile = f
		          WindowOpenDatabase.ShowModal()
		        else
		          Connector = nil
		        end if
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  if Connector <> nil then
		    canSmartData.Top = lstTree.Top + (lstTree.Height - canSmartData.Height) /2
		    canSmartData.Left = lstTree.Width + (Self.Width - lstTree.Width - canSmartData.Width) / 2
		  else
		    canSmartData.Top = (Self.Height - canSmartData.Height) /2
		    canSmartData.Left = (Self.Width - canSmartData.Width) / 2
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionCopySQL()
		  txtQuery.Copy()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionCreateIndex()
		  WindowCreateIndex.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionCreateTable()
		  WindowTable.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionCutSQL()
		  txtQuery.Cut()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionDelete()
		  Dim itemName As String
		  Dim itemType As String
		  
		  if Connector <> nil then
		    
		    if lstTree.ListIndex >= 0 then
		      
		      itemType = lstTree.RowTag(lstTree.ListIndex)
		      
		      select case itemType
		        
		      case "index"
		        
		        itemName = lstTree.List(lstTree.ListIndex)
		        
		        if Connector.DeleteIndex(itemName) then
		          UpdateChanged()
		          DisplayTree()
		        end if
		        
		      case "table"
		        
		        itemName = lstTree.List(lstTree.ListIndex)
		        
		        if Connector.DeleteTable(itemName) then
		          UpdateChanged()
		          DisplayTree()
		        end if
		        
		      end select
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionDeleteSelectedRows()
		  if Connector <> nil then
		    
		    if (lstTree.ListIndex >= 0) and (lstTree.ListIndex < lstTree.ListCount) then
		      
		      if Connector.SelectedRowCount > 0 then
		        
		        Connector.DeleteSelectedRows()
		        UpdateChanged()
		        
		        SetSelectedTable()
		        DisplayTree()
		        SelectedTable = ""
		        
		      end if
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionDeleteSQL()
		  txtQuery.Delete()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionEditSelectedTable()
		  Dim n As Integer
		  Dim tableItem As JSONItem
		  
		  if lstTree.ListIndex >= 0 then
		    
		    if Connector <> nil then
		      
		      if not Connector.DataChanged then
		        
		        if lstTree.RowTag(lstTree.ListIndex) = "table" then
		          
		          tableItem = Connector.Table(lstTree.List(lstTree.ListIndex))
		          
		          WindowTable.Schema = tableItem
		          WindowTable.ShowModal()
		          
		        end if
		        
		      else
		        
		        n = MsgBox("You first need to commit or rollback the current changes before you can edit the table.", 64, "Edit Table")
		        
		      end if
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionExportCSV()
		  
		  WindowExportCSV.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionExportJSON()
		  WindowExportJSON.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionHistory()
		  WindowQueryHistory.Show()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionImportCSV()
		  Dim dlg As new OpenDialog
		  Dim f As FolderItem
		  
		  f = dlg.ShowModal()
		  
		  if f <> nil then
		    WindowImportCSV.CSVFile = f
		    WindowImportCSV.ShowModal()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionInsertRow()
		  Dim tableName As String
		  Dim i As Integer
		  
		  if Connector <> nil then
		    
		    if (lstTree.ListIndex >= 0) and (lstTree.ListIndex < lstTree.ListCount) then
		      
		      if lstRows.ColumnCount >= 1 then
		        
		        tableName = lstTree.List(lstTree.ListIndex)
		        
		        if Connector.InsertRow(tableName) then
		          UpdateChanged()
		          BlockPageRefresh = true
		          DisplaySelectedTable(-1, 0, true)
		          BlockPageRefresh = false
		          if VisibleRows < TableRows then
		            scrollRows.Value = scrollRows.Maximum - (VisibleRows \ 2)
		            i = lstRows.ListCount - 1
		            while (i > 0) and (lstRows.RowTag(i) = nil)
		              i = i - 1
		            wend
		            lstRows.ListIndex = i
		          else
		            DisplayPage()
		            lstRows.ListIndex = TableRows - 1
		          end if
		          lstRows.SetFocus()
		        end if
		        
		      end if
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionNewDatabase()
		  Dim createDB As Boolean
		  Dim n As Integer
		  Dim f As FolderItem
		  Dim dlg As new SaveAsDialog()
		  Dim db As SQLiteDatabase
		  Dim sqliteType As New FileType
		  Dim dbType As New FileType
		  Dim allType As New FileType
		  
		  sqliteType.Name = "SQLite Database Files"
		  sqliteType.MacType = "SQLITE"
		  sqliteType.MacCreator = "sqlite"
		  sqliteType.Extensions = "sqlite"
		  
		  dbType.Name = "Database Files"
		  dbType.MacType = "DB"
		  dbType.MacCreator = "db"
		  dbType.Extensions = "db"
		  
		  allType.Name = "All Files"
		  allType.MacType = "*"
		  allType.MacCreator = "*"
		  allType.Extensions = "*"
		  
		  createDB = true
		  
		  if Connector <> nil then 
		    
		    if Connector.DataChanged then
		      
		      createDB = false
		      
		      n = MsgBox("You have unsaved changes." + EndOfLine + "Do you want to save these changes?", 51, "Unsaved Changes")
		      
		      if n = 6 then // Yes
		        Connector.Commit()
		        Connector.Close()
		        createDB = true
		        
		      elseif n = 2 then // Cancel
		        createDB = false
		        
		      elseif n = 7 then // No
		        Connector.Rollback()
		        Connector.Close()
		        createDB = true
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  if createDB then
		    
		    actionCloseConnection()
		    
		    App.CreateCancel = true
		    WindowCreateDatabase.ShowModal()
		    
		    if not App.CreateCancel then
		      
		      dlg.Filter = dbType + sqliteType + allType
		      f = dlg.ShowModal()
		      
		      if f <> nil then
		        
		        if WindowMain.Connector <> nil then 
		          WindowMain.Connector.Close()
		        end if
		        
		        if f.Exists then
		          f.Delete()
		        end if
		        
		        db = New SQLiteDatabase()
		        db.DatabaseFile = f
		        
		        if App.CreateEncrypt then
		          db.EncryptionKey = App.CreateKey
		        end if
		        
		        if db.CreateDatabaseFile then
		          
		          db.Close
		          WindowMain.actionConnect(f, App.CreateKey)
		          
		        else
		          n = MsgBox("Error: " + db.ErrorMessage, 16, "Create Database")
		        end if
		        
		      end if
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionOpenSQLFile()
		  Dim dlg as new OpenDialog
		  Dim f as FolderItem
		  Dim tis As TextInputStream
		  Dim sql As String
		  
		  f = dlg.ShowModal()
		  
		  if f <> nil then
		    
		    tis = TextInputStream.Open(f)
		    sql  = tis.ReadAll()
		    tis.Close
		    
		    txtQuery.Source = sql
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionPasteSQL()
		  txtQuery.Paste()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionRollback()
		  if Connector <> nil then
		    
		    Connector.Rollback()
		    Connector.BeginTransaction()
		    
		    FileSave.AutoEnable = false
		    FileRollback.AutoEnable = false
		    tbarMain.toolCommit.Enabled = false
		    tbarMain.toolRollback.Enabled = false
		    
		    SetSelectedTable()
		    DisplayTree()
		    SelectedTable = ""
		    
		    lblQueryResult.Text = "0 rows affected"
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionRunQuery()
		  Dim queryArr() As String
		  Dim query As String
		  Dim i As Integer
		  Dim changed As Boolean
		  Dim currentTableIndex As Integer
		  Dim currentFilter As String
		  Dim result As SmartData.DataSet
		  Dim resultWindow As WindowQueryResult
		  
		  if Connector <> nil then
		    
		    query = Trim(txtQuery.Source)
		    
		    if query <> "" then
		      
		      App.AddHistory(query)
		      
		      queryArr = SplitQueries(query)
		      
		      changed = false
		      
		      i = 0
		      while i <= queryArr.Ubound
		        
		        if Trim(queryArr(i)) <> "" then
		          
		          result = Connector.Execute(queryArr(i))
		          
		          if (Connector.RowsAffected > 0) or (Instr(0, queryArr(i), "create") > 0) or (Instr(0, queryArr(i), "drop") > 0) then
		            changed = true
		          end if
		          
		          if Connector.RowsAffected = 1 then 
		            lblQueryResult.Text = "1 row affected"
		          else
		            lblQueryResult.Text = Str(Connector.RowsAffected) + " rows affected"
		          end if
		          
		          if result.RowCount > 0 then
		            resultWindow = new WindowQueryResult()
		            resultWindow.Show()
		            resultWindow.DisplayResult result
		          end if
		          
		        end if
		        
		        i = i + 1
		      wend
		      
		      if changed then
		        currentTableIndex = lstTree.ListIndex
		        currentFilter = txtRowFilter.Text
		        
		        SetSelectedTable()
		        DisplayTree()
		        SelectedTable = ""
		        
		        txtRowFilter.Text = currentFilter
		        UpdateChanged()
		      end if
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionSQLDump()
		  WindowSQLDump.ShowModal()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub actionSwitchColorScheme()
		  txtQuery.NextColorScheme()
		  
		  select case txtQuery.ColorScheme
		  case SyntaxEditor.ColorSchemeEnum.DefaultDark
		    App.Settings.Value("colorscheme") = "defaultdark"
		  case SyntaxEditor.ColorSchemeEnum.DefaultLight
		    App.Settings.Value("colorscheme") = "defaultlight"
		  case SyntaxEditor.ColorSchemeEnum.None
		    App.Settings.Value("colorscheme") = "none"
		  case else
		    App.Settings.Value("colorscheme") = "defaultlight"
		  end select
		  App.SaveDataFile(App.Settings, App.DataFolder.Child("settings.dat"))
		  
		  txtQuery.SetFocus()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalibrateLayout()
		  if Self.Width - lstTree.Width < 155 then
		    lstTree.Width = self.Width - 155
		    lstRows.Left = lstTree.Left + lstTree.Width +5
		    txtRowFilter.Left = lstRows.Left
		    lstRows.Width = self.Width - lstRows.Left - scrollRows.Width
		  end if
		  
		  canQueryToolbar.Top = lstTree.Height + 4
		  canQueryToolbar.Left = (Self.Width - canQueryToolbar.Width) / 2
		  txtQuery.Top = canQueryToolbar.Top + canQueryToolbar.Height + 4
		  txtQuery.Height = self.Height - txtQuery.Top
		  lblQueryResult.Top = txtQuery.Top - 24
		  
		  canQueryToolbar.Refresh()
		  
		  if lstTree.Height <100 then
		    SetTablesHeight 100
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayPage(onlyLastRow As Boolean = false)
		  Dim i As Integer
		  Dim j As Integer
		  Dim rows() As SmartData.Row
		  
		  if not BlockPageRefresh then
		    
		    if not onlyLastRow then
		      lstRows.DeleteAllRows()
		    end if
		    
		    if Connector <> nil then
		      
		      if lstTree.ListIndex >= 0 then
		        
		        VisibleRows = Floor(lstRows.Height / lstRows.RowHeight) - 1
		        
		        rows = Connector.GetPage(TableName, scrollRows.Value, VisibleRows, TableFilter, OrderByColumn, OrderDesc)
		        
		        if onlyLastRow then
		          i = rows.Ubound
		        else
		          i = 0
		        end if
		        while i <= rows.Ubound
		          
		          if rows(i).Value(0).IsNull then
		            lstRows.AddRow("NULL")
		          elseif rows(i).Value(0).IsBinary then
		            lstRows.AddRow("BLOB")
		          else
		            lstRows.AddRow(rows(i).Value(0).Value)
		          end if
		          lstRows.CellTag(lstRows.LastIndex, 0) = rows(i).Value(0)
		          
		          j = 1
		          while j <= rows(i).Value.Ubound
		            if rows(i).Value(j).IsNull then
		              lstRows.Cell(lstRows.LastIndex, j) = "NULL"
		            elseif rows(i).Value(j).IsBinary then
		              lstRows.Cell(lstRows.LastIndex, j) = "BLOB"
		            else
		              lstRows.Cell(lstRows.LastIndex, j) = rows(i).Value(j).Value
		            end if
		            lstRows.CellTag(lstRows.LastIndex, j) = rows(i).Value(j)
		            j = j + 1
		          wend
		          
		          lstRows.RowTag(lstRows.LastIndex) = rows(i).RowIndex //rs.Field("rowid").Int64Value
		          lstRows.Selected(lstRows.LastIndex) = Connector.RowSelected(rows(i).RowIndex)
		          
		          i = i + 1
		        wend
		        
		      end if
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplaySelectedTable(currentListIndex As Integer = -1, currentScrollPosition As Integer = 0, clearRowFilter As Boolean = false)
		  Dim i As Integer
		  Dim j As Integer
		  Dim colInfo As JSONItem
		  Dim colWidths() As String
		  Dim filterText As String
		  Dim tmpPic As new Picture(1, 1)
		  Dim tmpWidth As Integer
		  Dim tableItem As JSONItem
		  Dim itemType As String
		  
		  tbarMain.toolChart.Enabled = false
		  
		  Redim TableFieldName(-1)
		  Redim TableFieldType(-1)
		  
		  BlockColumnUpdates = true
		  
		  tmpPic.Graphics.TextFont = lstRows.TextFont
		  tmpPic.Graphics.TextUnit = lstRows.TextUnit
		  tmpPic.Graphics.TextSize = lstRows.TextSize
		  
		  BlockScrollChange = true
		  scrollRows.Value = 0
		  BlockScrollChange = false
		  
		  if clearRowFilter then
		    txtRowFilter.Text = ""
		  end if
		  
		  tbarMain.toolInsertRow.Enabled = false
		  
		  lstRows.DeleteAllRows()
		  
		  if lstTree.ListIndex >= 0 then
		    
		    itemType = lstTree.RowTag(lstTree.ListIndex)
		    
		    if itemType = "table" then
		      
		      tbarMain.toolChart.Enabled = true
		      
		      TableFilter = ""
		      filterText = Trim(txtRowFilter.Text)
		      
		      // create headings
		      
		      //tableItem = lstTree.RowTag(lstTree.ListIndex)
		      tableItem = Connector.Table(lstTree.List(lstTree.ListIndex))
		      TableName = tableItem.Value("name")
		      Redim TableFieldName(-1)
		      Redim TableFieldType(-1)
		      
		      i = 0
		      lstRows.ColumnCount = tableItem.Child("columns").Count
		      while i < tableItem.Child("columns").Count
		        
		        colInfo = tableItem.Child("columns").Child(i)
		        
		        if filterText <> "" then
		          
		          if TableFilter <> "" then
		            TableFilter = TableFilter + " OR "
		          end if
		          
		          TableFilter = TableFilter + "([" + colInfo.Value("name") + "] LIKE '%" + filterText + "%')"
		          
		        end if
		        
		        lstRows.Heading(i) = colInfo.Value("name") +" : " + colInfo.Value("type")
		        //lstRows.ColumnSortDirection(i) = 0
		        if colInfo.Value("type") <> "BLOB" then
		          lstRows.ColumnType(i) = Listbox.TypeEditable
		        end if
		        
		        lstRows.ColumnTag(i) = colInfo
		        TableFieldName.Append colInfo.Value("name")
		        TableFieldType.Append colInfo.Value("type")
		        
		        colWidths.Append "150"
		        
		        i = i + 1
		      wend
		      
		      // populate rows
		      
		      if TableFieldName.Ubound >= 0 then
		        
		        // first we get the row count
		        TableRows = Connector.RowCount(TableName)
		        
		        if TableRows = 1 then
		          lblRowCount.Text = "1 row"
		        else
		          lblRowCount.Text = Str(TableRows) + " rows"
		        end if 
		        
		        VisibleRows = Floor(lstRows.Height / lstRows.RowHeight) - 1
		        
		        if TableRows > VisibleRows then
		          scrollRows.Maximum = TableRows - 1
		          scrollRows.LineStep = 1
		          scrollRows.PageStep = VisibleRows - 1
		          scrollRows.Enabled = true
		        else
		          scrollRows.Enabled = false
		        end if
		        
		        DisplayPage()
		        
		        canSmartData.Visible = false
		        lstRows.Visible = true
		        lblRowCount.Visible = true
		        scrollRows.Visible = true
		        txtRowFilter.Visible = true
		        cmdRefresh.Visible = true
		        
		      end if
		      
		      // determine column widths
		      
		      if mColumnLayout.HasKey(TableName) then
		        lstRows.ColumnWidths = mColumnLayout.Value(TableName)
		      else
		        
		        i = 0
		        while i <lstRows.ListCount
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
		        mColumnLayout.Value(TableName) = lstRows.ColumnWidths
		        
		      end if
		      
		      tbarMain.toolInsertRow.Enabled = true
		      
		    else
		      
		      lstRows.Visible = false
		      lblRowCount.Visible = false
		      scrollRows.Visible = false
		      txtRowFilter.Visible = false
		      txtRowFilter.Text = ""
		      cmdRefresh.Visible = false
		      canSmartData.Visible = true
		      
		    end if
		    
		  else
		    
		    lstRows.Visible = false
		    lblRowCount.Visible = false
		    scrollRows.Visible = false
		    txtRowFilter.Visible = false
		    txtRowFilter.Text = ""
		    cmdRefresh.Visible = false
		    canSmartData.Visible = true
		    
		  end if
		  
		  if currentListIndex < lstRows.ListCount then
		    lstRows.ListIndex = currentListIndex 
		    lstRows.ScrollPosition = currentScrollPosition
		  end if
		  
		  BlockColumnUpdates = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayTree()
		  Dim hideTree As Boolean
		  
		  lstTree.DeleteAllRows()
		  tbarMain.toolCreateTable.Enabled = false
		  tbarMain.toolChart.Enabled = false
		  
		  hideTree = true
		  
		  if Connector <> nil then
		    
		    if Connector.Connected then
		      
		      lstTree.Visible = true
		      txtQuery.Visible = true
		      lblQueryResult.Visible = true
		      canQueryToolbar.Visible = true
		      
		      lstTree.AddFolder Connector.DatabaseName + " : " + Connector.ConnectionType
		      lstTree.RowTag(lstTree.LastIndex) = "database"
		      lstTree.Expanded(lstTree.LastIndex) = true
		      
		      tbarMain.toolCreateTable.Enabled = true
		      
		      hideTree = false
		      
		    end if
		    
		  end if
		  
		  if hideTree then
		    
		    lstTree.Visible = false
		    txtQuery.Visible = false
		    lblQueryResult.Visible = false
		    canQueryToolbar.Visible = false
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRecentFiles()
		  Dim i As Integer
		  Dim mi As MenuItem
		  Dim recentItem As JSONItem
		  Dim f As FolderItem
		  Dim tmpStr As String
		  Dim button As ToolButton
		  Dim dropMenu As New MenuItem
		  
		  // File menu
		  
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
		  
		  // Toolbar Menu
		  
		  mi = new MenuItem()
		  mi.Name = "toolBrowseExisting"
		  mi.Text = "Browse Existing"
		  dropMenu.Append(mi)
		  
		  if App.Recent.Count > 0 then
		    
		    mi = new MenuItem
		    mi.Name = "toolRecentSep1"
		    mi.Text = "-"
		    dropMenu.Append mi
		    
		    i = 0
		    while i < App.Recent.Count
		      
		      try
		        recentItem = App.Recent.Child(i)
		        tmpStr = recentItem.Value("path")
		        f = new FolderItem(tmpStr, FolderItem.PathTypeNative)
		        mi = new MenuItem
		        mi.Name = "toolRecent_" + Str(i)
		        mi.Text = f.Name
		        mi.Tag = f
		        
		        dropMenu.Append mi
		      catch
		      end try
		      
		      i = i + 1
		    wend
		    
		  end if
		  
		  button = tbarMain.toolConnect
		  button.DropDownMenu = dropMenu
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function parseCommandline() As String()
		  Dim result() As String
		  Dim mb As MemoryBlock
		  Dim i As Integer
		  Dim strFlag As Boolean
		  Dim item As String
		  Dim ch As String
		  
		  mb = System.Commandline
		  strFlag = false
		  i = 0
		  item = ""
		  while i < mb.Size
		    
		    ch = mb.StringValue(i, 1)
		    
		    if strFlag then
		      
		      if ch = """" then
		        strFlag = false
		        if Trim(item) <> "" then
		          result.Append Trim(item)
		        end if
		        item = ""
		      else
		        item = item + ch
		      end if
		      
		    else
		      
		      select case ch
		      case " "
		        if Trim(item) <> "" then
		          result.Append Trim(item)
		        end if
		        item = ""
		      case """"
		        strFlag = true
		        
		      case else
		        item = item + ch
		        
		      end select
		      
		    end if
		    
		    i = i + 1
		  wend
		  
		  if Trim(item) <> "" then
		    result.Append Trim(item)
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSelectedTable()
		  SelectedTable = ""
		  
		  if lstTree.ListIndex > 0 then
		    if lstTree.RowTag(lstTree.ListIndex) = "table"  then
		      SelectedTable = lstTree.List(lstTree.ListIndex)
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTablesHeight(h As Integer)
		  if (h >= 100) and ((Self.Height - h - 4 - canQueryToolbar.Height - 4) > 120) then
		    
		    lstTree.Height = h
		    
		    canSmartData.Top = lstTree.Top + (lstTree.Height - canSmartData.Height) /2
		    
		    lstRows.Height = lstTree.Height - 32
		    scrollRows.Height = lstRows.Height
		    
		    
		    canQueryToolbar.Top = lstTree.Height + 4
		    
		    txtQuery.Top = canQueryToolbar.Top + canQueryToolbar.Height + 4
		    txtQuery.Height = self.Height - txtQuery.Top
		    lblQueryResult.Top = txtQuery.Top - 24
		    
		    lstTree.Refresh()
		    lstRows.Refresh()
		    scrollRows.Refresh()
		    canQueryToolbar.Refresh()
		    txtQuery.Refresh()
		    lblQueryResult.Refresh()
		    
		    VisibleRows = Floor(lstRows.Height / lstRows.RowHeight) - 1
		    DisplayPage()
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTablesWidth(w As Integer)
		  if (w > 100) and ((Self.Width - w - 5) > 100) then
		    
		    lstTree.Width = w
		    lstRows.Left = lstTree.Width + 5
		    txtRowFilter.Left = lstRows.Left
		    cmdRefresh.Left = txtRowFilter.Left + txtRowFilter.Width + 4
		    lstRows.Width = Self.Width - lstRows.Left - scrollRows.Width
		    
		    lstTree.Refresh()
		    lstRows.Refresh()
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateChanged()
		  FileSave.AutoEnable = true
		  FileRollback.AutoEnable = true
		  tbarMain.toolCommit.Enabled = true
		  tbarMain.toolRollback.Enabled = true
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateWindowSettings()
		  if (Self.Width > 0) and (Self.Height > 0) then
		    App.Settings.Value("left") = Self.Left
		    App.Settings.Value("top") = Self.Top
		    App.Settings.Value("width") = Self.Width
		    App.Settings.Value("height") = Self.Height
		    App.Settings.Value("tablesheight") = lstTree.Height
		    App.Settings.Value("tableswidth") = lstTree.Width
		    App.SaveDataFile(App.Settings, App.DataFolder.Child("settings.dat"))
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WasDoubleClick(X As Integer, Y As Integer) As Boolean
		  Dim doubleClickTime as Integer
		  
		  #if TargetCocoa then
		    doubleClickTime=30
		  #elseif TargetCarbon then
		    #if not TargetMachO then
		      Declare Function GetDblTime Lib "CarbonLib" () as Integer
		      doubleClickTime = GetDblTime()
		    #else
		      Declare Function GetDblTime Lib "Carbon" () as Integer
		      doubleClickTime = GetDblTime()
		    #endif
		  #elseif TargetMacOS then
		    Declare Function GetDblTime Lib "InterfaceLib" () as Integer
		    doubleClickTime = GetDblTime()
		  #elseif TargetWin32 then
		    Declare Function GetDoubleClickTime Lib "User32.DLL" () as Integer
		    doubleClickTime = GetDoubleClickTime() / 1000 * 60
		  #else
		    doubleClickTime=30
		  #endif
		  
		  if ((Ticks - mLastClickTicks) <= doubleClickTime) and (Sqrt((mLastClickX - X)^2 + (mLastClickY - Y)^2) <= 5) then
		    mLastClickX = -1
		    mLastClickY = -1
		    return true
		  end if
		  
		  mLastClickTicks = Ticks
		  mLastClickX = X
		  mLastClickY = Y
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ApplyBlobData As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		BlobData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		BlockColumnUpdates As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		BlockPageRefresh As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		BlockScrollChange As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CellColumn As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CellRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CellValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Connector As SmartData.Connector
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentWindowHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentWindowWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		DragMode As DragModeEnum
	#tag EndProperty

	#tag Property, Flags = &h0
		FirstActivation As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		IndicesExpanded As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		mColumnLayout As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastClickTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastClickX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastClickY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		OrderByColumn As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OrderDesc As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		PrevMouseX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PrevMouseY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		QueryToolbarIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedTable As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TableFieldName() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TableFieldType() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TableFilter As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TableName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TableRowQuery As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TableRows As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		TablesExpanded As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		VisibleRows As Integer
	#tag EndProperty


	#tag Enum, Name = DragModeEnum, Type = Integer, Flags = &h0
		None
		  TableWidth
		QueryHeight
	#tag EndEnum


#tag EndWindowCode

#tag Events lstTree
	#tag Event
		Sub Change()
		  OrderByColumn = ""
		  OrderDesc = false
		  DisplaySelectedTable(-1, 0, true)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  select case hitItem.Name
		    
		  case "mnuCreateIndex"
		    actionCreateIndex()
		    
		  case "mnuCreateTable"
		    actionCreateTable()
		    
		  case "mnuDelete"
		    actionDelete()
		    
		  case "mnuEditTable"
		    actionEditSelectedTable()
		    
		  case "mnuExportCSV"
		    actionExportCSV()
		    
		  case "mnuExportJSON"
		    actionExportJSON()
		    
		  case "mnuImportCSV"
		    actionImportCSV()
		    
		  case "mnuSQLDump"
		    actionSQLDump()
		    
		  end select
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim mi As MenuItem
		  Dim submi As MenuItem
		  Dim tableSelected As Boolean
		  Dim indexSelected As Boolean
		  
		  tableSelected = false
		  if (lstTree.ListIndex >= 0) and (lstTree.ListIndex <  lstTree.ListCount) then
		    
		    if lstTree.RowTag(lstTree.ListIndex) = "table" then
		      tableSelected = true
		    end if
		    
		    if lstTree.RowTag(lstTree.ListIndex) = "index" then
		      indexSelected = true
		    end if
		    
		  end if
		  
		  // Delete
		  
		  mi = new MenuItem()
		  mi.Name = "mnuDelete"
		  mi.Text = "Delete"
		  mi.Enabled = tableSelected or indexSelected
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSep1"
		  mi.Text = "-"
		  base.Append mi
		  
		  // Create Table
		  
		  mi = new MenuItem()
		  mi.Name = "mnuCreateTable"
		  mi.Text = "Create Table"
		  base.Append mi
		  
		  // Edit Table
		  
		  mi = new MenuItem()
		  mi.Name = "mnuEditTable"
		  mi.Text = "Edit Table"
		  mi.Enabled = tableSelected
		  base.Append mi
		  
		  // Create Index
		  
		  mi = new MenuItem()
		  mi.Name = "mnuCreateIndex"
		  mi.Text = "Create Index"
		  base.Append mi
		  
		  // -----
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSep2"
		  mi.Text = "-"
		  base.Append mi
		  
		  // Export
		  
		  mi = new MenuItem()
		  mi.Name = "mnuExport"
		  mi.Text = "Export"
		  mi.Enabled = tableSelected
		  
		  // Export -> CSV
		  
		  submi = new MenuItem()
		  submi.Name = "mnuExportCSV"
		  submi.Text = "CSV"
		  submi.Enabled = tableSelected
		  mi.Append submi
		  
		  // Export -> JSON
		  
		  submi = new MenuItem()
		  submi.Name = "mnuExportJSON"
		  submi.Text = "JSON"
		  submi.Enabled = tableSelected
		  mi.Append submi
		  
		  base.Append mi
		  
		  'mi = new MenuItem()
		  'mi.Name = "mnuExportCSV"
		  'mi.Text = "Export CSV"
		  'mi.Enabled = tableSelected
		  'base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuImportCSV"
		  mi.Text = "Import CSV"
		  base.Append mi
		  
		  // -----
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSep3"
		  mi.Text = "-"
		  base.Append mi
		  
		  // SQL Dump
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSQLDump"
		  mi.Text = "SQL Dump"
		  base.Append mi
		  
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  select case Asc(Key)
		    
		  case 127
		    actionDelete()
		    
		  end select
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  if IsContextualClick and me.Selected(me.RowFromXY(x, y)) then
		    return True
		  end if
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  'Dim tableName As String
		  'Dim newName As String
		  'Dim tableItem As JSONItem
		  '
		  'if App.LicenseOK then
		  '
		  'if (Connector <> nil) and (row >= 0) and (row < lstTree.ListCount) then
		  '
		  'newName = lstTree.Cell(row, column)
		  '
		  'tableItem = lstTree.RowTag(row)
		  '
		  'tableName = tableItem.Value("name")
		  '
		  'if Connector.RenameTable(tableName, newName) then
		  'UpdateChanged()
		  'DisplayTree(row)
		  'end if
		  '
		  'end if
		  '
		  'end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim itemType As String
		  Dim i As Integer
		  Dim tableItem As JSONItem
		  Dim tableName As String
		  Dim indexItem As JSONItem
		  Dim indexName As String
		  Dim currentIndex As Integer
		  
		  itemType = lstTree.RowTag(row)
		  
		  select case itemType
		    
		  case "database"
		    Me.AddFolder "Tables"
		    Me.RowTag(Me.LastIndex) = "tables"
		    Me.Expanded(Me.LastIndex) = TablesExpanded
		    
		    Me.AddFolder "Indices"
		    Me.RowTag(Me.LastIndex) = "indices"
		    Me.Expanded(Me.LastIndex) = IndicesExpanded
		    
		  case "indices"
		    currentIndex = -1
		    i = 0
		    while i < Connector.IndexCount
		      indexItem = Connector.Index(i)
		      indexName = indexItem.Value("name")
		      Me.AddRow indexName
		      Me.RowTag(Me.LastIndex) = "index"
		      'if indexName = SelectedIndex then
		      'currentIndex = Me.LastIndex
		      'end if
		      i = i + 1
		    wend
		    'if currentIndex >= 0 then
		    'Me.ListIndex = currentIndex
		    'end if
		    IndicesExpanded = true
		    
		  case "tables"
		    
		    currentIndex = -1
		    i = 0
		    while i < Connector.TableCount
		      tableItem = Connector.Table(i)
		      tableName = tableItem.Value("name")
		      Me.AddRow tableName
		      Me.RowTag(Me.LastIndex) = "table"
		      if tableName = SelectedTable then
		        currentIndex = Me.LastIndex
		      end if
		      i = i + 1
		    wend
		    
		    if currentIndex >= 0 then
		      Me.ListIndex = currentIndex
		    end if
		    
		    TablesExpanded = true
		    
		  end select
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub CollapseRow(row As Integer)
		  Dim itemType As String
		  
		  itemType = lstTree.RowTag(row)
		  
		  select case itemType
		    
		  case "indices"
		    IndicesExpanded = false
		    
		  case "tables"
		    TablesExpanded = false
		    
		  end select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstRows
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim i As Integer
		  
		  select case Asc(Key)
		    
		  case 1 // Ctrl+A
		    if Connector <> nil then
		      Connector.SelectAllRows()
		      i = 0
		      while i < lstRows.ListCount
		        lstRows.Selected(i) = true
		        i = i + 1
		      wend
		    end if
		    return true
		    
		  case 11 // page up
		    if scrollRows.Enabled then
		      if (scrollRows.Value - scrollRows.PageStep) > 0 then
		        scrollRows.Value = scrollRows.Value - scrollRows.PageStep
		      else
		        scrollRows.Value = 0
		      end if
		    end if
		    return true
		    
		  case 12 // page down
		    if scrollRows.Enabled then
		      if (scrollRows.Value + scrollRows.PageStep)  < scrollRows.Maximum then
		        scrollRows.Value = scrollRows.Value +  scrollRows.PageStep
		      else
		        scrollRows.Value = scrollRows.Maximum
		      end if
		    end if
		    return true
		    
		  case 30 // up arrow
		    if scrollRows.Enabled then
		      if scrollRows.Value > 0 then
		        scrollRows.Value = scrollRows.Value - 1
		      end if
		    end if
		    return true
		    
		  case 31 // down arrow
		    if scrollRows.Enabled then
		      if scrollRows.Value < scrollRows.Maximum then
		        scrollRows.Value = scrollRows.Value + 1
		      end if
		    end if
		    return true
		    
		  case 127
		    actionDeleteSelectedRows()
		    
		    'case else
		    'MsgBox str(asc(key))
		    
		  end select
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Dim preserveSelection As Boolean
		  Dim i As Integer
		  Dim lastRowIndex As Integer
		  Dim addRow As Boolean
		  
		  if IsContextualClick and Me.Selected(me.RowFromXY(x, y)) then
		    return True
		  end if
		  
		  CellRow = lstRows.RowFromXY(x, y)
		  CellColumn = lstRows.ColumnFromXY(x, y)
		  
		  if CellRow < 0 then
		    
		    if WasDoubleClick(x, y) then
		      
		      addRow = false
		      if lstRows.ListCount > 0 then
		        lastRowIndex = lstRows.RowTag(lstRows.ListCount - 1)
		        if not scrollRows.Enabled or (lastRowIndex = scrollRows.Maximum) then
		          addRow = true
		        end if
		      else
		        addRow = true
		      end if
		      
		      if addRow then
		        tableName = lstTree.List(lstTree.ListIndex)
		        
		        if Connector.InsertRow(tableName) then
		          UpdateChanged()
		          TableRows = TableRows + 1
		          if TableRows = 1 then
		            lblRowCount.Text = "1 row"
		          else
		            lblRowCount.Text = Str(TableRows) + " rows"
		          end if 
		          scrollRows.Maximum = TableRows - 1
		          DisplayPage(true)
		          lstRows.ListIndex = TableRows - 1
		          lstRows.EditCell lstRows.ListCount-1, 0
		        end if
		      end if
		      
		    end if
		    
		  elseif Keyboard.ShiftKey then
		    
		    if (CellRow >= 0) and (CellRow < lstRows.ListCount) then
		      Connector.ShiftSelectRows(lstRows.RowTag(CellRow))
		      i = 0
		      while i < lstRows.ListCount
		        lstRows.Selected(i) = Connector.RowSelected(lstRows.RowTag(i))
		        i = i + 1
		      wend
		    end if
		    
		    return true
		    
		  else
		    
		    preserveSelection = false
		    
		    #if TargetMacOS then
		      if Keyboard.CommandKey then
		        preserveSelection = true
		      end if
		    #else
		      if Keyboard.ControlKey then
		        preserveSelection = true
		      end if
		    #endif
		    
		    if not preserveSelection then
		      Connector.ClearSelection()
		      if (CellRow >= 0) and (CellRow < lstRows.ListCount) then
		        Connector.RowSelected(lstRows.RowTag(CellRow)) = true 
		      end if
		    else
		      if (CellRow >= 0) and (CellRow < lstRows.ListCount) then
		        Connector.RowSelected(lstRows.RowTag(CellRow)) = not  Connector.RowSelected(lstRows.RowTag(CellRow))
		      end if
		    end if
		    
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim mi As MenuItem
		  Dim submi As MenuItem
		  
		  mi = new MenuItem()
		  mi.Name = "mnuDelete"
		  mi.Text = "Delete"
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSep1"
		  mi.Text = "-"
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuInsertRow"
		  mi.Text = "Insert Row"
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSep2"
		  mi.Text = "-"
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuEditTable"
		  mi.Text = "Edit Table"
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuSep3"
		  mi.Text = "-"
		  base.Append mi
		  
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
		    
		  case "mnuDelete"
		    actionDeleteSelectedRows()
		    
		  case "mnuEditTable"
		    actionEditSelectedTable()
		    
		  case "mnuExportCSV"
		    actionExportCSV()
		    
		  case "mnuExportJSON"
		    actionExportJSON()
		    
		  case "mnuInsertRow"
		    actionInsertRow()
		    
		  end select
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  Dim field As SmartData.Field
		  
		  field = lstRows.CellTag(row, column)
		  
		  if field.IsNull or field.IsBinary then
		    g.ForeColor = &c777777
		    g.Italic = true
		  end if
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  Dim colInfo As JSONItem
		  Dim field As SmartData.Field
		  Dim table As String
		  Dim rowIndex As Int64
		  Dim colName AS String
		  
		  if lstRows.ListIndex = row then
		    
		    if (row >= 0) and (row < lstRows.ListCount) and (column < lstRows.ColumnCount) then
		      
		      field = lstRows.CellTag(row, column)
		      
		      if field.IsBinary then
		        
		        ApplyBlobData = false
		        WindowBLOBEditor.Data = field.Binary
		        WindowBLOBEditor.ShowModal()
		        
		        if ApplyBlobData then
		          
		          table = lstTree.List(lstTree.ListIndex)
		          colInfo = Me.ColumnTag(column)
		          colName = colInfo.Value("name")
		          rowIndex = Me.RowTag(row)
		          
		          if Connector.UpdateValue(table, rowIndex, colName, BlobData) then
		            field.Binary = BlobData
		            if BlobData = nil then
		              field.IsNull = true
		              field.Value = "NULL"
		            else
		              field.IsNull = false
		              field.Value = "BLOB"
		            end if
		            lstRows.Cell(row, column) = field.Value
		            Me.defaultRowHeight = Me.defaultRowHeight // force refresh
		            UpdateChanged()
		          end if
		          
		        end if
		        
		      end if
		      
		    end if
		    
		  end if
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Dim colInfo As JSONItem
		  
		  if (CellColumn >= 0) and (CellColumn < lstRows.ColumnCount) then
		    
		    colInfo = Me.ColumnTag(CellColumn)
		    
		    if colInfo.Value("type") <> "blob" then
		      lstRows.EditCell CellRow, CellColumn
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Dim table As String
		  Dim rowIndex As Int64
		  Dim value As String
		  Dim colInfo As JSONItem
		  Dim colName AS String
		  Dim field As SmartData.Field
		  
		  if (lstTree.ListIndex >= 0) and (lstTree.ListIndex < lstTree.ListCount) then
		    
		    value = Me.Cell(row, column)
		    field = Me.CellTag(row, column)
		    
		    if StrComp(value, CellValue, 0) <> 0 then
		      
		      table = lstTree.List(lstTree.ListIndex)
		      colInfo = Me.ColumnTag(column)
		      colName = colInfo.Value("name")
		      rowIndex = Me.RowTag(row)
		      
		      if Connector.UpdateValue(table, rowIndex, colName, value) then
		        field.Value = value
		        field.IsNull = false
		        Me.defaultRowHeight = Me.defaultRowHeight // force refresh
		        UpdateChanged()
		      else
		        Me.Cell(row, column) = field.Value
		      end if
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellGotFocus(row as Integer, column as Integer)
		  CellValue = lstRows.Cell(row, column)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  Dim stepY As Integer
		  
		  if scrollRows.Enabled then
		    
		    stepY = deltaY 
		    if stepY >= VisibleRows then
		      stepY = VisibleRows - 1
		    end if
		    if stepY <= 0 then
		      stepY = 1
		    end if
		    scrollRows.Value = scrollRows.Value + deltaY
		    
		  end if
		  
		  return true
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  'Dim i As Integer
		  '
		  'i = 0
		  'while i < lstRows.ListCount
		  'if lstRows.Selected(i) then
		  'SelectedRows.Value(lstRows.RowTag(i)) = true
		  'else
		  'SelectedRows.Value(lstRows.RowTag(i)) = false
		  'end if
		  'i = i + 1
		  'wend
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  if Connector <> nil then
		    if OrderByColumn = TableFieldName(column) then
		      OrderDesc = not OrderDesc
		    else
		      OrderByColumn = TableFieldName(column)
		      OrderDesc = false
		    end if
		    Connector.ClearSelection()
		    DisplayPage()
		  else
		    OrderByColumn = ""
		  end if
		  
		  return true
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events canQueryToolbar
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  if X <= 50 then
		    QueryToolbarIndex = 0
		    
		  elseif X <= 100 then
		    QueryToolbarIndex = 1
		    
		  elseif X <= 150 then
		    QueryToolbarIndex = 2
		    
		  elseif X <= 200 then
		    QueryToolbarIndex = 3
		    
		  end if
		  
		  canQueryToolbar.Invalidate(false)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim img As Picture
		  
		  // play
		  
		  if QueryToolbarIndex = 0 then
		    img = imgPlayLarge
		  else
		    img = imgPlay
		  end if
		  g.DrawPicture img, 25 - (img.Width \ 2), (canQueryToolbar.Height \ 2) - (img.Height \ 2)
		  
		  // replay
		  
		  if QueryToolbarIndex = 1 then
		    img = imgHistoryLarge
		  else
		    img = imgHistory
		  end if
		  g.DrawPicture img, 75 - (img.Width \ 2), (canQueryToolbar.Height \ 2) - (img.Height \ 2)
		  
		  // open
		  
		  if QueryToolbarIndex = 2 then
		    img = imgOpenSQLLarge
		  else
		    img = imgOpenSQL
		  end if
		  g.DrawPicture img, 125 - (img.Width \ 2), (canQueryToolbar.Height \ 2) - (img.Height \ 2)
		  
		  // syntax
		  
		  if QueryToolbarIndex = 3 then
		    img = imgSyntaxLarge
		  else
		    img = imgSyntax
		  end if
		  g.DrawPicture img, 175 - (img.Width \ 2), (canQueryToolbar.Height \ 2) - (img.Height \ 2)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if X <= 50 then
		    actionRunQuery()
		    
		  elseif X <= 100 then
		    actionHistory()
		    
		  elseif X <= 150 then
		    actionOpenSQLFile()
		    
		  elseif X <= 200 then
		    actionSwitchColorScheme()
		    
		  end if
		  
		  QueryToolbarIndex = -1
		  canQueryToolbar.Invalidate(false)
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  QueryToolbarIndex = -1
		  
		  canQueryToolbar.Invalidate(false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tbarMain
	#tag Event
		Sub Action(item As ToolItem)
		  select case item.Name
		    
		    'case "toolBrowseExisting"
		    'actionConnect()
		    
		  case "toolChart"
		    actionChart()
		    
		  case "toolCreateTable"
		    actionCreateTable()
		    
		  case "toolInsertRow"
		    actionInsertRow()
		    
		  case "toolNew"
		    actionNewDatabase()
		    
		  case "toolRollback"
		    actionRollback()
		    
		  case "toolCommit"
		    actionCommit()
		    
		  end select
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropDownMenuAction(item As ToolItem, hitItem As MenuItem)
		  select case item.Name
		    
		  case "toolConnect"
		    
		    select case hitItem.Name
		      
		    case "toolBrowseExisting"
		      actionConnect()
		      
		    case else
		      actionConnect hitItem.Tag
		      
		    end select
		    
		  end select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtRowFilter
	#tag Event
		Sub TextChange()
		  DisplaySelectedTable()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  select case Asc(Key)
		    
		  case 13, 31 // Enter, Down Arrrow
		    lstRows.SetFocus()
		    if (lstRows.ListIndex < 0) and (lstRows.ListCount >= 1) then
		      lstRows.ListIndex = 0
		    end if
		    
		  end select
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events scrollRows
	#tag Event
		Sub ValueChanged()
		  if not BlockScrollChange then
		    DisplayPage()
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrColumnWidths
	#tag Event
		Sub Action()
		  if not BlockColumnUpdates then
		    if Connector <> nil then
		      if TableName <> "" then
		        mColumnLayout.Value(TableName) = lstRows.ColumnWidths
		      end if
		    end if
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtQuery
	#tag Event
		Sub RunSource()
		  actionRunQuery()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmdRefresh
	#tag Event
		Sub Action()
		  Dim currentPos As Integer
		  
		  currentPos = scrollRows.Value
		  
		  DisplaySelectedTable()
		  
		  if currentPos <= scrollRows.Maximum then
		    scrollRows.Value = currentPos
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
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
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ApplyBlobData"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BlockColumnUpdates"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BlockPageRefresh"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BlockScrollChange"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CellColumn"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CellRow"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CellValue"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentWindowHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentWindowWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DragMode"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="DragModeEnum"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - TableWidth"
			"2 - QueryHeight"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FirstActivation"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="IndicesExpanded"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="OrderByColumn"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="OrderDesc"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PrevMouseX"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PrevMouseY"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="QueryToolbarIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelectedTable"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TableFilter"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TableName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TableRowQuery"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TableRows"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="UInt64"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TablesExpanded"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="VisibleRows"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
