#tag Window
Begin ContainerControl SyntaxEditor
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
   HelpTag         =   ""
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   334
   Begin Canvas canTextArea
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   282
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   316
   End
   Begin ScrollBar scrollVertical
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   280
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   317
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
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   17
   End
   Begin ScrollBar scrollHorizontal
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   17
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LineStep        =   1
      LiveScroll      =   False
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   283
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   314
   End
   Begin Timer tmrCursor
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   500
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub GotFocus()
		  HasFocus = true
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  HandleKeyDown(Key)
		  
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  HasFocus = false
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Syntax = SyntaxEnum.SQLite
		  ColorScheme = ColorSchemeEnum.DefaultLight
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  SetHorizontalScrollbar()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  SetHorizontalScrollbar()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub actionCopy()
		  Dim c As New Clipboard
		  
		  c.Text = GetSelectedText()
		  c.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub actionCut()
		  actionCopy()
		  actionDelete()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub actionDelete()
		  Dim i As Integer
		  Dim tmpStr As String
		  
		  SaveUndo()
		  
		  if mSelStartLine = mSelEndLine then
		    tmpStr = Right(mLines(mSelStartLine), Len(mLines(mSelStartLine)) - mSelEndCol)
		    mLines(mSelStartLine) = Left(mLines(mSelStartLine), mSelStartCol) + tmpStr
		  elseif mSelStartLine < mSelEndLine then
		    mLines(mSelStartLine) = Left(mLines(mSelStartLine), mSelStartCol)
		  end if
		  
		  i = mSelStartLine + 1
		  while i < mSelEndLine
		    mLines.Remove(i)
		    mSelEndLine = mSelEndLine - 1
		  wend
		  
		  if mSelStartLine < mSelEndLine then
		    if mSelEndCol >= Len(mLines(mSelEndLine)) then
		      mLines.Remove(mSelEndLine)
		    else
		      tmpStr = Right(mLines(mSelEndLine), Len(mLines(mSelEndLine))- mSelEndCol)
		      mLines(mSelStartLine) = mLines(mSelStartLine) + Right(mLines(mSelEndLine), Len(mLines(mSelEndLine))- mSelEndCol)
		      mLines.Remove(mSelEndLine)
		    end if 
		    
		  end if
		  
		  AdjustTabs(mSelStartLine)
		  
		  mSelEndLine = mSelStartLine
		  mSelEndCol = mSelStartCol
		  mCursorLine = mSelEndLine
		  mCursorCol = mSelEndCol
		  
		  SaveUndo()
		  
		  SetHorizontalScrollbar()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub actionPaste()
		  Dim c As New Clipboard
		  Dim s As String
		  Dim pasteLines() As String
		  Dim i As Integer
		  Dim tmpStr As String
		  
		  s = c.Text
		  c.Close
		  
		  if s <> "" then
		    
		    SaveUndo()
		    
		    pasteLines = SplitSource(s)
		    
		    actionDelete()
		    
		    if pasteLines.Ubound <= 0 then
		      
		      mLines(mCursorLine) = Left(mLines(mCursorLine), mCursorCol) + pasteLines(0) + Right(mLines(mCursorLine), Len(mLines(mCursorLine)) - mCursorCol)
		      mCursorCol = mCursorCol + Len(pasteLines(0))
		      
		    else
		      
		      tmpStr = Right(mLines(mCursorLine), Len(mLines(mCursorLine)) - mCursorCol)
		      if tmpStr <> "" then
		        mLines.Insert(mCursorLine + 1, tmpStr)
		        mLines(mCursorLine) = Left(mLines(mCursorLine), mCursorCol) + pasteLines(0)
		      else
		        mLines(mCursorLine) = mLines(mCursorLine) + pasteLines(0)
		      end if 
		      
		      i = 1
		      while i < pasteLines.Ubound
		        mLines.Insert(mCursorLine + 1, pasteLines(i))
		        mCursorLine = mCursorLine + 1
		        i = i + 1
		      wend
		      
		      if mCursorLine < mLines.Ubound then
		        mLines(mCursorLine + 1) = pasteLines(pasteLines.Ubound) + mLines(mCursorLine + 1)
		        mCursorCol = Len(pasteLines(pasteLines.Ubound))
		      else
		        mLines.Append pasteLines(pasteLines.Ubound)
		        mCursorCol = Len(mLines(mCursorLine + 1))
		      end if
		      
		      mCursorLine = mCursorLine + 1
		      
		    end if
		    
		    SaveUndo()
		    
		  end if
		  
		  SetHorizontalScrollbar()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub actionRedo()
		  Dim undoItem As JSONItem
		  
		  if (mUndoIndex >= 0) and (mUndoIndex < mUndoStack.Ubound) then
		    if mUndoStack(mUndoIndex + 1) <> nil then
		      mUndoIndex = mUndoIndex + 1
		      undoItem = mUndoStack(mUndoIndex)
		      SetUndoItem(undoItem)
		    end if
		  end if
		  
		  SetHorizontalScrollbar()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub actionSelectAll()
		  mSelStartLine = 0
		  mSelStartCol = 0
		  mSelEndLine = mLines.Ubound
		  mSelEndCol = Len(mLines(mLines.Ubound))
		  
		  mCursorLine = 0
		  mCursorCol = 0
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub actionUndo()
		  Dim undoItem As New JSONItem
		  Dim tmpStr As String
		  
		  if mUndoIndex > 0 then
		    undoItem = mUndoStack(mUndoIndex)
		    tmpStr = Source
		    if StrComp(undoItem.Value("source"), tmpStr, 0) = 0 then
		      mUndoIndex = mUndoIndex - 1
		    end if
		  end if
		  
		  if mUndoIndex >= 0 then
		    
		    if mUndoIndex >= mUndoStack.Ubound then
		      SaveUndo
		      mUndoIndex = mUndoIndex - 1
		      undoItem = mUndoStack(mUndoIndex)
		    elseif (mUndoStack(mUndoIndex + 1) = nil) then
		      SaveUndo
		      mUndoIndex = mUndoIndex - 1
		      undoItem = mUndoStack(mUndoIndex)
		    else
		      undoItem = mUndoStack(mUndoIndex)
		      if mUndoIndex > 0 then
		        mUndoIndex = mUndoIndex - 1
		      end if
		      
		    end if
		    
		    SetUndoItem(undoItem)
		    
		  end if
		  
		  SetHorizontalScrollbar()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AdjustHorizontalView(scrollRight As Boolean = false)
		  if scrollHorizontal.Enabled then
		    if mCursorCol < mColStart then
		      scrollHorizontal.Value = mCursorCol
		    elseif (Len(mLines(mCursorLine)) < mCursorCol) and (Len(mLines(mCursorLine)) < mColStart) then
		      scrollHorizontal.Value = Len(mLines(mCursorLine))
		    elseif mCursorCol > (mColStart + (canTextArea.Width \ mCharWidth)) then
		      if scrollRight then
		        scrollHorizontal.Value = scrollHorizontal.Value + 1
		      else
		        scrollHorizontal.Value = scrollHorizontal.Maximum - Floor(canTextArea.Width \ mCharWidth) + 1
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AdjustTabPosition()
		  Dim tmpStr As String
		  Dim posMod As Integer
		  
		  if (mCursorLine >= 0) and (mCursorLine <= mLines.Ubound) then
		    tmpStr = mLines(mCursorLine)
		    if (mCursorCol > 0) and (mCursorCol < Len(tmpStr)) then
		      
		      if (Mid(tmpStr, mCursorCol, 1) = Chr(9)) and (Mid(tmpStr, mCursorCol + 1, 1) = Chr(9)) then
		        
		        posMod = mCursorCol mod mTabSize
		        
		        if posMod <> 0 then
		          
		          if posMod <= (mTabSize \ 2) then
		            mCursorCol = mCursorCol - posMod
		          else
		            mCursorCol = mCursorCol + (mTabSize - posMod)
		          end if
		          
		        end if
		        
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AdjustTabs(line As Integer)
		  Dim lineMB As MemoryBlock
		  Dim result As String
		  Dim i As Integer
		  Dim inTabs As Boolean
		  
		  lineMB = mLines(line)
		  result = ""
		  inTabs = false
		  i = 0
		  while i < lineMB.Size
		    if inTabs then
		      
		      if lineMB.UInt8Value(i) <> 9 then // tab
		        while (Right(result, 1) = Chr(9)) and ((Len(result) mod mTabSize) <> 0)
		          result = Left(result, Len(result) - 1)
		        wend
		        while ((Len(result) mod mTabSize) <> 0)
		          result = result + Chr(9)
		        wend
		        inTabs = false
		      end if
		      result = result + Chr(lineMB.UInt8Value(i))
		      
		    else
		      result = result + Chr(lineMB.UInt8Value(i))
		      if lineMB.UInt8Value(i) = 9 then // tab
		        inTabs = true
		      end if
		    end if
		    i = i + 1
		  wend
		  
		  mLines(line) = result
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSelection()
		  mSelStartLine = mCursorLine
		  mSelStartCol = mCursorCol
		  mSelEndLine = mCursorLine
		  mSelEndCol = mCursorCol
		  
		  mStartSelectLine = mCursorLine
		  mStartSelectCol = mCursorCol
		  
		  mSelectedText = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mTabSize = 4
		  mLineStart = 0 
		  mColStart = 0
		  mTextOffset = 2
		  mTempPic = new Picture(1, 1)
		  mTempPic.Graphics.TextFont = DefaultFont
		  mTempPic.Graphics.TextUnit = FontUnits.Pixel
		  mTempPic.Graphics.TextSize = 12
		  mCharWidth = mTempPic.Graphics.StringWidth("W")
		  mUndoIndex = -1
		  Redim  mUndoStack(100) 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy()
		  actionCopy()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub customDoubleClick(X As Integer, Y As Integer)
		  Dim line As Integer
		  Dim col As Integer
		  Dim selBegin As Integer
		  Dim selEnd As Integer
		  Dim ch As String
		  Dim validToken As Boolean
		  Dim tmpStr As String
		  
		  if not IsContextualClick then
		    
		    GetCursorPosition X, Y, line, col
		    if (line >= 0) and (line <= mLines.Ubound) then
		      
		      selBegin = col
		      ch = Mid(mLines(line), selBegin, 1)
		      
		      if mSymbols.HasKey(ch) or mOperators.HasKey(ch) or mStringQuotes.HasKey(ch) then
		        
		        selBegin = col - 1
		        selEnd = col
		        
		        // search backward
		        
		        validToken = true
		        while (selBegin > 0) and validToken
		          tmpStr =  Mid(mLines(line), selBegin, selEnd - selBegin + 1)
		          if mSymbols.HasKey(tmpStr) or mOperators.HasKey(tmpStr) or mStringQuotes.HasKey(ch) then
		            selBegin = selBegin - 1
		          else
		            validToken = false
		          end if
		        wend
		        
		        // search forward
		        
		        validToken = true
		        while (selEnd < Len(mLines(line))) and validToken
		          tmpStr =  Mid(mLines(line), selBegin + 1, selEnd - selBegin + 1)
		          if mSymbols.HasKey(tmpStr) or mOperators.HasKey(tmpStr) or mStringQuotes.HasKey(ch) then
		            selEnd = selEnd + 1
		          else
		            validToken = false
		          end if
		        wend
		        
		      else
		        
		        while (selBegin > 0) and (Asc(ch) > 32) and not mSymbols.HasKey(ch) and not mOperators.HasKey(ch) and not mStringQuotes.HasKey(ch)
		          selBegin = selBegin - 1
		          ch = Mid(mLines(line), selBegin, 1)
		        wend
		        
		        selEnd = col + 1
		        ch = Mid(mLines(line), selEnd, 1)
		        while (selEnd < Len(mLines(line))) and (Asc(ch) > 32) and not mSymbols.HasKey(ch) and not mOperators.HasKey(ch) and not mStringQuotes.HasKey(ch)
		          selEnd = selEnd + 1
		          ch = Mid(mLines(line), selEnd, 1)
		        wend
		        if (Asc(ch) <= 32) or mSymbols.HasKey(ch) or mOperators.HasKey(ch) or mStringQuotes.HasKey(ch) then
		          selEnd = selEnd - 1
		        end if
		        
		      end if
		      
		      if (selEnd - selBegin) >= 1 then
		        
		        mCursorLine = line
		        mCursorCol = selEnd
		        
		        mSelStartLine = mCursorLine
		        mSelStartCol = selBegin
		        mSelEndLine = mCursorLine
		        mSelEndCol = selEnd
		        
		        mStartSelectLine = mCursorLine
		        mStartSelectCol = selBegin
		        
		        UpdateSelection()
		        
		      else
		        
		        mSelStartLine = mCursorLine
		        mSelStartCol = mCursorCol
		        mSelEndLine = mCursorLine
		        mSelEndCol = mCursorCol
		        
		        mStartSelectLine = mCursorLine
		        mStartSelectCol = mCursorCol
		        
		      end if
		      
		      UpdateSelection()
		      
		      canTextArea.Invalidate(false)
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cut()
		  actionCut()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  actionDelete()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawHLString(g As Graphics, s As String, x As Integer, y As Integer, backColor As Color, textColor As Color)
		  Dim i As Integer
		  Dim ch As String
		  Dim yTop As Integer
		  Dim xPos As Integer
		  Dim tmpMB As MemoryBlock
		  
		  yTop = y - g.TextAscent
		  tmpMB = s
		  xPos = x 
		  i = 0
		  while i < tmpMB.Size
		    ch = tmpMB.StringValue(i, 1)
		    g.ForeColor = backColor
		    g.FillRect xPos, yTop, mCharWidth, mTextHeight
		    if Asc(ch) > 32 then
		      g.ForeColor = textColor
		      g.DrawString ch, xPos, y
		    end if
		    i = i + 1
		    xPos = xPos + mCharWidth
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetCursorPosition(X as Integer, Y As Integer, ByRef line As Integer, ByRef col As Integer)
		  Dim lineStep As Integer
		  Dim colStep As Integer
		  Dim lineStr As String
		  Dim lineLen As Integer
		  
		  if Y < 0 then
		    lineStep = 0
		  else
		    lineStep = Floor(Y / mTextHeight) 
		  end if
		  if (mLineStart + lineStep) <= mLines.Ubound then
		    line = mLineStart + lineStep
		  else
		    line = mLines.Ubound
		  end if
		  
		  if (mCursorLine >= 0) and (mCursorLine <= mLines.Ubound) then
		    lineStr = mLines(mCursorLine)
		    
		    lineLen = Len(lineStr)
		    colStep = Floor((X + mCharWidth * 0.5) / mCharWidth) 
		    if (mColStart + colStep) < lineLen then
		      col = mColStart + colStep
		      if col < 0 then
		        col = 0
		      end if
		    else
		      col = lineLen
		    end if
		    
		  else
		    col = 0
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSelectedText() As String
		  Dim copyText() As String
		  Dim i As Integer
		  
		  if mSelStartLine = mSelEndLine then
		    copyText.Append Mid(mLines(mSelStartLine), mSelStartCol + 1, mSelEndCol - mSelStartCol)
		  elseif mSelStartLine < mSelEndLine then
		    copyText.Append Right(mLines(mSelStartLine), Len(mLines(mSelStartLine)) - mSelStartCol)
		  end if
		  
		  i = mSelStartLine + 1
		  while i < mSelEndLine
		    copyText.Append mLines(i)
		    i = i + 1
		  wend
		  
		  if mSelStartLine < mSelEndLine then
		    copyText.Append Left(mLines(mSelEndLine), mSelEndCol)
		  end if
		  
		  return PrepText(copyText)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleKeyDown(Key As String)
		  Dim tmpStr As String
		  Dim keyAsc As Integer
		  Dim copy As Boolean
		  Dim cut As Boolean
		  Dim undo As Boolean
		  Dim paste As Boolean
		  Dim redo As Boolean
		  Dim selectAll As Boolean
		  Dim tabStr As String
		  Dim delLen As Integer
		  Dim search As Boolean
		  
		  keyAsc = Asc(Key)
		  
		  selectAll = false
		  copy = false
		  cut = false
		  paste = false
		  undo = false
		  redo = false
		  
		  #if TargetMacOS then
		    
		    if Keyboard.CommandKey then // OS X
		      select case keyAsc
		      case 1 // Ctrl+A
		        selectAll = true
		      case 3 // Ctrl+C
		        copy = true
		      case 22 // Ctrl+V
		        paste = true
		      case 24 // Ctrl+X
		        cut = true
		      case 25 // Ctrl+Y
		        redo = true
		      case 26 // Ctrl+Z
		        undo = true
		        'case else
		        'MsgBox Str(keyAsc)
		      end select
		    end if
		    
		  #else // Windows and Linux
		    
		    if Keyboard.ControlKey then
		      select case keyAsc
		      case 1 // Ctrl+A
		        selectAll = true
		      case 3 // Ctrl+C
		        copy = true
		      case 22 // Ctrl+V
		        paste = true
		      case 24 // Ctrl+X
		        cut = true
		      case 25 // Ctrl+Y
		        redo = true
		      case 26 // Ctrl+Z
		        undo = true
		        'case else
		        'MsgBox Str(keyAsc)
		      end select
		    end if
		    
		  #endif
		  
		  if selectAll then
		    
		    actionSelectAll()
		    
		  elseif copy then
		    
		    actionCopy()
		    
		  elseif cut then
		    
		    actionCut()
		    
		  elseif paste then
		    
		    actionPaste()
		    
		  elseif undo then
		    
		    actionUndo()
		    
		  elseif redo then
		    
		    actionRedo()
		    
		  elseif keyAsc = 1 then // Home
		    
		    mCursorCol = 0
		    if Keyboard.ShiftKey then
		      UpdateSelection()
		    else
		      mStartSelectCol = mCursorCol
		      ClearSelection()
		    end if
		    if scrollHorizontal.Enabled then
		      scrollHorizontal.Value = 0
		    end if
		    
		  elseif keyAsc = 4 then // End
		    
		    if (mCursorLine >= 0) and (mCursorLine <= mLines.Ubound) then
		      mCursorCol = Len(mLines(mCursorLine))
		    end if
		    if Keyboard.ShiftKey then
		      UpdateSelection()
		    else
		      mStartSelectCol = mCursorCol
		      ClearSelection()
		    end if
		    AdjustHorizontalView()
		    
		  elseif keyAsc = 8 then // Backspace
		    
		    if mCursorCol > Len(mLines(mCursorLine)) then
		      mCursorCol = Len(mLines(mCursorLine))
		    end if
		    
		    if (mSelStartCol <> mSelEndCol) or (mSelStartLine <> mSelEndLine) then
		      
		      actionDelete()
		      
		    else
		      
		      if mCursorCol <= 0 then
		        
		        if mCursorLine > 0 then
		          if mLines(mCursorLine - 1) = "" then
		            mLines.Remove(mCursorLine - 1)
		            scrollVertical.Maximum = mLines.Ubound - 1
		          else
		            tmpStr = mLines(mCursorLine - 1)
		            mLines(mCursorLine - 1) = tmpStr + mLines(mCursorLine)
		            mLines.Remove(mCursorLine)
		            scrollVertical.Maximum = mLines.Ubound - 1
		            mCursorCol = Len(tmpStr)
		          end if
		          mCursorLine = mCursorLine - 1
		        end if
		        
		      else
		        if (mCursorLine >= 0) then
		          tmpStr = mLines(mCursorLine)
		          if Mid(tmpStr, mCursorCol, 1) = chr(9) then
		            delLen = 1
		            while (Mid(tmpStr, mCursorCol - delLen, 1) = Chr(9)) and (((mCursorCol - delLen) mod mTabSize) <> 0 )
		              delLen = delLen + 1
		            wend
		            mLines(mCursorLine) = Left(tmpStr, mCursorCol - delLen) + Right(tmpStr, Len(tmpStr) - mCursorCol) 
		            mCursorCol = mCursorCol - delLen
		          else
		            mLines(mCursorLine) = Left(tmpStr, mCursorCol - 1) + Right(tmpStr, Len(tmpStr) - mCursorCol) 
		            mCursorCol = mCursorCol - 1
		          end if
		        end if
		      end if
		      
		    end if
		    
		    SetHorizontalScrollbar()
		    AdjustHorizontalView()
		    
		  elseif keyAsc = 13 then // Enter
		    
		    if Keyboard.ControlKey then
		      RaiseEvent RunSource()
		    else
		      tmpStr = mLines(mCursorLine)
		      mLines.Insert mCursorLine + 1, ""
		      scrollVertical.Maximum = mLines.Ubound - 1
		      mLines(mCursorLine) = Left(tmpStr, mCursorCol)
		      mLines(mCursorLine + 1) = Right(tmpStr, Len(tmpStr) - mCursorCol)
		      mCursorLine = mCursorLine + 1
		      mCursorCol = 0
		      AdjustHorizontalView()
		      ClearSelection()
		    end if
		    
		  elseif keyAsc = 28 then // Left arrow
		    if mCursorLine >= 0 then
		      if mCursorCol > 0 then
		        if mCursorCol > Len(mLines(mCursorLine)) then
		          mCursorCol = Len(mLines(mCursorLine))
		        end if
		        
		        if Keyboard.ControlKey then
		          
		          search = true
		          do
		            if Mid(mLines(mCursorLine), mCursorCol, 1) = Chr(9) then
		              do
		                mCursorCol = mCursorCol - 1 
		              loop until (Mid(mLines(mCursorLine), mCursorCol, 1) <> Chr(9)) or ((mCursorCol mod mTabSize) = 0) or (mCursorCol <= 0)
		            else
		              mCursorCol = mCursorCol - 1 
		            end if
		            
		            if (mCursorCol <= 0) then
		              search = false
		            else
		              tmpStr = Mid(mLines(mCursorLine), mCursorCol, 1)
		              search = not (mOperators.HasKey(tmpStr) or mSymbols.HasKey(tmpStr) or (Asc(tmpStr) <= 32))
		              if search then
		                tmpStr = Mid(mLines(mCursorLine), mCursorCol + 1, 1)
		                search = not (mOperators.HasKey(tmpStr) or mSymbols.HasKey(tmpStr) or (Asc(tmpStr) <= 32))
		              end if
		            end if
		          loop until not search
		          
		        else
		          
		          if Mid(mLines(mCursorLine), mCursorCol, 1) = Chr(9) then
		            do
		              mCursorCol = mCursorCol - 1 
		            loop until (Mid(mLines(mCursorLine), mCursorCol, 1) <> Chr(9)) or ((mCursorCol mod mTabSize) = 0) or (mCursorCol <= 0)
		          else
		            mCursorCol = mCursorCol - 1 
		          end if
		          
		        end if
		        
		      else
		        if mCursorLine > 0 then
		          mCursorLine = mCursorLine - 1
		          mCursorCol = Len(mLines(mCursorLine))
		        end if
		      end if
		    end if
		    if Keyboard.ShiftKey then
		      UpdateSelection()
		    else
		      mStartSelectCol = mCursorCol
		      ClearSelection()
		    end if
		    AdjustHorizontalView()
		    
		  elseif keyAsc = 29 then // Right arrow
		    if mCursorLine >= 0 then
		      if mCursorCol < Len(mLines(mCursorLine)) then
		        
		        if Keyboard.ControlKey then
		          
		          search = true
		          do
		            if Mid(mLines(mCursorLine), mCursorCol + 1, 1) = Chr(9) then
		              do
		                mCursorCol = mCursorCol + 1
		              loop until ((mCursorCol mod mTabSize) = 0) or (mCursorCol >= Len(mLines(mCursorLine)))
		            else
		              mCursorCol = mCursorCol + 1 
		            end if
		            
		            if (mCursorCol >= Len(mLines(mCursorLine))) then
		              search = false
		            else
		              tmpStr = Mid(mLines(mCursorLine), mCursorCol + 1, 1)
		              search = not (mOperators.HasKey(tmpStr) or mSymbols.HasKey(tmpStr) or (Asc(tmpStr) <= 32))
		              if search then
		                tmpStr = Mid(mLines(mCursorLine), mCursorCol, 1)
		                search = not (mOperators.HasKey(tmpStr) or mSymbols.HasKey(tmpStr) or (Asc(tmpStr) <= 32))
		              end if
		            end if
		          loop until not search
		          
		        else
		          
		          if Mid(mLines(mCursorLine), mCursorCol + 1, 1) = Chr(9) then
		            do
		              mCursorCol = mCursorCol + 1
		            loop until ((mCursorCol mod mTabSize) = 0) or (mCursorCol >= Len(mLines(mCursorLine)))
		          else
		            mCursorCol = mCursorCol + 1 
		          end if
		          
		        end if
		        
		      else
		        
		        if mCursorLine < mLines.Ubound then
		          mCursorLine = mCursorLine + 1
		          mCursorCol = 0
		        end if
		        
		      end if
		    end if
		    if Keyboard.ShiftKey then
		      UpdateSelection()
		    else
		      mStartSelectCol = mCursorCol
		      ClearSelection()
		    end if
		    AdjustHorizontalView(true)
		    
		  elseif keyAsc = 30 then // Up arrow
		    if mCursorLine > 0 then
		      mCursorLine = mCursorLine - 1
		    elseif mCursorCol > 0 then
		      mCursorCol = 0
		    end if
		    AdjustTabPosition()
		    if Keyboard.ShiftKey then
		      UpdateSelection()
		    else
		      mStartSelectCol = mCursorCol
		      ClearSelection()
		    end if
		    if (mCursorLine >= 0) and (mCursorLine < mLineStart) then
		      scrollVertical.Value = mCursorLine
		    end if
		    AdjustHorizontalView()
		    
		  elseif keyAsc = 31 then // Down arrow
		    if mCursorLine < mLines.Ubound then
		      mCursorLine = mCursorLine + 1
		    elseif mCursorCol < Len(mLines(mLines.Ubound)) then
		      mCursorCol = Len(mLines(mLines.Ubound))
		    end if
		    AdjustTabPosition()
		    if Keyboard.ShiftKey then
		      UpdateSelection()
		    else
		      mStartSelectCol = mCursorCol
		      ClearSelection()
		    end if
		    if (mCursorLine - mLineStart) >= (mVisibleLines - 2) then
		      scrollVertical.Value = scrollVertical.Value + 1
		    end if
		    AdjustHorizontalView()
		    
		  elseif keyAsc = 127 then // Delete key
		    
		    if mCursorCol > Len(mLines(mCursorLine)) then
		      mCursorCol = Len(mLines(mCursorLine))
		    end if
		    
		    if (mSelStartCol <> mSelEndCol) or (mSelStartLine <> mSelEndLine) then
		      
		      actionDelete()
		      
		    else
		      
		      if mCursorLine >= 0 then
		        tmpStr = mLines(mCursorLine)
		        if mCursorCol < Len(tmpStr) then
		          mLines(mCursorLine) = Left(tmpStr, mCursorCol) + Right(tmpStr, Len(tmpStr) - mCursorCol - 1)
		          AdjustTabs(mCursorLine)
		        else
		          if mCursorLine < mLines.Ubound then
		            mLines(mCursorLine) = mLines(mCursorLine) + mLines(mCursorLine + 1) 
		            AdjustTabs(mCursorLine)
		            mLines.Remove(mCursorLine + 1)
		            scrollVertical.Maximum = mLines.Ubound - 1
		          end if
		        end if
		      end if
		      
		    end if
		    
		  elseif (keyAsc >= 32) or (keyAsc = 9) then // other characters
		    
		    if (mSelStartLine <> mSelEndLine) or (mSelStartCol <> mSelEndCol) then
		      actionDelete()
		    end if
		    
		    if (mCursorLine >= 0) then
		      tmpStr = mLines(mCursorLine)
		      if keyAsc = 9 then
		        tabStr = Chr(9)
		        while ((mCursorCol + Len(tabStr)) mod 4 <> 0)
		          tabStr = tabStr + Chr(9)
		        wend
		        mLines(mCursorLine) = Left(tmpStr, mCursorCol) + tabStr + Right(tmpStr, Len(tmpStr) - mCursorCol)
		        mCursorCol = mCursorCol + Len(tabStr)
		        AdjustTabs(mCursorLine)
		      else
		        mLines(mCursorLine) = Left(tmpStr, mCursorCol) + Key + Right(tmpStr, Len(tmpStr) - mCursorCol)
		        mCursorCol = mCursorCol + 1
		      end if
		      
		      ClearSelection()
		      
		      SetHorizontalScrollbar()
		      AdjustHorizontalView()
		      
		    end if
		    
		    'else
		    'MsgBox Str(keyAsc)
		    
		  end if
		  
		  mCursorVisible = true
		  canTextArea.Invalidate(false)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitSyntax_SQLite()
		  mFunctions = new Dictionary("abs" : 1, "avg" : 1, "changes" : 1, "char" : 1, "coalesce" : 1, "count" : 1, "date" : 1, "time" : 1, "datetime" : 1, _
		  "glob" : 1, "group_concat" : 1, "hex" : 1, "ifnull" : 1, "instr" : 1, "julianday" : 1, "last_insert_rowid" : 1, "length" : 1, "like" : 1, "likelihood" : 1, _
		  "likely" : 1, "load_extension" : 1, "load_extension" : 1, "lower" : 1, "ltrim" : 1, "max" : 1, "min" : 1, "nullif" : 1, "printf" : 1, "quote" : 1,  _
		  "random" : 1, "randomblob" : 1, "replace" : 1, "round" : 1, "rtrim" : 1, "soundex" : 1, "sqlite_compileoption_get" : 1, _
		  "sqlite_compileoption_used" : 1, "sqlite_source_id" : 1, "sqlite_version" : 1, "strftime" : 1, "substr" : 1, "sum" : 1, "total" : 1, _
		  "total_changes" : 1, "trim" : 1, "typeof" : 1, "unicode" : 1, "unlikely" : 1, "upper" : 1, "zeroblob" : 1)
		  
		  mKeywords = new Dictionary("abort" : 1, "action" : 1, "add" : 1, "after" : 1, "all" : 1, "alter" : 1, "analyze" : 1, "and" : 1, "as" : 1, "asc" : 1, _
		  "attach" : 1, "autoincrement" : 1, "before" : 1, "begin" : 1, "between" : 1, "by" : 1, "cascade" : 1, "case" : 1, "cast" : 1, "check" : 1, _
		  "collate" : 1, "column" : 1, "commit" : 1, "conflict" : 1, "constraint" : 1, "create" : 1, "cross" : 1, "current_date" : 1, "current_time" : 1, _
		  "current_timestamp" : 1, "database" : 1, "default" : 1, "deferrable" : 1, "deferred" : 1, "delete" : 1, "desc" : 1, "detach" : 1, "distinct" : 1, _
		  "drop" : 1, "each" : 1, "else" : 1, "end" : 1, "escape" : 1, "except" : 1, "exclusive" : 1, "exists" : 1, "explain" : 1, "fail" : 1, "for" : 1, "foreign" : 1, _
		  "from" : 1, "full" : 1, "glob" : 1, "group" : 1, "having" : 1, "if" : 1, "ignore" : 1, "immediate" : 1, "in" : 1, "index" : 1, "indexed" : 1, "initially" : 1, _
		  "inner" : 1, "insert" : 1, "instead" : 1, "intersect" : 1, "into" : 1, "is" : 1, "isnull" : 1, "join" : 1, "key" : 1, "left" : 1, "like" : 1, "limit" : 1, _
		  "match" : 1, "natural" : 1, "no" : 1, "not" : 1, "notnull" : 1, "null" : 1, "of" : 1, "offset" : 1, "on" : 1, "or" : 1, "order" : 1, "outer" : 1, _
		  "plan" : 1,  "pragma" : 1, "primary" : 1, "query" : 1, "raise" : 1, "recursive" : 1, "references" : 1, "regexp" : 1, "reindex" : 1, "release" : 1, _
		  "rename" : 1, "replace" : 1, "restrict" : 1, "right" : 1, "rollback" : 1, "row" : 1, "savepoint" : 1, "select" : 1, "set" : 1, "table" : 1, "temp" : 1, _
		  "temporary" : 1, "then" : 1, "to" : 1, "transaction" : 1, "trigger" : 1, "union" : 1, "unique" : 1, "update" : 1, "using" : 1, "vacuum" : 1, "values" : 1, _
		  "view" : 1, "virtual" : 1, "when" : 1, "where" : 1, "with" : 1, "without" : 1)
		  
		  mLineComments = new Dictionary("--" : 1)
		  
		  mOperators = new Dictionary("||" : 1, "*" : 1, "/" : 1, "%" : 1, "+" : 1, "-" : 1, "<<" : 1, ">>" : 1, "&" : 1, "<" : 1, "<=" : 1, ">" : 1, ">=" : 1, _
		  "=" : 1, "==" : 1, "!=" : 1, "<>" : 1, "~" : 1)
		  
		  mStringQuotes = new Dictionary("'" : 1)
		  
		  mSymbols = new Dictionary("," : 1, ";" : 1, "(" : 1, ")" : 1, "[" : 1, "]" : 1, "." : 1)
		  
		  mTypes = new Dictionary()
		  
		  mStartBlockComment = "/*"
		  mEndBlockComment = "*/"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitSyntax_Synergy()
		  mFunctions = new Dictionary("phrase" : 1, "random" : 1)
		  
		  mKeywords = new Dictionary("and" : 1, "case" : 1, "elseif" : 1, "else" : 1, "external" : 1, "false" : 1, "if" : 1, _
		  "method" : 1, "mod" : 1, "not" : 1, "or" : 1, "return" : 1, "switch" : 1, _
		  "true" : 1, "until" : 1, "while" : 1, "xor" : 1)
		  
		  mLineComments = new Dictionary("//" : 1)
		  
		  mOperators = new Dictionary("=" : 1, "<" : 1, ">" : 1, "<=" : 1, ">=" : 1, "<>" : 1, _
		  "+" : 1, "-" : 1, "*" : 1, "/" : 1, "\" : 1, "^" : 1)
		  
		  mStringQuotes = new Dictionary("""" : 1)
		  
		  mSymbols = new Dictionary("(" : 1, ")" : 1, "," : 1, "{" : 1, "}" : 1, "=" : 1, "[" : 1, "]" : 1)
		  
		  mTypes = new Dictionary("boolean" : 1, "double" : 1, "int8" : 1, "int16" : 1, "int32" : 1, "int64" : 1, _
		  "single" : 1, "string" : 1, "uint8" : 1, "uint16" : 1, "uint32" : 1, "uint64" : 1)
		  
		  mStartBlockComment = "/*"
		  mEndBlockComment = "*/"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InsertTabs(s As String) As String
		  Dim result As String
		  Dim i As Integer
		  Dim sLen As Integer
		  Dim ch As String
		  
		  if Instr(0, s, chr(9)) > 0 then
		    
		    result = ""
		    sLen = Len(s)
		    i = 1
		    while i <= sLen
		      ch = Mid(s, i, 1)
		      if ch = chr(9) then
		        result = result + ch
		        while (Len(result) mod mTabSize) <> 0 
		          result = result + ch
		        wend
		      else
		        result = result + ch
		      end if
		      i = i + 1
		    wend
		    
		  else
		    result = s
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsNumber(value As String) As Boolean
		  Dim valueMB As MemoryBlock
		  Dim i As Integer
		  Dim result As Boolean
		  Dim foundPeriod As Boolean
		  
		  result = true
		  foundPeriod = false
		  valueMB = value
		  while (i < valueMB.Size) and result
		    
		    if (valueMB.UInt8Value(i) < 48) or (valueMB.UInt8Value(i) > 57) then 
		      if ((valueMB.UInt8Value(i) = 46) and foundPeriod) or (valueMB.UInt8Value(i) <> 46) then
		        result = false
		      end if
		    end if
		    
		    if valueMB.UInt8Value(i) = 46 then
		      foundPeriod = true
		    end if
		    
		    i = i + 1
		  wend
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSource(source As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextColorScheme()
		  select case mColorScheme
		    
		  case ColorSchemeEnum.DefaultLight
		    ColorScheme = ColorSchemeEnum.DefaultDark
		    
		  case ColorSchemeEnum.DefaultDark
		    ColorScheme = ColorSchemeEnum.None
		    
		  case ColorSchemeEnum.None
		    ColorScheme = ColorSchemeEnum.DefaultLight
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste()
		  actionPaste()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrepText(lines() As String) As String
		  Dim prepLines() As String
		  Dim i As Integer
		  
		  i = 0
		  while i <= lines.Ubound
		    prepLines.Append RemoveTabs(lines(i))
		    i = i + 1
		  wend
		  
		  return join(prepLines, EndOfLine)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrintLine(g As Graphics, lineIndex As Integer, yPos As Integer, ByRef inBlockComment As Boolean)
		  Dim lineMB As MemoryBlock
		  Dim xPos As Integer
		  Dim i As Integer
		  Dim pos As Integer
		  Dim ch As String
		  Dim chAsc As Integer
		  Dim token As String
		  Dim lookAheadCh As String
		  Dim inString As Boolean
		  Dim startQuote As String
		  Dim lineStr As String
		  Dim hlStr As String
		  Dim tmpStr as String
		  Dim hlPos As Integer
		  Dim selected As String
		  
		  tmpStr = ReplaceAll(mLines(lineIndex), Chr(9), " ")
		  
		  lineStr = Right(tmpStr, Len(tmpStr) - mColStart)
		  lineMB = tmpStr
		  
		  if ((lineIndex > mSelStartLine) and (lineIndex < mSelEndLine)) or _
		    ((lineIndex > mSelStartLine) and (lineIndex <= mSelEndLine) and (mCursorCol >= Len(tmpStr))) then
		    
		    DrawHLString g, tmpStr, -(mCharWidth * mColStart), yPos, mHighlightColor, mHighlightTextColor
		    
		    if inBlockComment then
		      if Right(tmpStr, 2) = mEndBlockComment then
		        inBlockComment = false
		      end if
		    end if
		    
		  else
		    
		    inString = false
		    xPos = -(mCharWidth * mColStart )
		    i = 0
		    pos = 0
		    while i < lineMB.Size
		      
		      chAsc = lineMB.UInt8Value(i)
		      ch = Chr(chAsc)
		      token = lineMB.StringValue(pos, i - pos + 1)
		      if (i + 1) < lineMB.Size then
		        lookAheadCh = Chr(lineMB.UInt8Value(i + 1))
		      else
		        lookAheadCh = ""
		      end if
		      
		      if inString then
		        
		        if ch = startQuote then
		          token = lineMB.StringValue(pos, i - pos + 1)
		          g.ForeColor = mStringColor
		          g.DrawString token, xPos, yPos
		          xPos = xPos + (mCharWidth * Len(token)) 
		          inString = false
		          pos = i + 1
		        end if
		        i = i + 1
		        
		      elseif inBlockComment then
		        
		        g.ForeColor = mCommentColor
		        if (ch + lookAheadCh) = mEndBlockComment then
		          g.DrawString ch + lookAheadCh, xPos, yPos
		          xPos = xPos + (mCharWidth * Len(ch + lookAheadCh))
		          inBlockComment = false
		          i = i + 2
		          pos = i
		        else
		          g.DrawString ch, xPos, yPos
		          xPos = xPos + (mCharWidth * Len(ch))
		          i = i + 1
		          pos = i
		        end if
		        
		      elseif mLineComments.HasKey(token) then
		        
		        token = lineMB.StringValue(pos, lineMB.Size - pos)
		        g.ForeColor = mCommentColor
		        g.DrawString token, xPos, yPos
		        i = lineMB.Size
		        pos = i
		        
		      elseif mStringQuotes.HasKey(token) then
		        
		        inString = true
		        startQuote = ch
		        i = i + 1
		        
		      elseif token = mStartBlockComment then
		        
		        inBlockComment = true
		        g.ForeColor = mCommentColor
		        g.DrawString token, xPos, yPos
		        xPos = xPos + (mCharWidth * Len(token))
		        i = i + 1
		        
		      elseif (chAsc <= 32) or mOperators.HasKey(ch) or mSymbols.HasKey(ch) then
		        
		        if (lookAheadCh <> "") and (mLineComments.HasKey(ch + lookAheadCh) or mOperators.HasKey(ch + lookAheadCh) or _
		          mSymbols.HasKey(ch + lookAheadCh) or ((ch + lookAheadCh) = mStartBlockComment) or _
		          ((ch + lookAheadCh) = mEndBlockComment) ) then
		          
		          i = i + 1
		          
		        else
		          
		          if pos < i then
		            token = lineMB.StringValue(pos, i - pos)
		            
		            if mKeywords.HasKey(Lowercase(token)) then
		              g.ForeColor = mKeywordColor
		            elseif mFunctions.HasKey(Lowercase(token)) then
		              g.ForeColor = mFunctionColor
		            elseif mTypes.HasKey(Lowercase(token)) then
		              g.ForeColor = mTypeColor
		            elseif IsNumber(token) then
		              g.ForeColor = mNumberColor
		            else
		              g.ForeColor = mTextColor
		            end if
		            
		            g.DrawString token, xPos, yPos
		            xPos = xPos + (mCharWidth * Len(token))
		          end if
		          
		          if chAsc > 32 then
		            if mOperators.HasKey(ch) then
		              g.ForeColor = mOperatorColor
		            elseif mSymbols.HasKey(ch) then
		              g.ForeColor = mSymbolColor
		            else
		              g.ForeColor = mTextColor
		            end if
		            g.DrawString ch, xPos, yPos
		          end if
		          
		          xPos = xPos + (mCharWidth * Len(ch))
		          i = i + 1
		          pos = i
		          
		        end if
		        
		      else
		        i = i + 1
		      end if
		      
		    wend
		    
		    if not inBlockComment then
		      
		      if pos < lineMB.Size then
		        token = Trim(lineMB.StringValue(pos, lineMB.Size - pos))
		        if mKeywords.HasKey(Lowercase(token)) then
		          g.ForeColor = mKeywordColor
		        elseif mFunctions.HasKey(Lowercase(token)) then
		          g.ForeColor = mFunctionColor
		        elseif mTypes.HasKey(Lowercase(token)) then
		          g.ForeColor = mTypeColor
		        elseif IsNumber(token) then
		          g.ForeColor = mNumberColor
		        elseif mOperators.HasKey(token) then
		          g.ForeColor = mOperatorColor
		        elseif mSymbols.HasKey(token) then
		          g.ForeColor = mSymbolColor
		        else
		          g.ForeColor = mTextColor
		        end if
		        g.DrawString token, xPos, yPos
		      end if
		      
		    end if
		    
		    if (Len(mSelectedText) > 1) or IsNumeric(mSelectedText) then
		      
		      hlPos = -1
		      while Instr(hlPos + 1, lineStr, mSelectedText) > 0
		        hlPos = Instr(hlPos + 1, lineStr, mSelectedText)
		        xPos = ((hlPos - 1) * mCharWidth)
		        selected = Mid(lineStr, hlPos, len(mSelectedText))
		        DrawHLString g, selected, xPos, yPos, mSelectedHighlightColor, mSelectedHighlightTextColor
		      wend
		      
		    end if
		    
		    hlStr = ""
		    if lineIndex = mSelStartLine then
		      if mSelEndLine > mSelStartLine then
		        hlStr = Right(lineStr, Len(lineStr) - mSelStartCol + mColStart)
		      elseif lineIndex = mSelEndLine then
		        hlStr = Mid(lineStr, mSelStartCol - mColStart + 1, mSelEndCol - mSelStartCol)
		      end if
		      if mSelStartCol > mColStart then
		        xPos = (mCharWidth * (Len(Left(lineStr, mSelStartCol - mColStart)))) 
		      else
		        xPos = 0
		      end if
		    elseif lineIndex = mSelEndLine then
		      hlStr = Left(tmpStr, mSelEndCol)
		      xPos = -(mCharWidth * mColStart )
		    end if
		    
		    if hlStr <> "" then
		      DrawHLString g, hlStr, xPos, yPos, mHighlightColor, mHighlightTextColor
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RemoveTabs(s As String) As String
		  Dim result As String
		  Dim i As Integer
		  Dim sLen As Integer
		  Dim ch As String
		  
		  if Instr(0, s, chr(9)) > 0 then
		    
		    result = ""
		    sLen = Len(s)
		    i = 1
		    while i <= sLen
		      ch = Mid(s, i, 1)
		      if ch = chr(9) then
		        result = result + ch
		        do
		          i = i + 1
		        loop until ((i - 1) mod mTabSize) = 0 
		      else
		        result = result + ch
		        i = i + 1
		      end if
		      
		    wend
		    
		  else
		    result = s
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveUndo()
		  Dim undoItem As JSONItem
		  Dim tmpStr As String
		  Dim doPush As Boolean
		  Dim i As Integer
		  
		  tmpStr = Source
		  doPush = false
		  
		  if mUndoIndex >= 0 then
		    undoItem = mUndoStack(mUndoIndex)
		    if StrComp(undoItem.Value("source"), tmpStr, 0) <> 0  then
		      doPush = true
		    end if
		  else
		    doPush = true
		  end if
		  
		  if doPush then
		    
		    undoItem = new JSONItem("{}")
		    
		    undoItem.Value("source") = tmpStr
		    undoItem.Value("cursorline") = mCursorLine
		    undoItem.Value("cursorcol") = mCursorCol
		    undoItem.Value("selstartline") = mSelStartLine
		    undoItem.Value("selstartcol") = mSelStartCol
		    undoItem.Value("selendline") = mSelEndLine
		    undoItem.Value("selendcol") = mSelEndCol
		    
		    mUndoIndex = mUndoIndex + 1
		    if mUndoIndex > mUndoStack.Ubound then
		      mUndoStack.Remove(0)
		      Redim mUndoStack(mUndoStack.Ubound + 1)
		      mUndoIndex = mUndoIndex - 1
		    end if
		    mUndoStack(mUndoIndex) = undoItem
		    
		    i = mUndoIndex + 1
		    while (i <= mUndoStack.Ubound) and (mUndoStack(i) <> nil)
		      mUndoStack(i) = nil
		      i  = i + 1
		    wend
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetCursorPosition(X as Integer, Y As Integer)
		  tmrCursor.Enabled = false
		  
		  GetCursorPosition X, Y, mCursorLine, mCursorCol
		  AdjustTabPosition()
		  
		  SaveUndo()
		  
		  mCursorVisible = true
		  canTextArea.Invalidate(false)
		  
		  tmrCursor.Enabled = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetHorizontalScrollbar()
		  Dim maxWidth As Integer
		  Dim maxCols As Integer
		  Dim i As Integer
		  
		  maxWidth = -1
		  maxCols = 0
		  i = 0
		  while i <= mLines.Ubound
		    
		    if mTempPic.Graphics.StringWidth(mLines(i)) > maxWidth then
		      maxWidth = mTempPic.Graphics.StringWidth(mLines(i))
		      maxCols = Len(mLines(i))
		    end if
		    
		    i = i + 1
		  wend
		  
		  if maxWidth < canTextArea.Width then
		    scrollHorizontal.Value = 0
		    scrollHorizontal.Enabled = false
		  else
		    scrollHorizontal.Maximum = maxCols - 1
		    scrollHorizontal.Enabled = true
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetUndoItem(undoItem As JSONItem)
		  mLines = SplitSource(undoItem.Value("source"))
		  
		  if mLines.Ubound > 0 then
		    scrollVertical.Maximum = mLines.Ubound - 1
		  else
		    mLines.Append ""
		    scrollVertical.Enabled = false
		  end if
		  
		  SetHorizontalScrollbar()
		  
		  mCursorLine = undoItem.Value("cursorline")
		  mCursorCol = undoItem.Value("cursorcol")
		  mSelStartLine = undoItem.Value("selstartline")
		  mSelStartCol = undoItem.Value("selstartcol")
		  mSelEndLine = undoItem.Value("selendline") 
		  mSelEndCol = undoItem.Value("selendcol")
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SplitSource(source As String) As String()
		  Dim sourceMB As MemoryBlock
		  Dim i As Integer
		  Dim pos As Integer
		  Dim result() As String
		  
		  sourceMB = source
		  
		  i = 0
		  pos = 0
		  while i < sourceMB.Size
		    
		    select case sourceMB.UInt8Value(i)
		      
		    case 10
		      result.Append sourceMB.StringValue(pos, i - pos)
		      if (i + 1) < sourceMB.Size then
		        if sourceMB.UInt8Value(i + 1) = 13 then
		          i = i + 1
		        end if
		      end if
		      pos = i + 1
		      
		    case 13
		      result.Append sourceMB.StringValue(pos, i - pos)
		      if (i + 1) < sourceMB.Size then
		        if sourceMB.UInt8Value(i + 1) = 10 then
		          i = i + 1
		        end if
		      end if
		      pos = i + 1
		      
		    end select
		    
		    i = i + 1
		  wend
		  
		  if pos < (i - 1) then
		    result.Append sourceMB.StringValue(pos, i - pos)
		  elseif sourceMB.Size > 1 then
		    if (sourceMB.UInt16Value(sourceMB.Size - 2) = &h0d0a) or (sourceMB.UInt16Value(sourceMB.Size - 2) = &h0a0d) then
		      result.Append ""
		    else
		      result.Append sourceMB.StringValue(pos, i - pos)
		    end if
		  elseif sourceMB.Size > 0 then
		    if (sourceMB.UInt8Value(sourceMB.Size - 1) = &h0a) or (sourceMB.UInt8Value(sourceMB.Size - 1) = &h0d) then
		      result.Append ""
		    end if
		  end if
		  
		  // adjust tabs
		  
		  i = 0
		  while i <= result.Ubound
		    result(i) = InsertTabs(result(i))
		    i = i + 1
		  wend
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  actionUndo()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateSelection()
		  if mCursorLine > mStartSelectLine then
		    mSelStartLine = mStartSelectLine
		    mSelStartCol = mStartSelectCol
		    mSelEndLine = mCursorLine
		    mSelEndCol = mCursorCol
		  elseif mCursorLine < mStartSelectLine then
		    mSelStartLine =mCursorLine
		    mSelStartCol = mCursorCol
		    mSelEndLine = mStartSelectLine
		    mSelEndCol = mStartSelectCol
		  elseif mCursorLine = mStartSelectLine then
		    if mCursorCol > mStartSelectCol then
		      mSelStartLine = mStartSelectLine
		      mSelStartCol = mStartSelectCol
		      mSelEndLine = mCursorLine
		      mSelEndCol = mCursorCol
		    else
		      mSelStartLine =mCursorLine
		      mSelStartCol = mCursorCol
		      mSelEndLine = mStartSelectLine
		      mSelEndCol = mStartSelectCol
		    end if
		  end if
		  
		  mSelectedText = ""
		  if (mSelStartLine = mSelEndLine) and (mSelStartCol <> mSelEndCol) then
		    mSelectedText = GetSelectedText()
		    if Instr(0, mSelectedText, " ") > 0 then
		      mSelectedText = ""
		    end if
		  end if
		  
		  UpdateUndo()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateUndo()
		  Dim undoItem As JSONItem
		  
		  if mUndoIndex >= 0 then
		    undoItem = mUndoStack(mUndoIndex)
		    undoItem.Value("cursorline") = mCursorLine
		    undoItem.Value("cursorcol") = mCursorCol
		    undoItem.Value("selstartline") = mSelStartLine
		    undoItem.Value("selstartcol") = mSelStartCol
		    undoItem.Value("selendline") = mSelEndLine
		    undoItem.Value("selendcol") = mSelEndCol
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


	#tag Hook, Flags = &h0
		Event RunSource()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBackgroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBackgroundColor = value
			  //canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		BackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mColorScheme
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mColorScheme = value
			  
			  select case value
			    
			  case ColorSchemeEnum.None
			    
			    mCursorColor = &c000000
			    mSymbolColor = &c000000
			    mTextColor = &c000000
			    mOperatorColor = &c000000
			    mFunctionColor = &c000000
			    mKeywordColor = &c000000
			    mNumberColor = &c000000
			    mStringColor = &c000000
			    mCommentColor = &c000000
			    mTypeColor = &c000000
			    mSelectedHighlightColor = &cffffaa
			    mSelectedHighlightTextColor = &c000000
			    mHighlightColor = &c3399ff
			    mHighlightTextColor = &cffffff
			    mBackgroundColor = &cffffff
			    
			  case ColorSchemeEnum.DefaultDark
			    
			    mCursorColor = &cffffff
			    mSymbolColor = &cffffff
			    mTextColor = &ceee8d5
			    mOperatorColor = &cfdf6e3
			    mFunctionColor = &c6c71c4
			    mKeywordColor = &c268bd2
			    mNumberColor = &cb58900
			    mStringColor = &c859900
			    mCommentColor = &c657b83
			    mTypeColor = &c2aa198
			    mSelectedHighlightColor = &ccb4b16
			    mSelectedHighlightTextColor = &c002b36
			    mHighlightColor = &cfdf6e3
			    mHighlightTextColor = &c002b36
			    mBackgroundColor = &c002b36
			    
			    'mCursorColor = &cffffff
			    'mSymbolColor = &c4dc5db
			    'mTextColor = &ccacaca
			    'mOperatorColor = &cba5ce7
			    'mFunctionColor = &cba5ce7
			    'mKeywordColor = &c4491ff
			    'mNumberColor = &cf04303
			    'mStringColor = &cd70000
			    'mCommentColor = &c00c100
			    'mTypeColor = &cff00ff
			    'mSelectedHighlightColor = &ceeee55
			    'mSelectedHighlightTextColor = &c000000
			    'mHighlightColor = &c3399ff
			    'mHighlightTextColor = &cffffff
			    'mBackgroundColor = &c111111
			    
			  case ColorSchemeEnum.DefaultLight
			    
			    mCursorColor = &c000000
			    mSymbolColor = &c000000
			    mTextColor = &c272727
			    mOperatorColor = &c000000
			    mFunctionColor = &c6c71c4
			    mKeywordColor = &c268bd2
			    mNumberColor = &cb58900
			    mStringColor = &c859900
			    mCommentColor = &c93a1a1
			    mTypeColor = &c2aa198
			    mSelectedHighlightColor = &ccb4b16
			    mSelectedHighlightTextColor = &c002b36
			    mHighlightColor = &c839496
			    mHighlightTextColor = &cfdf6e3
			    mBackgroundColor = &cfdf6e3
			    
			    'mCursorColor = &c000000
			    'mSymbolColor = &c4d94db
			    'mTextColor = &c272727
			    'mOperatorColor = &c800080
			    'mFunctionColor = &c800080
			    'mKeywordColor = &c0000c8
			    'mNumberColor = &cff3100
			    'mStringColor = &cc80000
			    'mCommentColor = &c008000
			    'mTypeColor = &cff00ff
			    'mSelectedHighlightColor = &cffffaa
			    'mSelectedHighlightTextColor = &c000000
			    'mHighlightColor = &c3399ff
			    'mHighlightTextColor = &cffffff
			    'mBackgroundColor = &cffffff
			    
			  end select
			  
			  canTextArea.Invalidate(false)
			  
			End Set
		#tag EndSetter
		ColorScheme As ColorSchemeEnum
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCommentColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCommentColor = value
			End Set
		#tag EndSetter
		CommentColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCursorColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCursorColor = value
			  canTextArea.Invalidate(false)
			  
			End Set
		#tag EndSetter
		CursorColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFunctionColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFunctionColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		FunctionColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private HasFocus As Boolean = false
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim result As Boolean
			  
			  result = false
			  if (mSelStartLine <> mSelEndLine) or (mSelStartCol <> mSelEndCol) then
			    result = true
			  end if
			  
			  return result
			End Get
		#tag EndGetter
		HasSelection As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHighlightColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHighlightColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		HighlightColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHighlightTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHighlightTextColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		HighlightTextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mKeywordColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mKeywordColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		KeywordColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCharWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColorScheme As ColorSchemeEnum
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColStart As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCommentColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCursorCol As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCursorColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCursorLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCursorVisible As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEndBlockComment As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFunctionColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFunctions As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasSelection As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHighlightColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHighlightTextColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKeywordColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKeywords As Dictionary
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

	#tag Property, Flags = &h21
		Private mLineComments As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLines() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineStart As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumberColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOperatorColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOperators As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedHighlightColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedHighlightTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelEndCol As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelEndLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelStartCol As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelStartLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartBlockComment As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartSelectCol As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartSelectLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStringColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStringQuotes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSymbolColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSymbols As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSyntax As SyntaxEnum
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTabSize As Integer = 4
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTempPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextOffset As Integer = 2
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTypeColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTypes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUndoIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUndoStack() As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVisibleLines As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNumberColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNumberColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		NumberColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mOperatorColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mOperatorColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		OperatorColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSelectedHighlightColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectedHighlightColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		SelectedHighlightColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSelectedHighlightTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectedHighlightTextColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		SelectedHighlightTextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim result As String
			  
			  result = PrepText(mLines)
			  result = result.DefineEncoding(Encodings.UTF8)
			  
			  return result
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  scrollVertical.Value =0
			  
			  mLines = SplitSource(value)
			  
			  if mLines.Ubound > 0 then
			    scrollVertical.Maximum = mLines.Ubound - 1
			  else
			    mLines.Append ""
			    scrollVertical.Enabled = false
			  end if
			  
			  SetHorizontalScrollbar()
			  
			  mLineStart = 0
			  mColStart = 0
			  
			  mCursorLine = 0
			  mCursorCol = 0
			  
			  mSelStartLine = 0
			  mSelStartCol = 0
			  mSelEndLine = 0
			  mSelEndCol = 0
			  
			  SaveUndo()
			  
			  canTextArea.Invalidate(false)
			  
			End Set
		#tag EndSetter
		Source As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mStringColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStringColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		StringColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSymbolColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSymbolColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		SymbolColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSyntax
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSyntax = value
			  
			  select case mSyntax
			    
			  case SyntaxEnum.SQLite
			    InitSyntax_SQLite()
			    
			  case SyntaxEnum.Synergy
			    InitSyntax_Synergy()
			    
			  case else
			    mFunctions = new Dictionary()
			    mKeywords = new Dictionary()
			    mLineComments = new Dictionary()
			    mOperators = new Dictionary()
			    mStringQuotes = new Dictionary()
			    mSymbols = new Dictionary()
			    mStartBlockComment = ""
			    mEndBlockComment = ""
			    mTypes = new Dictionary()
			    
			  end select
			  
			End Set
		#tag EndSetter
		Syntax As SyntaxEnum
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextColor = value
			  canTextArea.Invalidate(false)
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTypeColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTypeColor = value
			  canTextArea.Invalidate(false)
			  
			End Set
		#tag EndSetter
		TypeColor As Color
	#tag EndComputedProperty


	#tag Constant, Name = DefaultFont, Type = String, Dynamic = False, Default = \"Courier", Scope = Private
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Courier New"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Monaco"
		#Tag Instance, Platform = Mac Carbon Mach-O, Language = Default, Definition  = \"Monaco"
		#Tag Instance, Platform = Mac Cocoa, Language = Default, Definition  = \"Monaco"
	#tag EndConstant


	#tag Enum, Name = ColorSchemeEnum, Type = Integer, Flags = &h0
		None
		  DefaultLight
		DefaultDark
	#tag EndEnum

	#tag Enum, Name = SyntaxEnum, Type = Integer, Flags = &h0
		SQLite
		Synergy
	#tag EndEnum


#tag EndWindowCode

#tag Events canTextArea
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim i As Integer
		  Dim yPos As Integer
		  Dim inBlockComment As Boolean
		  Dim j As Integer
		  Dim cX As Integer
		  Dim cY As Integer
		  Dim textClip As Graphics
		  
		  g.AntiAlias = true
		  
		  g.TextFont = DefaultFont
		  g.TextUnit = FontUnits.Pixel
		  g.TextSize = 12
		  
		  g.Bold = false
		  g.Italic = false
		  g.Underline = false
		  
		  mCharWidth = g.StringWidth("W")
		  mTextHeight = g.TextHeight
		  mVisibleLines = Ceil(g.Height / mTextHeight)
		  
		  ' clear text area
		  
		  g.ForeColor = mBackgroundColor
		  g.FillRect 0, 0, g.Width, g.Height
		  
		  ' print lines
		  
		  textClip = g.Clip(mTextOffset, 0, g.Width - mTextOffset, g.Height)
		  inBlockComment = false
		  yPos = g.TextAscent
		  i = mLineStart
		  j = 0
		  while (i <= mLines.Ubound) and (j < mVisibleLines)
		    
		    PrintLine textClip, i, yPos, inBlockComment
		    
		    // draw cursor
		    
		    if mCursorVisible and HasFocus and (i = mCursorLine) then
		      if mCursorCol > Len(mLines(mCursorLine)) then
		        cX = mTextOffset + (mCharWidth * (Len(mLines(mCursorLine)) - mColStart))
		      else
		        cX = mTextOffset + (mCharWidth * (mCursorCol - mColStart))
		      end if
		      cY = yPos - g.TextAscent
		      g.ForeColor = mCursorColor
		      g.DrawLine cX, cY, cX, cY + mTextHeight
		    end if
		    
		    yPos = yPos + mTextHeight
		    i = i + 1
		    j = j + 1
		  wend
		  
		  g.ForeColor = &c000000
		  g.DrawRect 0, 0, g.Width, g.Height
		  
		  if mVisibleLines <= mLines.Ubound then
		    scrollVertical.Enabled = true
		  else
		    scrollVertical.Enabled = false
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim line As Integer
		  Dim col As Integer
		  
		  ClearFocus()
		  Self.SetFocus()
		  
		  if IsContextualClick then
		    
		    GetCursorPosition X, Y, line, col
		    
		    if not ( (((line = mSelStartLine) and (col >= mSelStartCol)) or (line > mSelStartLine)) and _
		      (((line = mSelEndLine) and (col <= mSelEndCol)) or (line < mSelEndLine)) ) then
		      
		      SetCursorPosition X, Y
		      
		      mSelStartLine = mCursorLine
		      mSelStartCol = mCursorCol
		      mSelEndLine = mCursorLine
		      mSelEndCol = mCursorCol
		      
		      canTextArea.Invalidate(false)
		      
		    end if
		    
		  else
		    
		    if WasDoubleClick(X, Y) then
		      
		      customDoubleClick(X, Y)
		      
		    else
		      
		      SetCursorPosition X, Y
		      
		      if not Keyboard.ShiftKey then
		        
		        mSelStartLine = mCursorLine
		        mSelStartCol = mCursorCol
		        mSelEndLine = mCursorLine
		        mSelEndCol = mCursorCol
		        
		        mStartSelectLine = mCursorLine
		        mStartSelectCol = mCursorCol
		        
		      end if
		      
		      canTextArea.Invalidate(false)
		      
		      return true
		      
		    end if
		    
		  end if
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Source = ""
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  HandleKeyDown(Key)
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  SetCursorPosition X, Y
		  
		  // update selection values
		  
		  UpdateSelection()
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim mi As MenuItem
		  Dim hasSelection As Boolean
		  Dim c As New Clipboard
		  
		  hasSelection = false
		  if (mSelStartLine <> mSelEndLine) or (mSelStartCol <> mSelEndCol) then
		    hasSelection = true
		  end if
		  
		  mi = new MenuItem()
		  mi.Name = "mnuCut"
		  mi.Text = "Cut"
		  mi.Enabled = hasSelection
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuCopy"
		  mi.Text = "Copy"
		  mi.Enabled = hasSelection
		  base.Append mi
		  
		  
		  mi = new MenuItem()
		  mi.Name = "mnuPaste"
		  mi.Text = "Paste"
		  mi.Enabled = c.Text <> ""
		  base.Append mi
		  
		  mi = new MenuItem()
		  mi.Name = "mnuDelete"
		  mi.Text = "Delete"
		  mi.Enabled = hasSelection
		  base.Append mi
		  
		  c.Close()
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  select case hitItem.Name
		    
		  case "mnuCopy"
		    actionCopy()
		    
		  case "mnuCut"
		    actionCut()
		    
		  case "mnuDelete"
		    actionDelete()
		    
		  case "mnuPaste"
		    actionPaste()
		    
		  end select
		  
		  canTextArea.Invalidate(false)
		End Function
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  Dim scrollStep As Integer
		  
		  scrollStep = deltaY \ 4
		  if (deltaY < 0) and (scrollStep = 0) then
		    scrollStep = -1
		  elseif (deltaY > 0) and (scrollStep = 0) then
		    scrollStep = 1
		  end if
		  
		  scrollVertical.Value = scrollVertical.Value + scrollStep
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events scrollVertical
	#tag Event
		Sub ValueChanged()
		  mLineStart = scrollVertical.Value
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  HandleKeyDown(Key)
		  
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events scrollHorizontal
	#tag Event
		Sub ValueChanged()
		  mColStart = scrollHorizontal.Value
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  HandleKeyDown(Key)
		  
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tmrCursor
	#tag Event
		Sub Action()
		  mCursorVisible = not mCursorVisible
		  
		  canTextArea.Invalidate(false)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
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
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
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
		Name="BackgroundColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ColorScheme"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorSchemeEnum"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - DefaultLight"
			"2 - DefaultDark"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="CommentColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CursorColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FunctionColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasSelection"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HighlightColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HighlightTextColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="KeywordColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
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
		Name="NumberColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="OperatorColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelectedHighlightColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelectedHighlightTextColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Source"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="StringColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
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
		Name="SymbolColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Syntax"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="SyntaxEnum"
		EditorType="Enum"
		#tag EnumValues
			"0 - SQLite"
			"1 - Synergy"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TypeColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
