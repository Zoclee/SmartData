#tag Module
Protected Module SmartData
	#tag Method, Flags = &h0
		Function PrepCSVValue(value As String) As String
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

	#tag Method, Flags = &h0
		Function ScalePicture(Extends p as picture, width as integer, height as Integer) As picture
		  Dim res as new picture(width,height)
		  
		  res.Graphics.DrawPicture(p, 0, 0, width, height, 0, 0, p.width, p.height)
		  
		  return res
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitCSV(source As String) As String()
		  Dim i As Integer
		  Dim token() As String
		  Dim result() As String
		  Dim inString As Boolean
		  Dim lastComma As Boolean
		  Dim sourceLen As Integer
		  Dim ch As String
		  
		  sourceLen = Len(source)
		  inString = false
		  lastComma = false
		  i = 1
		  while i <= sourceLen
		    
		    ch = Mid(source, i, 1)
		    
		    if inString then
		      
		      // quote?
		      if ch = """" then
		        inString = false
		        result.Append Join(token, "")
		        redim token(-1)
		        while (i <= sourceLen) and (ch <> ",")
		          ch = Mid(source, i, 1)
		          i = i +1
		        wend
		      else
		        token.Append ch
		      end if
		      
		    else
		      
		      select case ch
		      case "," // comma
		        result.Append Join(token, "")
		        redim token(-1)
		        lastComma = true
		      case else
		        if ch = """" then
		          inString = true
		        else
		          token.Append ch
		        end if
		        lastComma = false
		      end select
		      
		    end if
		    
		    i = i + 1
		  wend
		  
		  if (token.Ubound >= 0) or lastComma then
		    result.Append Join(token, "")
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitQueries(query As String) As String()
		  Dim queryArr() As String
		  Dim queryMB As MemoryBlock
		  Dim inString As Boolean
		  Dim pos As Integer
		  Dim i As Integer
		  Dim openQuote As UInt8
		  
		  queryMB = query
		  
		  pos = 0
		  i = 0
		  while i < queryMB.Size
		    if inString then
		      if queryMB.UInt8Value(i) = openQuote then
		        inString = false
		      end if
		    else
		      if (queryMB.UInt8Value(i) = 39) or (queryMB.UInt8Value(i) = 34) then // ' or "
		        inString = true
		        openQuote = queryMB.UInt8Value(i)
		      elseif queryMB.UInt8Value(i) = 59 then // ;
		        if pos < i then
		          queryArr.Append Trim(queryMB.StringValue(pos, i - pos + 1))
		          pos = i + 1
		        end if
		      end if
		    end if
		    i = i + 1
		  wend
		  
		  if pos < i then
		    queryArr.Append Trim(queryMB.StringValue(pos, i - pos))
		  end if
		  
		  return queryArr
		  
		End Function
	#tag EndMethod


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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
