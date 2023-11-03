#tag Class
Protected Class SQLGenerator
	#tag Method, Flags = &h0
		Function DumpSQL(tables() As String) As String
		  Dim sql() As String
		  
		  select case SQLFormat
		    
		  case SQLFormatEnum.SQLite
		    if GenerateSchema then
		      generateSQLite_schema sql, tables
		    end if
		    if GenerateData then
		      generateSQLite_data sql, tables
		    end if
		    
		  case SQLFormatEnum.MySQL
		    if GenerateSchema then
		      generateMySQL_schema sql, tables
		    end if
		    if GenerateData then
		      generateMySQL_data sql, tables
		    end if
		    
		  end select
		  
		  return join(sql, "")
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub generateMySQL_data(sql() As String, tableNames() As String)
		  Dim schema As JSONItem
		  Dim tables As JSONItem
		  Dim columns As JSONItem
		  Dim columnNames() As String
		  Dim columnList() As String
		  Dim i As Integer
		  Dim j As Integer
		  Dim t As JSONItem
		  Dim c As JSONItem
		  Dim rows() As String
		  
		  schema = Connector.Schema()
		  
		  // tables
		  
		  tables = new JSONItem("[]")
		  while i <= tableNames.Ubound
		    tables.Append Connector.Table(tableNames(i))
		    i = i + 1
		  wend
		  
		  i = 0
		  while i < tables.Count
		    t = tables.Child(i)
		    
		    columns = t.Lookup("columns", nil)
		    if columns <> nil then
		      
		      Redim columnNames(-1)
		      Redim columnList(-1)
		      j = 0
		      while j < columns.Count
		        c = columns.Child(j)
		        columnNames.Append c.Value("name")
		        columnList.Append "`" + c.Value("name") + "`"
		        
		        j = j + 1
		      wend
		      
		      rows = Connector.GetRows(t.Value("name"), columnNames)
		      if rows.Ubound >= 0 then
		        
		        sql.Append "INSERT INTO `"
		        sql.Append t.Value("name")
		        sql.Append "` ("
		        sql.Append Join(columnList, ", ")
		        sql.Append ") VALUES"
		        sql.Append EndOfLine
		        
		        j = 0
		        while j <= rows.Ubound
		          sql.Append "("
		          sql.Append rows(j)
		          sql.Append ")"
		          j = j + 1
		          if j <= rows.Ubound then
		            sql.Append ","
		            sql.Append EndOfLine
		          end if
		        wend
		        
		        sql.Append ";"
		        sql.Append EndOfLine
		        sql.Append EndOfLine
		        
		      end if
		      
		      
		    end if
		    
		    
		    i = i + 1
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub generateMySQL_schema(sql() As String, tableNames() As String)
		  Dim schema As JSONItem
		  Dim tables As JSONItem
		  Dim indices As JSONItem
		  Dim columns As JSONItem
		  Dim i As Integer
		  Dim j As Integer
		  Dim t As JSONItem
		  Dim c As JSONItem
		  Dim hasPK As Boolean
		  Dim pkCount As Integer
		  Dim ind As JSONItem
		  Dim tableLookup As New Dictionary()
		  
		  schema = Connector.Schema()
		  
		  // tables
		  
		  tables = new JSONItem("[]")
		  while i <= tableNames.Ubound
		    tables.Append Connector.Table(tableNames(i))
		    tableLookup.Value(tableNames(i)) = 1
		    i = i + 1
		  wend
		  
		  i = 0
		  while i < tables.Count
		    t = tables.Child(i)
		    
		    sql.Append "CREATE TABLE `"
		    sql.Append t.Lookup("name", "")
		    sql.Append "` ("
		    sql.Append EndOfLine
		    
		    columns = t.Lookup("columns", nil)
		    if columns <> nil then
		      
		      pkCount = 0
		      j = 0
		      while j < columns.Count
		        c = columns.Child(j)
		        if c.Lookup("pk", false) then
		          pkCount = pkCount + 1
		        end if
		        j = j + 1
		      wend
		      
		      hasPK = false
		      j = 0
		      while j < columns.Count
		        c = columns.Child(j)
		        sql.Append "  `"
		        sql.Append c.Value("name")
		        sql.Append "` "
		        sql.Append c.Value("type")
		        
		        if c.Lookup("pk", false) then
		          hasPK = true
		        end if
		        
		        if c.Lookup("nn", false) then
		          sql.Append " NOT NULL"
		        end if
		        
		        if c.Lookup("pk", false) and (Instr(0, c.Value("type"), "int") > 0) and (pkCount <= 1) then
		          sql.Append " AUTO_INCREMENT"
		        end if
		        
		        if c.Lookup("unique", false) and not c.Lookup("pk", false) then
		          break
		          'sql.Append " UNIQUE"
		        end if
		        
		        j = j + 1
		        if (j < columns.Count) or hasPK then
		          sql.Append ","
		        end if
		        sql.Append EndOfLine
		      wend
		      
		      if hasPK then
		        sql.Append "  PRIMARY KEY ("
		        pkCount = 0
		        j = 0
		        while j < columns.Count
		          c = columns.Child(j)
		          
		          if c.Lookup("pk", false) then
		            if pkCount > 0 then
		              sql.Append ", "
		            end if
		            sql.Append "`"
		            sql.Append c.Value("name")
		            sql.Append "`"
		            pkCount = pkCount + 1
		          end if
		          
		          j = j + 1
		        wend
		        
		        sql.Append ")"
		        sql.Append EndOfLine
		      end if
		      
		    end if
		    
		    sql.Append ") ENGINE=InnoDB;"
		    sql.Append EndOfLine
		    sql.Append EndOfLine
		    
		    i = i + 1
		  wend
		  
		  // indices
		  
		  indices = schema.Lookup("indices", nil)
		  if indices <> nil then
		    
		    i = 0
		    while i < indices.Count
		      ind = indices.Child(i)
		      
		      if tableLookup.HasKey(ind.Lookup("table", "")) then
		        
		        if Left(ind.Lookup("name", ""), 17) <> "sqlite_autoindex_" then
		          
		          sql.Append "CREATE INDEX `"
		          sql.Append ind.Lookup("name", "")
		          sql.Append "` ON `"
		          sql.Append ind.Lookup("table", "")
		          sql.Append "` ("
		          sql.Append EndOfLine
		          
		          columns = ind.Lookup("columns", nil)
		          if columns <> nil then
		            
		            j = 0
		            while j < columns.Count
		              sql.Append "  `"
		              sql.Append columns.Value(j)
		              sql.Append "`"
		              j = j + 1
		              if (j < columns.Count) then
		                sql.Append ","
		              end if
		              sql.Append EndOfLine
		            wend
		            
		          end if
		          
		          sql.Append ");"
		          sql.Append EndOfLine
		          sql.Append EndOfLine
		          
		        end if
		        
		      end if
		      
		      i = i + 1
		    wend
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub generateSQLite_data(sql() As String, tableNames() As String)
		  Dim schema As JSONItem
		  Dim tables As JSONItem
		  Dim columns As JSONItem
		  Dim columnNames() As String
		  Dim columnList() As String
		  Dim i As Integer
		  Dim j As Integer
		  Dim t As JSONItem
		  Dim c As JSONItem
		  Dim rows() As String
		  
		  schema = Connector.Schema()
		  
		  // tables
		  
		  tables = new JSONItem("[]")
		  while i <= tableNames.Ubound
		    tables.Append Connector.Table(tableNames(i))
		    i = i + 1
		  wend
		  
		  i = 0
		  while i < tables.Count
		    t = tables.Child(i)
		    
		    columns = t.Lookup("columns", nil)
		    if columns <> nil then
		      
		      Redim columnNames(-1)
		      Redim columnList(-1)
		      j = 0
		      while j < columns.Count
		        c = columns.Child(j)
		        columnNames.Append c.Value("name")
		        columnList.Append "[" + c.Value("name") + "]"
		        
		        j = j + 1
		      wend
		      
		      rows = Connector.GetRows(t.Value("name"), columnNames)
		      if rows.Ubound >= 0 then
		        
		        sql.Append "INSERT INTO ["
		        sql.Append t.Value("name")
		        sql.Append "] ("
		        sql.Append Join(columnList, ", ")
		        sql.Append ") VALUES"
		        sql.Append EndOfLine
		        
		        j = 0
		        while j <= rows.Ubound
		          sql.Append "("
		          sql.Append rows(j)
		          sql.Append ")"
		          j = j + 1
		          if j <= rows.Ubound then
		            sql.Append ","
		            sql.Append EndOfLine
		          end if
		        wend
		        
		        sql.Append ";"
		        sql.Append EndOfLine
		        sql.Append EndOfLine
		        
		      end if
		      
		    end if
		    
		    i = i + 1
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub generateSQLite_schema(sql() As String, tableNames() As String)
		  Dim schema As JSONItem
		  Dim tables As JSONItem
		  Dim indices As JSONItem
		  Dim columns As JSONItem
		  Dim i As Integer
		  Dim j As Integer
		  Dim t As JSONItem
		  Dim c As JSONItem
		  Dim hasPK As Boolean
		  Dim pkCount As Integer
		  Dim ind As JSONItem
		  Dim tableLookup As New Dictionary()
		  
		  schema = Connector.Schema()
		  
		  // tables
		  
		  tables = new JSONItem("[]")
		  while i <= tableNames.Ubound
		    tables.Append Connector.Table(tableNames(i))
		    tableLookup.Value(tableNames(i)) = 1
		    i = i + 1
		  wend
		  
		  i = 0
		  while i < tables.Count
		    t = tables.Child(i)
		    
		    sql.Append "CREATE TABLE ["
		    sql.Append t.Lookup("name", "")
		    sql.Append "] ("
		    sql.Append EndOfLine
		    
		    columns = t.Lookup("columns", nil)
		    if columns <> nil then
		      
		      hasPK = false
		      j = 0
		      while j < columns.Count
		        c = columns.Child(j)
		        sql.Append "  ["
		        sql.Append c.Value("name")
		        sql.Append "] "
		        sql.Append c.Value("type")
		        
		        if c.Lookup("pk", false) then
		          hasPK = true
		        end if
		        
		        if c.Lookup("nn", false) then
		          sql.Append " NOT NULL"
		        end if
		        
		        if c.Lookup("unique", false) and not c.Lookup("pk", false) then
		          sql.Append " UNIQUE"
		        end if
		        
		        j = j + 1
		        if (j < columns.Count) or hasPK then
		          sql.Append ","
		        end if
		        sql.Append EndOfLine
		      wend
		      
		      if hasPK then
		        sql.Append "  PRIMARY KEY ("
		        pkCount = 0
		        j = 0
		        while j < columns.Count
		          c = columns.Child(j)
		          
		          if c.Lookup("pk", false) then
		            if pkCount > 0 then
		              sql.Append ", "
		            end if
		            sql.Append "["
		            sql.Append c.Value("name")
		            sql.Append "]"
		            pkCount = pkCount + 1
		          end if
		          
		          j = j + 1
		        wend
		        
		        sql.Append ")"
		        sql.Append EndOfLine
		      end if
		      
		    end if
		    
		    sql.Append ");"
		    sql.Append EndOfLine
		    sql.Append EndOfLine
		    
		    i = i + 1
		  wend
		  
		  // indices
		  
		  indices = schema.Lookup("indices", nil)
		  if indices <> nil then
		    
		    i = 0
		    while i < indices.Count
		      ind = indices.Child(i)
		      
		      if tableLookup.HasKey(ind.Lookup("table", "")) then
		        
		        if Left(ind.Lookup("name", ""), 17) <> "sqlite_autoindex_" then
		          
		          sql.Append "CREATE INDEX ["
		          sql.Append ind.Lookup("name", "")
		          sql.Append "] ON ["
		          sql.Append ind.Lookup("table", "")
		          sql.Append "] ("
		          sql.Append EndOfLine
		          
		          columns = ind.Lookup("columns", nil)
		          if columns <> nil then
		            
		            j = 0
		            while j < columns.Count
		              sql.Append "  ["
		              sql.Append columns.Value(j)
		              sql.Append "]"
		              j = j + 1
		              if (j < columns.Count) then
		                sql.Append ","
		              end if
		              sql.Append EndOfLine
		            wend
		            
		          end if
		          
		          sql.Append ");"
		          sql.Append EndOfLine
		          sql.Append EndOfLine
		          
		        end if
		        
		      end if
		      
		      i = i + 1
		    wend
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Connector As SmartData.Connector
	#tag EndProperty

	#tag Property, Flags = &h0
		GenerateData As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		GenerateSchema As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		SQLFormat As SQLFormatEnum
	#tag EndProperty


	#tag Enum, Name = SQLFormatEnum, Type = Integer, Flags = &h0
		SQLite
		MySQL
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="GenerateData"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GenerateSchema"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="SQLFormat"
			Group="Behavior"
			Type="SQLFormatEnum"
			EditorType="Enum"
			#tag EnumValues
				"0 - SQLite"
				"1 - MySQL"
			#tag EndEnumValues
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
	#tag EndViewBehavior
End Class
#tag EndClass
