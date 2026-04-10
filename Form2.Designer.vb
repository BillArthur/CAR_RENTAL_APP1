<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form2
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        TextBox1 = New TextBox()
        TextBox2 = New TextBox()
        TextBox3 = New TextBox()
        CheckBox1 = New CheckBox()
        TextBox4 = New TextBox()
        TextBox5 = New TextBox()
        Button1 = New Button()
        TextBox6 = New TextBox()
        Button2 = New Button()
        SuspendLayout()
        ' 
        ' TextBox1
        ' 
        TextBox1.BackColor = SystemColors.Control
        TextBox1.BorderStyle = BorderStyle.None
        TextBox1.Font = New Font("Segoe UI", 16.2F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        TextBox1.Location = New Point(308, 38)
        TextBox1.Name = "TextBox1"
        TextBox1.Size = New Size(125, 36)
        TextBox1.TabIndex = 0
        TextBox1.Text = "SIGN IN"
        TextBox1.TextAlign = HorizontalAlignment.Center
        ' 
        ' TextBox2
        ' 
        TextBox2.Location = New Point(153, 148)
        TextBox2.Name = "TextBox2"
        TextBox2.Size = New Size(433, 27)
        TextBox2.TabIndex = 1
        TextBox2.Text = "Email :"
        ' 
        ' TextBox3
        ' 
        TextBox3.Location = New Point(153, 202)
        TextBox3.Name = "TextBox3"
        TextBox3.Size = New Size(433, 27)
        TextBox3.TabIndex = 2
        TextBox3.Text = "Password:"
        ' 
        ' CheckBox1
        ' 
        CheckBox1.AutoSize = True
        CheckBox1.Location = New Point(153, 260)
        CheckBox1.Name = "CheckBox1"
        CheckBox1.Size = New Size(129, 24)
        CheckBox1.TabIndex = 3
        CheckBox1.Text = "Remember me"
        CheckBox1.UseVisualStyleBackColor = True
        ' 
        ' TextBox4
        ' 
        TextBox4.BackColor = SystemColors.Control
        TextBox4.BorderStyle = BorderStyle.None
        TextBox4.Font = New Font("Segoe UI", 9F, FontStyle.Italic, GraphicsUnit.Point, CByte(0))
        TextBox4.Location = New Point(461, 261)
        TextBox4.Name = "TextBox4"
        TextBox4.Size = New Size(125, 20)
        TextBox4.TabIndex = 4
        TextBox4.Text = "Forgot Password?"
        ' 
        ' TextBox5
        ' 
        TextBox5.Location = New Point(153, 97)
        TextBox5.Name = "TextBox5"
        TextBox5.Size = New Size(433, 27)
        TextBox5.TabIndex = 5
        TextBox5.Text = "Full Name :"
        ' 
        ' Button1
        ' 
        Button1.BackColor = SystemColors.ActiveCaption
        Button1.Font = New Font("Segoe UI", 10.2F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        Button1.Location = New Point(308, 298)
        Button1.Name = "Button1"
        Button1.Size = New Size(125, 29)
        Button1.TabIndex = 6
        Button1.Text = "OK"
        Button1.UseVisualStyleBackColor = False
        ' 
        ' TextBox6
        ' 
        TextBox6.BackColor = SystemColors.Control
        TextBox6.BorderStyle = BorderStyle.None
        TextBox6.Location = New Point(308, 342)
        TextBox6.Name = "TextBox6"
        TextBox6.Size = New Size(125, 20)
        TextBox6.TabIndex = 7
        TextBox6.Text = "OR"
        TextBox6.TextAlign = HorizontalAlignment.Center
        ' 
        ' Button2
        ' 
        Button2.BackColor = SystemColors.ActiveCaption
        Button2.Font = New Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        Button2.Location = New Point(308, 368)
        Button2.Name = "Button2"
        Button2.Size = New Size(125, 29)
        Button2.TabIndex = 8
        Button2.Text = "LOG IN"
        Button2.UseVisualStyleBackColor = False
        ' 
        ' Form2
        ' 
        AutoScaleDimensions = New SizeF(8F, 20F)
        AutoScaleMode = AutoScaleMode.Font
        ClientSize = New Size(800, 450)
        Controls.Add(Button2)
        Controls.Add(TextBox6)
        Controls.Add(Button1)
        Controls.Add(TextBox5)
        Controls.Add(TextBox4)
        Controls.Add(CheckBox1)
        Controls.Add(TextBox3)
        Controls.Add(TextBox2)
        Controls.Add(TextBox1)
        Name = "Form2"
        Text = "Form2"
        ResumeLayout(False)
        PerformLayout()
    End Sub

    Friend WithEvents TextBox1 As TextBox
    Friend WithEvents TextBox2 As TextBox
    Friend WithEvents TextBox3 As TextBox
    Friend WithEvents CheckBox1 As CheckBox
    Friend WithEvents TextBox4 As TextBox
    Friend WithEvents TextBox5 As TextBox
    Friend WithEvents Button1 As Button
    Friend WithEvents TextBox6 As TextBox
    Friend WithEvents Button2 As Button
End Class
