#tag Class
Protected Class DataSet
	#tag Method, Flags = &h0
		Function GetCSV(header As Boolean, columns() As String) As String()
		  Dim result() As String
		  Dim line() As String
		  Dim i As Integer
		  Dim j As Integer
		  Dim columnIndex() As Integer
		  
		  i = 0
		  while i <= columns.Ubound
		    
		    j = 0
		    while j <= ColumnName.Ubound
		      if StrComp(columns(i), ColumnName(j), 0) = 0 then
		        columnIndex.Append j
		      end if
		      j = j + 1
		    wend
		    
		    i = i + 1
		  wend
		  
		  // header
		  
		  if header then
		    
		    i = 0
		    while i <= columns.Ubound
		      line.Append SmartData.PrepCSVValue(columns(i))
		      i = i + 1
		    wend
		    
		    result.Append Join(line, ",")
		    
		  end if
		  
		  // data
		  
		  i = 0
		  while i <= Rows.Ubound
		    
		    Redim line(-1)
		    
		    j = 0
		    while j <= columns.Ubound
		      line.Append SmartData.PrepCSVValue(Rows(i).Value(columnIndex(j)).Value)
		      j = j + 1
		    wend
		    
		    result.Append Join(line, ",")
		    
		    i = i + 1
		  wend
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetJSON(columns() As String) As JSONItem
		  Dim result As New JSONItem("[]")
		  Dim rowItem As JSONItem
		  Dim i As Integer
		  Dim j As Integer
		  Dim columnIndex() As Integer
		  Dim tmpStr As String
		  Dim tmpDbl As Double
		  Dim tmpInt As Int64
		  i = 0
		  while i <= columns.Ubound
		    
		    j = 0
		    while j <= ColumnName.Ubound
		      if StrComp(columns(i), ColumnName(j), 0) = 0 then
		        columnIndex.Append j
		      end if
		      j = j + 1
		    wend
		    
		    i = i + 1
		  wend
		  
		  // data
		  
		  i = 0
		  while i <= Rows.Ubound
		    
		    rowItem = new JSONItem("{}")
		    
		    j = 0
		    while j <= columns.Ubound
		      tmpStr = Rows(i).Value(columnIndex(j)).Value
		      if IsNumeric(tmpStr) then
		        tmpDbl = Val(tmpStr)
		        if Floor(tmpDbl) = tmpDbl then
		          tmpInt = tmpDbl
		          rowItem.Value(columns(j)) = tmpInt
		        else
		          rowItem.Value(columns(j)) = tmpDbl
		        end if
		      else
		        rowItem.Value(columns(j)) = tmpStr
		      end if
		      j = j + 1
		    wend
		    
		    result.Append rowItem
		    
		    i = i + 1
		  wend
		  
		  return result
		  
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (ColumnName.Ubound + 1)
			  
			End Get
		#tag EndGetter
		ColumnCount As Int64
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ColumnName() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (Rows.Ubound + 1)
			  
			End Get
		#tag EndGetter
		RowCount As Int64
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Rows() As SmartData.Row
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ColumnCount"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowCount"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Untitled"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
