#tag Window
Begin ContainerControl HexEdit
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
   HelpTag         =   ""
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
   Width           =   300
   Begin ScrollBar scrollData
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   283
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   17
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim maxAddressLen As Integer
		  Dim i As UInt64
		  Dim j As UInt64
		  Dim y As Integer
		  Dim xAddress As Integer
		  Dim xHex As Integer
		  Dim xDump As Integer
		  Dim charWidth As Integer
		  Dim hexStr As String
		  Dim dumpStr As String
		  Dim char As UInt8
		  
		  g.ForeColor = &cffffff
		  g.FillRect 0, 0, g.Width, g.Height
		  
		  if mData <> nil then
		    maxAddressLen = Len(Hex(mData.Size - 1))
		    maxAddressLen = maxAddressLen + (maxAddressLen mod 2)
		  else
		    maxAddressLen = 2
		  end if
		  
		  g.TextFont = mStringShape.TextFont
		  g.TextUnit = mStringShape.TextUnit 
		  g.TextSize = mStringShape.TextSize
		  g.Bold = mStringShape.Bold
		  g.Italic = mStringShape.Italic
		  g.Underline = mStringShape.Underline
		  
		  charWidth = g.StringWidth(" ")
		  xAddress = charWidth
		  xHex = xAddress + (maxAddressLen + 2) * charWidth
		  if xHex < (xAddress + g.StringWidth("Address  ")) then
		    xHex = xAddress + g.StringWidth("Address  ")
		  end if
		  xDump = xHex + g.StringWidth(" ") * 49
		  
		  // print header
		  
		  mStringShape.Text = "Address"
		  g.DrawObject mStringShape, xAddress, 0
		  
		  i = 0
		  while i <= 15
		    mStringShape.Text = Lowercase(Hex(i))
		    g.DrawObject mStringShape, xHex + (i * charWidth * 3) + (charWidth / 2), 0
		    i = i + 1
		  wend
		  
		  mStringShape.Text = "Dump"
		  g.DrawObject mStringShape, xDump, 0
		  
		  // print data lines
		  
		  if mData <> nil then
		    
		    y = g.TextHeight
		    i = mPosition
		    while (i < mData.Size) and (y <= g.Height)
		      
		      mStringShape.Text = Lowercase(Hex(i))
		      while Len(mStringShape.Text) < maxAddressLen
		        mStringShape.Text = "0" + mStringShape.Text
		      wend 
		      g.DrawObject mStringShape, xAddress, y
		      
		      hexStr = ""
		      dumpStr = ""
		      j = i
		      while (j < (i + 16)) and (j < mData.Size)
		        char = mData.UInt8Value(j)
		        if char < 16 then
		          hexStr = hexStr + " 0" + Lowercase(Hex(char))
		        else
		          hexStr = hexStr + " " + Lowercase(Hex(char))
		        end if
		        if char < 32 then
		          dumpStr = dumpStr + "."
		        else
		          dumpStr = dumpStr + Chr(char)
		        end if
		        j = j + 1
		      wend
		      
		      mStringShape.Text = Trim(hexStr)
		      g.DrawObject mStringShape, xHex, y
		      
		      mStringShape.Text = dumpStr
		      g.DrawObject mStringShape, xDump, y
		      
		      i = i + 16
		      y = y + g.TextHeight
		    wend
		    
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  mStringShape = new StringShape()
		  mStringShape.TextFont = "Courier New"
		  mStringShape.TextUnit = FontUnits.Point
		  mStringShape.TextSize = 12
		  mStringShape.Bold = false
		  mStringShape.Italic = false
		  mStringShape.Underline = false
		  mStringShape.VerticalAlignment = StringShape.Alignment.Top
		  mStringShape.HorizontalAlignment = StringShape.Alignment.Left
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim p As new Picture(1, 1)
			  Dim totLines As UInt64
			  
			  mData = value
			  mPosition = 0
			  
			  p.Graphics.TextFont = "Courier New"
			  p.Graphics.TextUnit = FontUnits.Point
			  p.Graphics.TextSize = 12
			  p.Graphics.Bold = false
			  p.Graphics.Italic = false
			  p.Graphics.Underline = false
			  
			  if mData <> nil then
			    totLines = Ceil(mData.Size / 16)
			  else
			    totLines = 0
			  end if
			  if totLines <= 1 then
			    scrollData.Visible = false
			  else
			    scrollData.Visible = true
			    scrollData.Maximum = totLines - 1
			    scrollData.Value = 0
			  end if
			  
			  Self.Invalidate(false)
			  
			End Set
		#tag EndSetter
		Data As MemoryBlock
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPosition As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStringShape As StringShape
	#tag EndProperty


#tag EndWindowCode

#tag Events scrollData
	#tag Event
		Sub ValueChanged()
		  mPosition = scrollData.Value * 16
		  Self.Invalidate(false)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
