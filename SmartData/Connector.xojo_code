#tag Class
Protected Class Connector
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSelection()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnType(tableName As String, columnName As String) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Commit()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connected() As Boolean
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectionType() As String
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateIndex(tableName As String, columns() As String, indexName As String) As Boolean
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateTable(schema As JSONItem) As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatabaseName() As String
		  Return "Untitled"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataChanged() As Boolean
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteIndex(indexName As String) As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteSelectedRows()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteTable(tableName As String) As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorCode() As Integer
		  // 0 = No error
		  // 1 = Authentication failed
		  
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Execute(query As String) As SmartData.DataSet
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCSV(tableName As String, header As Boolean, columns() As String, filter As String="") As String()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetJSON(tableName As String, columns() As String, filter As String="") As JSONItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPage(tableName As String, rowOffset As Int64, pageSize As Int64, filter As String = "", orderByColumn As String = "", orderDesc As Boolean = false) As SmartData.Row()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRows(tableName As String, columns() As String) As String()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImportCSV(tableName As String, columnNames() As String, lines() As String) As Boolean
		  return false
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Index(indexIndex As Integer) As JSONItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Index(indexName As String) As JSONItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexCount() As Integer
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertRow(tableName As String) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenameTable(tableName As String, newName As String) As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rollback()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowCount(tableName As String) As Int64
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowsAffected() As Int64
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowSelected(rowIndex As Int64) As Boolean
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowSelected(rowIndex As Int64, Assigns value As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Schema() As JSONItem
		  return nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAllRows()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRowCount() As Int64
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShiftSelectRows(rowIndex As Int64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Table(tableIndex As Integer) As JSONItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Table(tableName As String) As JSONItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableCount() As Integer
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UpdateTable(schema As JSONItem) As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UpdateValue(tableName As String, rowIndex As Int64, columnName As String, value As MemoryBlock) As Boolean
		  return false
		  
		End Function
	#tag EndMethod


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
