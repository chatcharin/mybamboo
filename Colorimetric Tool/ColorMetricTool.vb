Public Class ColorMetricTool
    Dim xstart As Integer
    Dim ystart As Integer
    Dim yend As Integer
    Dim xend As Integer
    Dim cropPenSize As Size
    Dim cropX As Int32
    Dim cropY As Int32
    Dim cropPen As Pen
    Dim cropH As Int32
    Dim cropW As Int32
    Dim bmps As Bitmap
    Dim status As Boolean = False



    Private Sub OpenImageToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OpenImageToolStripMenuItem.Click
        Dim fname As String
        OpenFileDialog1.FileName = "*"
        OpenFileDialog1.Filter = "bitmaps files (*.bmp)|*.txt|All files (*.*)|*.*"
        OpenFileDialog1.ShowDialog()
        fname = OpenFileDialog1.FileName
        bmps = New Bitmap(fname)
        viewImage.Image = bmps
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DataSet1.imetric' table. You can move, or remove it, as needed.
        Me.ImetricTableAdapter1.Fill(Me.DataSet1.imetric)
        'TODO: This line of code loads data into the 'ColorimetricDataSet.imetric' table. You can move, or remove it, as needed.
        'Me.ImetricTableAdapter.Fill(Me.ColorimetricDataSet.imetric)
    End Sub

    'Private Sub viewImage_MouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseClick

    'End Sub

    Private Sub viewImage_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseDown
        Try
            If status Then
                cropX = e.X
                cropY = e.Y
                cropPen = Pens.Green
                cropPen.DashStyle = Drawing2D.DashStyle.Dot
                status = 100
            End If
        Catch ex As Exception

        End Try

    End Sub

    'Private Sub viewImage_MouseHover(ByVal sender As Object, ByVal e As System.EventArgs) Handles viewImage.MouseHover

    'End Sub

    'Private Sub viewImage_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseUp
    '    xend = e.X
    '    yend = e.Y
    '    Label1.Text = xstart.ToString
    '    Label2.Text = ystart.ToString
    '    Label3.Text = xend.ToString
    '    Label4.Text = yend.ToString
    'End Sub

    Private Sub openImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles openImage.Click
        Dim fname As String
        OpenFileDialog1.FileName = "*"
        OpenFileDialog1.Filter = "bitmaps files (*.bmp)|*.txt|All files (*.*)|*.*"
        OpenFileDialog1.ShowDialog()
        fname = OpenFileDialog1.FileName
        bmps = New Bitmap(fname)
        viewImage.Image = bmps
    End Sub
   
    Private Sub viewImage_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseMove
        Try
            cropW = e.X - cropX
            cropH = e.Y - cropY
            '  viewImage.Image = bmps
            'viewImage.CreateGraphics.DrawRectangle(cropPen, cropX, cropY, cropW, cropH)
        Catch ex As Exception

        End Try

    End Sub

    Private Sub viewImage_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseUp
        If status Then
            status = 0
            viewImage.CreateGraphics.DrawRectangle(cropPen, cropX, cropY, cropW, cropH)
        End If
    End Sub

    Private Sub selectArea_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles selectArea.Click
        viewImage.Image = bmps
        status = True
    End Sub
End Class
