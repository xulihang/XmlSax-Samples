B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.8
@EndOfDesignText@
Sub Class_Globals
	Public Name As String
	Public Children As List
	Public Attributes As Map
	Public Closed As Boolean
	Public Parent As XmlNode
	Public Text As String
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	Children.Initialize
	Attributes.Initialize
End Sub

Sub Get(key As String) As List
	Dim list1 As List
	list1.Initialize
	For Each node As XmlNode In Children
		If node.Name=key Then
			list1.Add(node)
		End If
	Next
	Return list1
End Sub

Sub Contains(key As String) As Boolean
	Dim list1 As List
	list1.Initialize
	For Each node As XmlNode In Children
		If node.Name=key Then
			Return True
		End If
	Next
	Return False
End Sub

Public Sub replaceChildren(nodeName As String,nodes As List)
	For i=0 To Children.Size-1
		Dim node As XmlNode=Children.Get(i)
		If node.Name=nodeName Then
			If nodes.Size<>0 Then
				Children.Set(i,nodes.Get(0))
				nodes.RemoveAt(0)
			Else
				Return
			End If
		End If
	Next
End Sub

Sub CreateTextNode (s As String) As XmlNode
	Dim xe As XmlNode
	xe.Initialize
	xe.Children.Initialize
	xe.Name = "text"
	xe.Text=s
	Return xe
End Sub
