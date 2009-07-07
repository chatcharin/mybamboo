<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ColorMetricTool
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
        Me.components = New System.ComponentModel.Container
        Dim RLabel As System.Windows.Forms.Label
        Dim GLabel As System.Windows.Forms.Label
        Dim BLabel As System.Windows.Forms.Label
        Dim IdLabel As System.Windows.Forms.Label
        Dim DataLabel As System.Windows.Forms.Label
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip
        Me.FileToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.NewMasterColorToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.OpenImageToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.CloseToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ViewToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.WindowToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.DatabaseToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ImageToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.OptionToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.HelpToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.AboutToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.addMaster = New System.Windows.Forms.Button
        Me.editMaster = New System.Windows.Forms.Button
        Me.openImage = New System.Windows.Forms.Button
        Me.scanImage = New System.Windows.Forms.Button
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog
        Me.BindingSource1 = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataSet1 = New Colorimetric_Tool.DataSet1
        Me.selectImage = New System.Windows.Forms.Button
        Me.selectArea = New System.Windows.Forms.Button
        Me.zoomIn = New System.Windows.Forms.Button
        Me.zoomOut = New System.Windows.Forms.Button
        Me.selectView = New System.Windows.Forms.PictureBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.description = New System.Windows.Forms.TextBox
        Me.Database = New System.Windows.Forms.Button
        Me.ImetricTableAdapter1 = New Colorimetric_Tool.DataSet1TableAdapters.imetricTableAdapter
        Me.TableAdapterManager = New Colorimetric_Tool.DataSet1TableAdapters.TableAdapterManager
        Me.RTextBox = New System.Windows.Forms.TextBox
        Me.GTextBox = New System.Windows.Forms.TextBox
        Me.BTextBox = New System.Windows.Forms.TextBox
        Me.IdComboBox = New System.Windows.Forms.ComboBox
        Me.DataTextBox = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.PanelX = New System.Windows.Forms.Panel
        Me.viewImage = New System.Windows.Forms.PictureBox
        RLabel = New System.Windows.Forms.Label
        GLabel = New System.Windows.Forms.Label
        BLabel = New System.Windows.Forms.Label
        IdLabel = New System.Windows.Forms.Label
        DataLabel = New System.Windows.Forms.Label
        Me.MenuStrip1.SuspendLayout()
        CType(Me.BindingSource1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.selectView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.PanelX.SuspendLayout()
        CType(Me.viewImage, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'RLabel
        '
        RLabel.AutoSize = True
        RLabel.Location = New System.Drawing.Point(658, 61)
        RLabel.Name = "RLabel"
        RLabel.Size = New System.Drawing.Size(13, 13)
        RLabel.TabIndex = 20
        RLabel.Text = "r:"
        '
        'GLabel
        '
        GLabel.AutoSize = True
        GLabel.Location = New System.Drawing.Point(655, 87)
        GLabel.Name = "GLabel"
        GLabel.Size = New System.Drawing.Size(16, 13)
        GLabel.TabIndex = 21
        GLabel.Text = "g:"
        '
        'BLabel
        '
        BLabel.AutoSize = True
        BLabel.Location = New System.Drawing.Point(655, 113)
        BLabel.Name = "BLabel"
        BLabel.Size = New System.Drawing.Size(16, 13)
        BLabel.TabIndex = 22
        BLabel.Text = "b:"
        '
        'IdLabel
        '
        IdLabel.AutoSize = True
        IdLabel.Location = New System.Drawing.Point(653, 36)
        IdLabel.Name = "IdLabel"
        IdLabel.Size = New System.Drawing.Size(18, 13)
        IdLabel.TabIndex = 23
        IdLabel.Text = "id:"
        '
        'DataLabel
        '
        DataLabel.AutoSize = True
        DataLabel.Location = New System.Drawing.Point(640, 142)
        DataLabel.Name = "DataLabel"
        DataLabel.Size = New System.Drawing.Size(31, 13)
        DataLabel.TabIndex = 24
        DataLabel.Text = "data:"
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.FileToolStripMenuItem, Me.ViewToolStripMenuItem, Me.WindowToolStripMenuItem, Me.HelpToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(791, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'FileToolStripMenuItem
        '
        Me.FileToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.NewMasterColorToolStripMenuItem, Me.OpenImageToolStripMenuItem, Me.CloseToolStripMenuItem})
        Me.FileToolStripMenuItem.Name = "FileToolStripMenuItem"
        Me.FileToolStripMenuItem.Size = New System.Drawing.Size(35, 20)
        Me.FileToolStripMenuItem.Text = "File"
        '
        'NewMasterColorToolStripMenuItem
        '
        Me.NewMasterColorToolStripMenuItem.Name = "NewMasterColorToolStripMenuItem"
        Me.NewMasterColorToolStripMenuItem.Size = New System.Drawing.Size(156, 22)
        Me.NewMasterColorToolStripMenuItem.Text = "New MasterColor"
        '
        'OpenImageToolStripMenuItem
        '
        Me.OpenImageToolStripMenuItem.Name = "OpenImageToolStripMenuItem"
        Me.OpenImageToolStripMenuItem.Size = New System.Drawing.Size(156, 22)
        Me.OpenImageToolStripMenuItem.Text = "OpenImage"
        '
        'CloseToolStripMenuItem
        '
        Me.CloseToolStripMenuItem.Name = "CloseToolStripMenuItem"
        Me.CloseToolStripMenuItem.Size = New System.Drawing.Size(156, 22)
        Me.CloseToolStripMenuItem.Text = "Close"
        '
        'ViewToolStripMenuItem
        '
        Me.ViewToolStripMenuItem.Name = "ViewToolStripMenuItem"
        Me.ViewToolStripMenuItem.Size = New System.Drawing.Size(41, 20)
        Me.ViewToolStripMenuItem.Text = "View"
        '
        'WindowToolStripMenuItem
        '
        Me.WindowToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.DatabaseToolStripMenuItem, Me.ImageToolStripMenuItem, Me.OptionToolStripMenuItem})
        Me.WindowToolStripMenuItem.Name = "WindowToolStripMenuItem"
        Me.WindowToolStripMenuItem.Size = New System.Drawing.Size(57, 20)
        Me.WindowToolStripMenuItem.Text = "Window"
        '
        'DatabaseToolStripMenuItem
        '
        Me.DatabaseToolStripMenuItem.Name = "DatabaseToolStripMenuItem"
        Me.DatabaseToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.DatabaseToolStripMenuItem.Text = "Database"
        '
        'ImageToolStripMenuItem
        '
        Me.ImageToolStripMenuItem.Name = "ImageToolStripMenuItem"
        Me.ImageToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.ImageToolStripMenuItem.Text = "Image"
        '
        'OptionToolStripMenuItem
        '
        Me.OptionToolStripMenuItem.Name = "OptionToolStripMenuItem"
        Me.OptionToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.OptionToolStripMenuItem.Text = "Option"
        '
        'HelpToolStripMenuItem
        '
        Me.HelpToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AboutToolStripMenuItem})
        Me.HelpToolStripMenuItem.Name = "HelpToolStripMenuItem"
        Me.HelpToolStripMenuItem.Size = New System.Drawing.Size(40, 20)
        Me.HelpToolStripMenuItem.Text = "Help"
        '
        'AboutToolStripMenuItem
        '
        Me.AboutToolStripMenuItem.Name = "AboutToolStripMenuItem"
        Me.AboutToolStripMenuItem.Size = New System.Drawing.Size(185, 22)
        Me.AboutToolStripMenuItem.Text = "About Colorimetric Tool"
        '
        'addMaster
        '
        Me.addMaster.Location = New System.Drawing.Point(12, 31)
        Me.addMaster.Name = "addMaster"
        Me.addMaster.Size = New System.Drawing.Size(91, 23)
        Me.addMaster.TabIndex = 2
        Me.addMaster.Text = "Add Master"
        Me.addMaster.UseVisualStyleBackColor = True
        '
        'editMaster
        '
        Me.editMaster.Location = New System.Drawing.Point(12, 60)
        Me.editMaster.Name = "editMaster"
        Me.editMaster.Size = New System.Drawing.Size(91, 23)
        Me.editMaster.TabIndex = 2
        Me.editMaster.Text = "Edit Master"
        Me.editMaster.UseVisualStyleBackColor = True
        '
        'openImage
        '
        Me.openImage.Location = New System.Drawing.Point(12, 165)
        Me.openImage.Name = "openImage"
        Me.openImage.Size = New System.Drawing.Size(91, 23)
        Me.openImage.TabIndex = 2
        Me.openImage.Text = "Open"
        Me.openImage.UseVisualStyleBackColor = True
        '
        'scanImage
        '
        Me.scanImage.Location = New System.Drawing.Point(12, 194)
        Me.scanImage.Name = "scanImage"
        Me.scanImage.Size = New System.Drawing.Size(91, 23)
        Me.scanImage.TabIndex = 2
        Me.scanImage.Text = "Scan Image"
        Me.scanImage.UseVisualStyleBackColor = True
        '
        'OpenFileDialog1
        '
        Me.OpenFileDialog1.FileName = "OpenFileDialog1"
        '
        'BindingSource1
        '
        Me.BindingSource1.DataMember = "imetric"
        Me.BindingSource1.DataSource = Me.DataSet1
        '
        'DataSet1
        '
        Me.DataSet1.DataSetName = "DataSet1"
        Me.DataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'selectImage
        '
        Me.selectImage.Location = New System.Drawing.Point(12, 223)
        Me.selectImage.Name = "selectImage"
        Me.selectImage.Size = New System.Drawing.Size(91, 23)
        Me.selectImage.TabIndex = 2
        Me.selectImage.Text = "Select Image"
        Me.selectImage.UseVisualStyleBackColor = True
        '
        'selectArea
        '
        Me.selectArea.Location = New System.Drawing.Point(12, 252)
        Me.selectArea.Name = "selectArea"
        Me.selectArea.Size = New System.Drawing.Size(91, 23)
        Me.selectArea.TabIndex = 2
        Me.selectArea.Text = "Select Area"
        Me.selectArea.UseVisualStyleBackColor = True
        '
        'zoomIn
        '
        Me.zoomIn.Location = New System.Drawing.Point(12, 281)
        Me.zoomIn.Name = "zoomIn"
        Me.zoomIn.Size = New System.Drawing.Size(91, 23)
        Me.zoomIn.TabIndex = 6
        Me.zoomIn.Text = "Zoom In"
        Me.zoomIn.UseVisualStyleBackColor = True
        '
        'zoomOut
        '
        Me.zoomOut.Location = New System.Drawing.Point(12, 310)
        Me.zoomOut.Name = "zoomOut"
        Me.zoomOut.Size = New System.Drawing.Size(91, 23)
        Me.zoomOut.TabIndex = 7
        Me.zoomOut.Text = "Zoom Out"
        Me.zoomOut.UseVisualStyleBackColor = True
        '
        'selectView
        '
        Me.selectView.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.selectView.Location = New System.Drawing.Point(13, 338)
        Me.selectView.Name = "selectView"
        Me.selectView.Size = New System.Drawing.Size(90, 151)
        Me.selectView.TabIndex = 8
        Me.selectView.TabStop = False
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(640, 165)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(50, 13)
        Me.Label5.TabIndex = 13
        Me.Label5.Text = "คำอธิบาย"
        '
        'description
        '
        Me.description.Location = New System.Drawing.Point(643, 186)
        Me.description.Multiline = True
        Me.description.Name = "description"
        Me.description.Size = New System.Drawing.Size(134, 245)
        Me.description.TabIndex = 14
        '
        'Database
        '
        Me.Database.Location = New System.Drawing.Point(13, 136)
        Me.Database.Name = "Database"
        Me.Database.Size = New System.Drawing.Size(90, 23)
        Me.Database.TabIndex = 15
        Me.Database.Text = "Database"
        Me.Database.UseVisualStyleBackColor = True
        '
        'ImetricTableAdapter1
        '
        Me.ImetricTableAdapter1.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.imetricTableAdapter = Me.ImetricTableAdapter1
        Me.TableAdapterManager.UpdateOrder = Colorimetric_Tool.DataSet1TableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'RTextBox
        '
        Me.RTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BindingSource1, "r", True))
        Me.RTextBox.Location = New System.Drawing.Point(677, 58)
        Me.RTextBox.Name = "RTextBox"
        Me.RTextBox.Size = New System.Drawing.Size(100, 20)
        Me.RTextBox.TabIndex = 21
        '
        'GTextBox
        '
        Me.GTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BindingSource1, "g", True))
        Me.GTextBox.Location = New System.Drawing.Point(677, 84)
        Me.GTextBox.Name = "GTextBox"
        Me.GTextBox.Size = New System.Drawing.Size(100, 20)
        Me.GTextBox.TabIndex = 22
        '
        'BTextBox
        '
        Me.BTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BindingSource1, "b", True))
        Me.BTextBox.Location = New System.Drawing.Point(677, 110)
        Me.BTextBox.Name = "BTextBox"
        Me.BTextBox.Size = New System.Drawing.Size(100, 20)
        Me.BTextBox.TabIndex = 23
        '
        'IdComboBox
        '
        Me.IdComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BindingSource1, "id", True))
        Me.IdComboBox.DataSource = Me.BindingSource1
        Me.IdComboBox.DisplayMember = "description"
        Me.IdComboBox.FormattingEnabled = True
        Me.IdComboBox.Location = New System.Drawing.Point(677, 31)
        Me.IdComboBox.Name = "IdComboBox"
        Me.IdComboBox.Size = New System.Drawing.Size(100, 21)
        Me.IdComboBox.TabIndex = 24
        Me.IdComboBox.ValueMember = "id"
        '
        'DataTextBox
        '
        Me.DataTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BindingSource1, "data", True))
        Me.DataTextBox.Location = New System.Drawing.Point(677, 139)
        Me.DataTextBox.Name = "DataTextBox"
        Me.DataTextBox.Size = New System.Drawing.Size(100, 20)
        Me.DataTextBox.TabIndex = 25
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(640, 434)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(39, 13)
        Me.Label1.TabIndex = 26
        Me.Label1.Text = "Label1"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(640, 447)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(39, 13)
        Me.Label2.TabIndex = 26
        Me.Label2.Text = "Label1"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(640, 463)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(39, 13)
        Me.Label3.TabIndex = 26
        Me.Label3.Text = "Label1"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(640, 476)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(39, 13)
        Me.Label4.TabIndex = 26
        Me.Label4.Text = "Label1"
        '
        'PanelX
        '
        Me.PanelX.AutoScroll = True
        Me.PanelX.AutoScrollMinSize = New System.Drawing.Size(1024, 800)
        Me.PanelX.AutoSize = True
        Me.PanelX.Controls.Add(Me.viewImage)
        Me.PanelX.Location = New System.Drawing.Point(109, 27)
        Me.PanelX.Name = "PanelX"
        Me.PanelX.Size = New System.Drawing.Size(525, 462)
        Me.PanelX.TabIndex = 27
        '
        'viewImage
        '
        Me.viewImage.Dock = System.Windows.Forms.DockStyle.Fill
        Me.viewImage.Location = New System.Drawing.Point(0, 0)
        Me.viewImage.Name = "viewImage"
        Me.viewImage.Size = New System.Drawing.Size(1024, 800)
        Me.viewImage.TabIndex = 0
        Me.viewImage.TabStop = False
        '
        'ColorMetricTool
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(791, 524)
        Me.Controls.Add(Me.PanelX)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(DataLabel)
        Me.Controls.Add(Me.DataTextBox)
        Me.Controls.Add(IdLabel)
        Me.Controls.Add(Me.IdComboBox)
        Me.Controls.Add(BLabel)
        Me.Controls.Add(Me.BTextBox)
        Me.Controls.Add(GLabel)
        Me.Controls.Add(Me.GTextBox)
        Me.Controls.Add(RLabel)
        Me.Controls.Add(Me.RTextBox)
        Me.Controls.Add(Me.Database)
        Me.Controls.Add(Me.description)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.selectView)
        Me.Controls.Add(Me.zoomOut)
        Me.Controls.Add(Me.zoomIn)
        Me.Controls.Add(Me.selectArea)
        Me.Controls.Add(Me.selectImage)
        Me.Controls.Add(Me.scanImage)
        Me.Controls.Add(Me.openImage)
        Me.Controls.Add(Me.editMaster)
        Me.Controls.Add(Me.addMaster)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "ColorMetricTool"
        Me.Text = "::Colorimetric Tool::"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        CType(Me.BindingSource1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.selectView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.PanelX.ResumeLayout(False)
        CType(Me.viewImage, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents FileToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NewMasterColorToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ViewToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents WindowToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents HelpToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AboutToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents OpenImageToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CloseToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DatabaseToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ImageToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents OptionToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents addMaster As System.Windows.Forms.Button
    Friend WithEvents editMaster As System.Windows.Forms.Button
    Friend WithEvents openImage As System.Windows.Forms.Button
    Friend WithEvents scanImage As System.Windows.Forms.Button
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    'Friend WithEvents ColorimetricDataSet As Colorimetric_Tool.colorimetricDataSet
    Friend WithEvents ImetricBindingSource As System.Windows.Forms.BindingSource
    'Friend WithEvents ImetricTableAdapter As Colorimetric_Tool.colorimetricDataSetTableAdapters.imetricTableAdapter
    Friend WithEvents ImetricBindingSource1 As System.Windows.Forms.BindingSource
    Friend WithEvents ImetricBindingSource2 As System.Windows.Forms.BindingSource
    Friend WithEvents ColorimetricDataSetBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents selectImage As System.Windows.Forms.Button
    Friend WithEvents selectArea As System.Windows.Forms.Button
    Friend WithEvents zoomIn As System.Windows.Forms.Button
    Friend WithEvents zoomOut As System.Windows.Forms.Button
    Friend WithEvents selectView As System.Windows.Forms.PictureBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents description As System.Windows.Forms.TextBox
    Friend WithEvents Database As System.Windows.Forms.Button
    Friend WithEvents DataSet1 As Colorimetric_Tool.DataSet1
    Friend WithEvents BindingSource1 As System.Windows.Forms.BindingSource
    Friend WithEvents ImetricTableAdapter1 As Colorimetric_Tool.DataSet1TableAdapters.imetricTableAdapter
    Friend WithEvents TableAdapterManager As Colorimetric_Tool.DataSet1TableAdapters.TableAdapterManager
    Friend WithEvents RTextBox As System.Windows.Forms.TextBox
    Friend WithEvents GTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BTextBox As System.Windows.Forms.TextBox
    Friend WithEvents IdComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents DataTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents PanelX As System.Windows.Forms.Panel
    Friend WithEvents viewImage As System.Windows.Forms.PictureBox

End Class
