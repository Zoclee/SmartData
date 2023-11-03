#tag Class
Protected Class SQLiteConnector
Inherits SmartData.Connector
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  if mConnected then
		    mDatabase.SQLExecute("BEGIN TRANSACTION")
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSelection()
		  mRowSelected = new Dictionary()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  if mConnected then
		    mDatabase.Close()
		    mConnected = false
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnType(tableName As String, columnName As String) As String
		  Dim result As String
		  Dim tableItem As JSONItem
		  Dim i As Integer
		  
		  result = ""
		  
		  tableItem = mTableLookup.Lookup(tableName, nil)
		  if tableItem <> nil then
		    i = 0
		    while (i < tableItem.Child("columns").Count) and (result = "")
		      if tableItem.Child("columns").Child(i).Value("name") = columnName then
		        result = tableItem.Child("columns").Child(i).Value("type")
		      end if
		      i = i + 1
		    wend
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Commit()
		  if mConnected then
		    mDatabase.Commit()
		    mDataChanged = false
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connected() As Boolean
		  return mConnected
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectionType() As String
		  return "SQLite"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(DatabaseFile As FolderItem, EncryptionKey As String)
		  Dim n As Integer
		  
		  mErrorCode = 0
		  mConnected = false
		  mDataChanged = false
		  mRowsAffected = 0
		  
		  mDatabase = New SQLiteDatabase()
		  mDatabase.DatabaseFile = DatabaseFile
		  mDatabase.EncryptionKey = EncryptionKey
		  
		  if mDatabase.Connect() then
		    
		    mConnected = true
		    RefreshSchema()
		    
		  else
		    
		    if mDatabase.ErrorCode = 26 then
		      mErrorCode = 1 // Authentication failed
		    else
		      n = MsgBox(mDatabase.ErrorMessage, 16, "Database Connection Error")
		      mConnected = false
		      mDatabase = nil
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateIndex(tableName As String, columns() As String, indexName As String) As Boolean
		  Dim result As Boolean
		  Dim query() As String
		  Dim n As Integer
		  Dim i As Integer
		  
		  result = false
		  
		  if mConnected then
		    
		    // CREATE INDEX
		    
		    query.Append "CREATE INDEX ["
		    query.Append indexName
		    query.Append "] ON ["
		    query.Append tableName
		    query.Append "] ("
		    
		    i = 0
		    while i <= columns.Ubound
		      if i > 0 then
		        query.Append ", "
		      end if
		      query.Append "["
		      query.Append columns(i)
		      query.Append "]"
		      i = i + 1
		    wend
		    
		    query.Append ");"
		    
		    mDatabase.SQLExecute(Join(query, ""))
		    
		    if mDatabase.Error then
		      n = MsgBox (mDatabase.ErrorMessage, 48, "Table Error")
		    else
		      RefreshSchemaIndices()
		      result = true
		    end if
		    
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateTable(tableSchema As JSONItem) As Boolean
		  Dim result As Boolean
		  Dim query() As String
		  Dim n As Integer
		  Dim i As Integer
		  Dim cols As JSONItem
		  Dim colItem As JSONItem
		  Dim colType As String
		  Dim colName As String
		  Dim colDefault As String
		  Dim primaryKeys() As String
		  
		  result = false
		  
		  if mConnected then
		    
		    // CREATE TABLE
		    
		    query.Append "CREATE TABLE ["
		    query.Append tableSchema.Value("name")
		    query.Append "] ("
		    
		    cols = tableSchema.Child("columns")
		    
		    i = 0
		    while i < cols.Count
		      
		      colItem = cols.Child(i)
		      colName = colItem.Value("name")
		      colType = colItem.Value("type")
		      
		      if i > 0 then
		        query.Append ","
		      end if
		      
		      query.Append "["
		      query.Append colName
		      query.Append "] "
		      query.Append colType
		      
		      if colItem.Value("pk") then
		        primaryKeys.Append "[" + colName + "]"
		      end if
		      
		      if colItem.Value("unique") then
		        query.Append " UNIQUE"
		      end if
		      
		      if colItem.Value("nn") then
		        query.Append " NOT NULL"
		      end if
		      
		      if colType <> "BLOB" then
		        colDefault = colItem.Value("default")
		        if colDefault <> "" then
		          
		          query.Append " DEFAULT "
		          
		          select case colType
		            
		          case "INTEGER", "REAL"
		            query.Append colDefault
		            
		          case "TEXT"
		            query.Append "'"
		            query.Append colDefault
		            query.Append "'"
		            
		          case else
		            
		            if (left(colType, 4) = "TEXT") or (left(colType, 4) = "CHAR") then
		              query.Append "'"
		              query.Append colDefault
		              query.Append "'"
		            else
		              break
		            end if
		            
		          end select
		          
		        end if
		        
		      end if
		      
		      i = i + 1
		    wend
		    
		    // primary key table constraint
		    
		    if primaryKeys.Ubound >= 0 then
		      query.Append ",PRIMARY KEY ("
		      i = 0
		      while i <= primaryKeys.Ubound
		        
		        if i > 0 then
		          query.Append ","
		        end if
		        
		        query.Append primaryKeys(i)
		        
		        i = i + 1
		      wend
		      query.Append ")"
		    end if
		    
		    query.Append ");"
		    
		    mDatabase.SQLExecute(Join(query, ""))
		    
		    if mDatabase.Error then
		      n = MsgBox (mDatabase.ErrorMessage, 48, "Table Error")
		    else
		      RefreshSchemaTables()
		      result = true
		    end if
		    
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatabaseName() As String
		  Return mDatabase.DatabaseFile.Name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataChanged() As Boolean
		  return mDataChanged
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteIndex(indexName As String) As Boolean
		  Dim result As Boolean
		  Dim query() As String
		  Dim n As Integer
		  
		  result = false
		  
		  if mConnected then
		    
		    query.Append "DROP INDEX ["
		    query.Append indexName
		    query.Append "];"
		    
		    mDatabase.SQLExecute(Join(query, ""))
		    
		    if mDatabase.Error then
		      n = MsgBox (mDatabase.ErrorMessage, 48, "Update Error")
		    else
		      mDataChanged = true
		      result = true
		      RefreshSchemaIndices()
		    end if
		    
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteSelectedRows()
		  Dim query() As String
		  Dim i As Integer
		  Dim rowid As Int64
		  
		  if mConnected and (mRowSelected <> nil) then
		    
		    if mRowSelected.Keys.Ubound >= 0 then
		      
		      i = 0
		      while i <= mRowSelected.Keys.Ubound
		        
		        rowid = mRowSelected.Key(i)
		        query.Append "DELETE FROM ["
		        query.Append mCurrentTable
		        query.Append "] WHERE (rowid="
		        query.Append mRowLookup.Value(rowid)
		        query.Append ");"
		        
		        i = i + 1
		      wend
		      
		      mDatabase.SQLExecute(Join(query, ""))
		      
		      mRowSelected = new Dictionary()
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteTable(tableName As String) As Boolean
		  Dim result As Boolean
		  Dim query() As String
		  Dim n As Integer
		  
		  result = false
		  
		  if mConnected then
		    
		    query.Append "DROP TABLE ["
		    query.Append tableName
		    query.Append "];"
		    
		    mDatabase.SQLExecute(Join(query, ""))
		    
		    if mDatabase.Error then
		      n = MsgBox (mDatabase.ErrorMessage, 48, "Update Error")
		    else
		      mDataChanged = true
		      result = true
		      RefreshSchemaTables()
		    end if
		    
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorCode() As Integer
		  return mErrorCode
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Execute(query As String) As SmartData.DataSet
		  Dim result As new SmartData.DataSet
		  Dim rs As RecordSet
		  Dim rsAffected As RecordSet
		  Dim i As Integer
		  'Dim rows() As SmartData.Row
		  Dim row As SmartData.Row
		  Dim field As SmartData.Field
		  Dim n As Integer
		  
		  if mConnected then
		    
		    rs = mDatabase.SQLSelect(query)
		    if mDatabase.Error then
		      n = MsgBox(mDatabase.ErrorMessage,  16, "Query Error")
		    elseif rs <> nil then
		      rs.MoveFirst
		      while not rs.EOF
		        
		        if result.ColumnCount <= 0 then
		          
		          i = 0
		          while i < rs.FieldCount
		            result.ColumnName.Append rs.IdxField(i + 1).Name
		            i = i + 1
		          wend
		          
		        end if
		        
		        row = new SmartData.Row
		        
		        i = 0
		        while i < rs.FieldCount
		          
		          field = new SmartData.Field()
		          
		          if rs.IdxField(i + 1).Value = nil then
		            field.Value = "NULL"
		            field.IsNull = true
		            'if ColumnType(tableName, rs.IdxField(i + 1).Name) = "BLOB" then
		            'field.IsBinary = true
		            'end if
		            
		            'elseif ColumnType(tableName, rs.IdxField(i + 1).Name) = "BLOB" then
		            'field.Value = "BLOB"
		            'field.IsBinary = true
		            '
		            'blob = mDatabase.OpenBlob(tableName, rs.IdxField(i + 1).Name, rs.Field("rowid").Int64Value, false)
		            'if blob = nil then
		            'blobMB = new MemoryBlock(0)
		            'else
		            'blobMB = blob.Read(blob.Length)
		            'blob.Close()
		            'end if
		            'field.Binary = blobMB
		            
		          else
		            field.Value = rs.IdxField(i + 1).StringValue
		          end if
		          
		          row.Value.Append field
		          
		          i = i + 1
		        wend
		        
		        result.Rows.Append row
		        
		        rs.MoveNext
		        i = i + 1
		      wend
		      
		      rs.Close()
		    end if
		    
		    mRowsAffected =0
		    rsAffected = mDatabase.SQLSelect("SELECT changes() AS Affected;")
		    if rsAffected <> nil then
		      if rsAffected.RecordCount > 0 then
		        rsAffected.MoveFirst
		        mRowsAffected = rsAffected.Field("Affected").Int64Value
		      end if
		    end if
		    
		    if (mRowsAffected > 0) or (InStr(0, query, "create") > 0) or (InStr(0, query, "drop") > 0) then
		      mDataChanged = true
		      RefreshSchemaTables()
		      RefreshSchemaIndices()
		    end if
		    
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCSV(tableName As String, header As Boolean, columns() As String, filter As String="") As String()
		  Dim result() As String
		  Dim line() As String
		  Dim i As Integer
		  Dim rs As RecordSet
		  Dim query As String
		  Dim columnTypes() As String
		  
		  i = 0 
		  while i <= columns.Ubound
		    columnTypes.Append ColumnType(tableName, columns(i))
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
		  
		  if filter <> "" then
		    query = "SELECT * FROM [" + tableName + "] WHERE (" + filter + ");"
		  else
		    query = "SELECT * FROM [" + tableName + "];"
		  end if
		  
		  rs = mDatabase.SQLSelect(query)
		  if rs <> nil then
		    rs.MoveFirst
		    while not rs.EOF
		      
		      Redim line(-1)
		      
		      i = 0
		      while i <= columns.Ubound
		        if rs.Field(columns(i)).Value = nil then
		          line.Append ""
		        elseif columnTypes(i) = "BLOB" then
		          line.Append EncodeBase64(rs.Field(columns(i)).Value, 0)
		        else
		          line.Append SmartData.PrepCSVValue(rs.Field(columns(i)).StringValue)
		        end if
		        i = i + 1
		      wend
		      
		      result.Append Join(line, ",")
		      
		      rs.MoveNext
		    wend
		    
		    rs.Close()
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetJSON(tableName As String, columns() As String, filter As String="") As JSONItem
		  Dim result As New JSONItem("[]")
		  Dim rowItem As JSONItem
		  Dim i As Integer
		  Dim rs As RecordSet
		  Dim query As String
		  Dim columnTypes() As String
		  
		  i = 0 
		  while i <= columns.Ubound
		    columnTypes.Append ColumnType(tableName, columns(i))
		    i = i + 1
		  wend
		  
		  // data
		  
		  if filter <> "" then
		    query = "SELECT * FROM [" + tableName + "] WHERE (" + filter + ");"
		  else
		    query = "SELECT * FROM [" + tableName + "];"
		  end if
		  
		  rs = mDatabase.SQLSelect(query)
		  if rs <> nil then
		    rs.MoveFirst
		    while not rs.EOF
		      
		      rowItem = new JSONItem("{}")
		      
		      i = 0
		      while i <= columns.Ubound
		        if rs.Field(columns(i)).Value = nil then
		          rowItem.Value(columns(i)) = ""
		        elseif columnTypes(i) = "BLOB" then
		          rowItem.Value(columns(i)) = EncodeBase64(rs.Field(columns(i)).Value, 0)
		        else
		          rowItem.Value(columns(i)) = rs.Field(columns(i)).Value
		        end if
		        i = i + 1
		      wend
		      
		      result.Append rowItem
		      
		      rs.MoveNext
		    wend
		    
		    rs.Close()
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPage(tableName As String, rowOffset As Int64, pageSize As Int64, filter As String = "", orderByColumn As String = "", orderDesc As Boolean = false) As SmartData.Row()
		  Dim rs As RecordSet
		  Dim blob As SQLiteBlob
		  Dim blobMB As MemoryBlock
		  Dim i As Integer
		  Dim query As String
		  Dim rows() As SmartData.Row
		  Dim row As SmartData.Row
		  Dim field As SmartData.Field
		  Dim currentRow As Int64
		  
		  if mConnected then
		    
		    if tableName <> mCurrentTable then
		      mRowLookup = new Dictionary()
		      mRowSelected = new Dictionary()
		      mCurrentTable = tableName
		    end if
		    
		    if filter <> "" then
		      query = "SELECT rowid AS rowid, * FROM [" + tableName + "] WHERE (" + filter + ")"
		    else
		      query = "SELECT rowid AS rowid, * FROM [" + tableName + "]"
		    end if
		    
		    if orderByColumn <> "" then
		      if orderDesc then
		        query = query + " ORDER BY [" + orderByColumn + "] DESC"
		      else
		        query = query + " ORDER BY [" + orderByColumn + "]"
		      end if
		    end if
		    
		    query = query + " LIMIT " + Str(pageSize) + " OFFSET " + Str(rowOffset) + ";"
		    
		    currentRow = rowOffset
		    rs = mDatabase.SQLSelect(query)
		    if rs <> nil then
		      rs.MoveFirst
		      while not rs.EOF
		        
		        row = new SmartData.Row
		        row.RowIndex = currentRow
		        mRowLookup.Value(currentRow) = rs.Field("rowid").Int64Value
		        
		        i = 1
		        while i < rs.FieldCount
		          
		          field = new SmartData.Field()
		          
		          if rs.IdxField(i + 1).Value = nil then
		            field.Value = "NULL"
		            field.IsNull = true
		            if ColumnType(tableName, rs.IdxField(i + 1).Name) = "BLOB" then
		              field.IsBinary = true
		            end if
		            
		          elseif ColumnType(tableName, rs.IdxField(i + 1).Name) = "BLOB" then
		            field.Value = "BLOB"
		            field.IsBinary = true
		            
		            blob = mDatabase.OpenBlob(tableName, rs.IdxField(i + 1).Name, rs.Field("rowid").Int64Value, false)
		            if blob = nil then
		              blobMB = new MemoryBlock(0)
		            else
		              blobMB = blob.Read(blob.Length)
		              blob.Close()
		            end if
		            field.Binary = blobMB
		            
		          else
		            field.Value = rs.IdxField(i + 1).StringValue
		          end if
		          
		          row.Value.Append field
		          
		          i = i + 1
		        wend
		        
		        rows.Append row
		        
		        rs.MoveNext
		        currentRow = currentRow + 1
		        i = i + 1
		      wend
		      
		      rs.Close()
		    end if
		    
		  end if
		  
		  return rows
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRows(tableName As String, columns() As String) As String()
		  Dim result() As String
		  Dim line() As String
		  Dim i As Integer
		  Dim rs As RecordSet
		  Dim query As String
		  Dim columnTypes() As String
		  
		  i = 0 
		  while i <= columns.Ubound
		    columnTypes.Append ColumnType(tableName, columns(i))
		    i = i + 1
		  wend
		  
		  // data
		  
		  query = "SELECT * FROM [" + tableName + "];"
		  
		  rs = mDatabase.SQLSelect(query)
		  if rs <> nil then
		    rs.MoveFirst
		    while not rs.EOF
		      
		      Redim line(-1)
		      
		      i = 0
		      while i <= columns.Ubound
		        if rs.Field(columns(i)).Value = nil then
		          line.Append "NULL"
		        elseif columnTypes(i) = "BLOB" then
		          line.Append EncodeBase64(rs.Field(columns(i)).Value, 0)
		        else
		          
		          if Instr(0, ColumnTypes(i), "INT") > 0 then
		            line.Append rs.Field(columns(i)).StringValue
		          elseif (Instr(0, ColumnTypes(i), "REAL") > 0) or (Instr(0, ColumnTypes(i), "FLOA") > 0) or (Instr(0, ColumnTypes(i), "DOUB") > 0) then
		            line.Append rs.Field(columns(i)).StringValue
		          else
		            line.Append "'" + ReplaceAll(rs.Field(columns(i)).StringValue, "'", "''") + "'"
		          end if
		          
		        end if
		        i = i + 1
		      wend
		      
		      result.Append Join(line, ",")
		      
		      rs.MoveNext
		    wend
		    
		    rs.Close()
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImportCSV(tableName As String, columnNames() As String, lines() As String) As Boolean
		  Dim result As Boolean
		  Dim n As Integer
		  Dim uniqueName As Boolean
		  Dim rs As RecordSet
		  Dim query() As String
		  Dim i As Integer
		  Dim j As Integer
		  Dim errorCount As Integer
		  Dim columnList As String
		  Dim tmpArr() As String
		  
		  result = false
		  
		  if mConnected then
		    
		    uniqueName = true
		    rs = mDatabase.SQLSelect("SELECT name FROM sqlite_master WHERE type='table' AND name='" + tableName + "';")
		    if rs <> nil then
		      if rs.RecordCount > 0 then
		        uniqueName = false
		      end if
		      rs.Close()
		    end if
		    
		    if uniqueName then
		      
		      // CREATE TABLE
		      
		      query.Append "CREATE TABLE ["
		      query.Append tableName
		      query.Append "] ("
		      
		      columnList = ""
		      i = 0
		      while i <= columnNames.Ubound
		        
		        if i > 0 then
		          columnList = columnList  + ","
		          query.Append ","
		        end if
		        columnList = columnList  + "["
		        columnList = columnList  + columnNames(i)
		        columnList = columnList  + "]"
		        
		        query.Append  "["
		        query.Append  columnNames(i)
		        query.Append  "] TEXT"
		        
		        i = i + 1
		      wend
		      
		      query.Append ");"
		      
		      mDatabase.SQLExecute(Join(query, ""))
		      
		      if mDatabase.Error then
		        n = MsgBox (mDatabase.ErrorMessage, 48, "Import Error")
		      else
		        
		        // IMPORT ROWS
		        
		        i = 0
		        errorCount = 0
		        
		        while i <= Lines.Ubound
		          
		          Redim query(-1)
		          
		          query.Append "INSERT INTO ["
		          query.Append tableName
		          query.Append "] ("
		          query.Append columnList
		          
		          query.Append") VALUES ("
		          
		          tmpArr = SplitCSV(Lines(i))
		          
		          j = 0
		          while j <= tmpArr.Ubound
		            if j > 0 then
		              query.Append ","
		            end if
		            query.Append "'"
		            query.Append PrepTEXT(tmpArr(j))
		            query.Append "'"
		            j = j + 1
		          wend
		          
		          query.Append ");"
		          
		          
		          mDatabase.SQLExecute(Join(query, ""))
		          if mDatabase.Error then
		            errorCount = errorCount + 1
		          end if
		          
		          i = i + 1
		        wend
		        
		        mDataChanged = true
		        RefreshSchemaTables()
		        result = true
		        
		        if errorCount = 1 then
		          n = MsgBox("Detected 1 error during import.", 48, "Import CSV")
		        elseif errorCount > 1 then
		          n = MsgBox("Detected " + Str(errorCount) + " errors during import.", 48, "Import CSV")
		        end if
		        
		      end if
		      
		    else
		      
		      n = MsgBox("A table with the given name already exists." + EndOfLine + "Please provide a different name for the table.", 48, "Import CSV")
		      
		    end if
		    
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Index(indexIndex As Integer) As JSONItem
		  return mSchema.Child("indices").Child(indexIndex)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Index(indexName As String) As JSONItem
		  Dim indexItem As JSONItem
		  
		  indexItem = mIndexLookup.Lookup(indexName, nil)
		  
		  return indexItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexCount() As Integer
		  return mSchema.Child("indices").Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertRow(tableName As String) As Boolean
		  Dim result As Boolean
		  Dim tableItem As JSONItem
		  Dim query() As String
		  Dim i As Integer
		  Dim colInfo As JSONItem
		  Dim colName() As String
		  Dim colValue() As String
		  Dim n As Integer
		  
		  result = false
		  
		  if mConnected then
		    
		    tableItem = mTableLookup.Lookup(tableName, nil)
		    if tableItem <> nil then
		      
		      i = 0 
		      while i < tableItem.Child("columns").Count
		        
		        colInfo = tableItem.Child("columns").Child(i)
		        
		        if colInfo.Value("nn") and (colInfo.Value("default") = "") and not colInfo.Value("pk") then
		          
		          colName.Append colInfo.Value("name")
		          colValue.Append "''"
		          
		        elseif colInfo.Value("unique") and (colInfo.Value("default") <> "") then
		          
		          colName.Append colInfo.Value("name")
		          colValue.Append "NULL"
		          
		        end if
		        
		        i = i + 1
		      wend
		      
		      if colName.Ubound >= 0 then
		        
		        query.Append "INSERT INTO ["
		        query.Append tableName
		        query.Append "] ("
		        
		        i = 0
		        while i <= colName.Ubound
		          if i > 0 then
		            query.Append ","
		          end if
		          query.Append "["
		          query.Append colName(i)
		          query.Append "]"
		          i = i + 1
		        wend
		        
		        query.Append ") VALUES ("
		        
		        i = 0
		        while i <= colValue.Ubound
		          if i > 0 then
		            query.Append ","
		          end if
		          query.Append colValue(i)
		          i = i + 1
		        wend
		        
		        query.Append ");"
		        
		      else
		        
		        query.Append "INSERT INTO ["
		        query.Append tableName
		        query.Append "] DEFAULT VALUES;"
		        
		      end if
		      
		      mDatabase.SQLExecute(Join(query, ""))
		      
		      if mDatabase.Error then
		        n = MsgBox (mDatabase.ErrorMessage, 48, "Insert Row Error")
		      else
		        mDataChanged = true
		        result = true
		      end if
		      
		    end if
		    
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrepTEXT(value As String) As String
		  Dim result As String
		  
		  result = ReplaceAll(value, "'", "''")
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshSchema()
		  Dim tableList As JSONItem
		  Dim indexList As JSONItem
		  
		  mSchema = new JSONItem("{}")
		  tableList = new JSONItem("[]")
		  indexList = new JSONItem("[]")
		  mSchema.Value("tables") = tableList
		  mSchema.Value("indices") = indexList
		  
		  RefreshSchemaTables()
		  RefreshSchemaIndices()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshSchemaIndices()
		  Dim rs As RecordSet
		  Dim rsCol As RecordSet
		  Dim indices As JSONItem
		  Dim indexItem As JSONItem
		  
		  mIndexLookup = new Dictionary()
		  
		  indices = new JSONItem("[]")
		  mSchema.Value("indices") = indices
		  
		  rs = mDatabase.SQLSelect("SELECT name, tbl_name FROM sqlite_master WHERE type='index' ORDER BY name;")
		  if rs <> nil then
		    
		    rs.MoveFirst
		    while not rs.EOF
		      
		      indexItem = new JSONItem("{}")
		      indexItem.Value("name") = rs.Field("name").StringValue
		      indexItem.Value("table") = rs.Field("tbl_name").StringValue
		      indexItem.Value("columns") = new JSONItem("[]")
		      
		      rsCol = mDatabase.SQLSelect("PRAGMA index_info('" + rs.Field("name").StringValue + "');")
		      if rsCol <> nil then
		        rsCol.MoveFirst
		        while not rsCol.EOF
		          indexItem.Child("columns").Append rsCol.Field("name").StringValue
		          rsCol.MoveNext
		        wend
		      end if
		      
		      indices.Append indexItem
		      mIndexLookup.Value(rs.Field("name").StringValue) = indexItem
		      
		      rs.MoveNext
		    wend
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshSchemaTables()
		  Dim i As Integer
		  Dim rs As RecordSet
		  Dim rsUnique As RecordSet
		  Dim tables() As String
		  Dim tableList As JSONItem
		  Dim tableItem As JSONItem
		  Dim colList As JSONItem
		  Dim colItem As JSONItem
		  Dim uniqueCols As new Dictionary()
		  
		  mTableLookup = new Dictionary()
		  
		  tableList = new JSONItem("[]")
		  mSchema.Value("tables") = tableList
		  
		  rs = mDatabase.SQLSelect("SELECT name FROM sqlite_master WHERE (type='table') AND (name NOT LIKE 'sqlite_%') ORDER BY name;")
		  
		  if rs <> nil then
		    
		    rs.MoveFirst
		    while not rs.EOF
		      tables.Append rs.Field("name").StringValue
		      rs.MoveNext
		    wend
		    rs.Close()
		    
		    i = 0 
		    while i <= tables.Ubound
		      
		      tableItem = new JSONItem("{}")
		      tableItem.Value("name") = tables(i)
		      
		      // get unique constraints
		      
		      rs = mDatabase.SQLSelect("PRAGMA index_list([" + tables(i) + "]);")
		      if rs <> nil then
		        rs.MoveFirst
		        while not rs.EOF
		          
		          if rs.Field("unique").IntegerValue <> 0 then
		            
		            rsUnique = mDatabase.SQLSelect("PRAGMA index_info([" + rs.Field("name").StringValue + "]);")
		            if rsUnique <> nil then
		              rsUnique.MoveFirst
		              while not rsUnique.EOF
		                uniqueCols.Value(rsUnique.Field("name").StringValue) = 1
		                rsUnique.MoveNext
		              wend
		            end if
		            
		          end if
		          
		          rs.MoveNext
		        wend
		      end if
		      
		      rs = mDatabase.SQLSelect("PRAGMA table_info([" + tables(i) + "]);")
		      if rs <> nil then
		        
		        //{""name"":""Column1"",""type"":""INTEGER"",""pk"":false,""nn"":false,""unique"":false,""default"":""""}
		        
		        colList = new JSONItem("[]")
		        tableItem.Value("columns") = colList
		        
		        rs.MoveFirst
		        while not rs.EOF
		          
		          colItem = new JSONItem("{}")
		          colItem.Value("name") = rs.Field("name").StringValue
		          colItem.Value("type") = rs.Field("type").StringValue
		          if rs.Field("pk").IntegerValue = 0 then
		            colItem.Value("pk") = false
		          else
		            colItem.Value("pk") = true
		          end if
		          if rs.Field("notnull").IntegerValue = 0 then
		            colItem.Value("nn") = false
		          else
		            colItem.Value("nn") = true
		          end if
		          
		          colItem.Value("unique") = uniqueCols.HasKey(rs.Field("name").StringValue)
		          colItem.Value("default") = rs.Field("dflt_value").StringValue
		          
		          colList.Append colItem
		          rs.MoveNext
		          
		        wend
		        
		        rs.Close()
		        
		      end if
		      
		      tableList.Append tableItem
		      mTableLookup.Value(tables(i)) = tableItem
		      
		      i = i + 1
		    wend
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenameTable(tableName As String, newName As String) As Boolean
		  Dim result As Boolean
		  Dim query() As String
		  Dim n As Integer
		  
		  result = false
		  
		  if newName <> "" then
		    
		    if StrComp(newName, tableName, 0) <> 0 then
		      
		      query.Append "ALTER TABLE ["
		      query.Append tableName
		      query.Append "] RENAME TO ["
		      query.Append newName
		      query.Append "];"
		      
		      mDatabase.SQLExecute(Join(query, ""))
		      
		      if mDatabase.Error then
		        n = MsgBox (mDatabase.ErrorMessage, 48, "Update Error")
		      else
		        mDataChanged = true
		        result = true
		        RefreshSchemaTables()
		      end if
		      
		    end if
		    
		  end if
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rollback()
		  if mConnected then
		    mDatabase.Rollback()
		    mDataChanged = false
		    RefreshSchema()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowCount(tableName As String) As Int64
		  Dim result As Integer
		  Dim query As String
		  Dim rs As RecordSet
		  
		  result = 0
		  query = "SELECT COUNT(*) AS RowCount FROM [" + tableName + "];"
		  rs = mDatabase.SQLSelect(query)
		  if rs <> nil then
		    rs.MoveFirst
		    result = rs.Field("RowCount").Int64Value
		    rs.Close
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowsAffected() As Int64
		  return mRowsAffected
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowSelected(rowIndex As Int64) As Boolean
		  Dim result As Boolean
		  
		  result = false
		  if mRowSelected <> nil then
		    result = mRowSelected.HasKey(rowIndex)
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowSelected(rowIndex As Int64, Assigns value As Boolean)
		  if mRowSelected <> nil then
		    if value then
		      mRowSelected.Value(rowIndex) = true
		    elseif mRowSelected.HasKey(rowIndex) then
		      mRowSelected.Remove(rowIndex)
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Schema() As JSONItem
		  return mSchema
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAllRows()
		  Dim i As Int64
		  Dim cnt As Int64
		  
		  if mRowSelected <> nil then
		    
		    cnt = RowCount(mCurrentTable)
		    i = 0
		    while i < cnt
		      mRowSelected.Value(i) = true
		      i = i + 1
		    wend
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRowCount() As Int64
		  Dim result As Int64
		  
		  result = 0
		  if mRowSelected <> nil then
		    result = mRowSelected.Keys.Ubound + 1
		  end if
		  
		  return result
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShiftSelectRows(rowIndex As Int64)
		  Dim startIndex As Int64
		  Dim foundIndex As Boolean
		  Dim i As Int64
		  
		  if mRowSelected <> nil then
		    
		    startIndex = rowIndex - 1
		    foundIndex = false
		    while (startIndex >= 0) and not foundIndex
		      if mRowSelected.HasKey(startIndex) then
		        foundIndex = true
		      else
		        startIndex = startIndex - 1
		      end if
		    wend
		    
		    if foundIndex then
		      i = startIndex
		      while i <= rowIndex
		        mRowSelected.Value(i) = true
		        i = i + 1
		      wend
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Table(tableIndex As Integer) As JSONItem
		  return mSchema.Child("tables").Child(tableIndex)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Table(tableName As String) As JSONItem
		  Dim tableItem As JSONItem
		  
		  tableItem = mTableLookup.Lookup(tableName, nil)
		  
		  return tableItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableCount() As Integer
		  return mSchema.Child("tables").Count
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleRowSelection(rowIndex As Int64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UpdateTable(tableSchema As JSONItem) As Boolean
		  Dim result As Boolean
		  Dim query() As String
		  Dim n As Integer
		  Dim i As Integer
		  Dim cols As JSONItem
		  Dim colItem As JSONItem
		  Dim colType As String
		  Dim colName As String
		  Dim colDefault As String
		  Dim primaryKeys() As String
		  Dim tempTable As String
		  Dim uniqueTempTable As Boolean
		  Dim rs As RecordSet
		  Dim toColList() As String
		  Dim fromColList() As String
		  Dim copyFromColList() As String
		  Dim copyToColList() As String
		  Dim tmpStr As String
		  
		  result = false
		  
		  if mConnected then
		    
		    tempTable = tableSchema.Value("name")
		    do
		      uniqueTempTable = true
		      tempTable = "_" + tempTable
		      rs = mDatabase.SQLSelect("SELECT name FROM sqlite_master WHERE type='table' AND name='" + tempTable + "';")
		      if rs <> nil then
		        if rs.RecordCount > 0 then
		          uniqueTempTable = false
		        end if
		        rs.Close()
		      end if
		    loop until uniqueTempTable
		    
		    // PRAGMA foreign_keys=off;
		    
		    mDatabase.SQLExecute("PRAGMA foreign_keys=off;")
		    
		    // CREATE TABLE
		    
		    query.Append "CREATE TABLE ["
		    query.Append tableSchema.Value("name")
		    query.Append "] ("
		    
		    cols = tableSchema.Child("columns")
		    
		    i = 0
		    while i < cols.Count
		      
		      colItem = cols.Child(i)
		      colName = colItem.Value("name")
		      colType = colItem.Value("type")
		      
		      toColList.Append "[" + colName + "]"
		      
		      'if colItem.HasName("current") then
		      if colItem.HasName("currentname") then
		        'tmpStr = colItem.Child("current").Value("name")
		        tmpStr = colItem.Value("currentname")
		        copyFromColList.Append "[" + tmpStr + "] AS [" + colName + "]"
		        copyToColList.Append "[" + colName + "]"
		      else
		        tmpStr = colItem.Value("name")
		      end if
		      
		      fromColList.Append "[" + tmpStr + "] AS [" + colName + "]"
		      
		      if i > 0 then
		        query.Append ","
		      end if
		      
		      query.Append "["
		      query.Append colName
		      query.Append "] "
		      query.Append colType
		      
		      if colItem.Value("pk") then
		        primaryKeys.Append "[" + colName + "]"
		      end if
		      
		      if colItem.Value("unique") then
		        query.Append " UNIQUE"
		      end if
		      
		      if colItem.Value("nn") then
		        query.Append " NOT NULL"
		      end if
		      
		      if colType <> "BLOB" then
		        colDefault = colItem.Value("default")
		        if colDefault <> "" then
		          
		          query.Append " DEFAULT "
		          
		          select case colType
		            
		          case "INTEGER", "REAL"
		            query.Append colDefault
		            
		          case "TEXT"
		            query.Append "'"
		            query.Append colDefault
		            query.Append "'"
		            
		          case else
		            
		            if (left(colType, 4) = "TEXT") or (left(colType, 4) = "CHAR") then
		              query.Append "'"
		              query.Append colDefault
		              query.Append "'"
		            else
		              break
		            end if
		            
		          end select
		          
		        end if
		        
		      end if
		      
		      i = i + 1
		    wend
		    
		    // primary key table constraint
		    
		    if primaryKeys.Ubound >= 0 then
		      query.Append ",PRIMARY KEY ("
		      i = 0
		      while i <= primaryKeys.Ubound
		        
		        if i > 0 then
		          query.Append ","
		        end if
		        
		        query.Append primaryKeys(i)
		        
		        i = i + 1
		      wend
		      query.Append ")"
		    end if
		    
		    query.Append ");"
		    
		    // CREATE TEMP TABLE
		    
		    mDatabase.SQLExecute("ALTER TABLE [" + tableSchema.Value("currentname") + "] RENAME TO " + tempTable + ";")
		    
		    mDatabase.SQLExecute(Join(query, ""))
		    
		    if mDatabase.Error then
		      n = MsgBox (mDatabase.ErrorMessage, 48, "Table Error")
		    else
		      
		      // COPY DATA
		      
		      mDatabase.SQLExecute("INSERT INTO [" + tableSchema.Value("name") + "] (" + Join(copyToColList, ",") + ") SELECT " + Join(copyFromColList, ",") + " FROM " + tempTable + ";")
		      
		      if mDatabase.Error then
		        n = MsgBox (mDatabase.ErrorMessage, 48, "Table Error")
		      else
		        result = true
		      end if
		      
		      // DROP TEMP TABLE
		      
		      mDatabase.SQLExecute("DROP TABLE " + tempTable + ";")
		      
		      // PRAGMA foreign_keys=on;
		      
		      mDatabase.SQLExecute("PRAGMA foreign_keys=on;")
		      
		      RefreshSchemaTables()
		      
		    end if
		    
		    
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UpdateValue(tableName As String, rowIndex As Int64, columnName As String, value As MemoryBlock) As Boolean
		  Dim result As Boolean
		  Dim colType As String
		  Dim query() As String
		  Dim n As Integer
		  Dim blob As SQLiteBlob
		  
		  result = false
		  
		  if mConnected then
		    
		    colType = ColumnType(tableName, columnName)
		    
		    if colType = "BLOB" then
		      
		      if value = nil then
		        query.Append "UPDATE "
		        query.Append tableName
		        query.Append " SET "
		        query.Append columnName
		        query.Append "=NULL WHERE (rowid="
		        query.Append Str(mRowLookup.Value(rowIndex))
		        query.Append ");"
		        mDatabase.SQLExecute(Join(query, ""))
		      else
		        blob = mDatabase.CreateBlob(tableName, columnName, mRowLookup.Value(rowIndex), value.Size)
		        if blob <> nil then
		          blob.Write value
		          blob.Close
		        end if
		      end if
		      
		    else
		      
		      query.Append "UPDATE ["
		      query.Append tableName
		      query.Append "] SET ["
		      query.Append columnName
		      query.Append "]="
		      query.Append "'" + ReplaceAll(value, "'", "''") + "'"
		      query.Append " WHERE (rowid="
		      query.Append Str(mRowLookup.Value(rowIndex))
		      query.Append ");"
		      
		      mDatabase.SQLExecute(Join(query, ""))
		      
		    end if
		    
		    if mDatabase.Error then
		      n = MsgBox (mDatabase.ErrorMessage, 48, "Update Error")
		    else
		      mDataChanged = true
		      result = true
		    end if
		    
		  end if
		  
		  return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mConnected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentTable As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDatabase As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndexLookup As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowLookup As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowsAffected As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowSelected As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSchema As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTableLookup As Dictionary
	#tag EndProperty


	#tag ViewBehavior
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
