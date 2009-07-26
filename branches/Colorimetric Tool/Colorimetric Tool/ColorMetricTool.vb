Imports System.Drawing
Imports System.Drawing.Imaging
Public Class ColorMetricTool
    Dim xstart As Integer
    Dim ystart As Integer
    Dim yend As Integer
    Dim xend As Integer
    Dim cropH As Int32
    Dim cropW As Int32
    Dim bmps As Bitmap
    Dim status As Boolean = False
    Dim cropBitmap As Bitmap
    Dim tmp As Bitmap
    Private imgHeight As Single
    Private imgWidth As Single
    'the position and size to crop the image file
    Dim cropX As Integer
    Dim cropY As Integer
    Dim cropWidth As Integer
    Dim cropHeight As Integer

    'create a pen object
    Public cropPen As Pen

    'select a default crop line size
    Public cropPenSize As Integer = 0.5 '2

    'will contain the dashStyle of the pen
    Public cropDashStyle As Drawing2D.DashStyle = Drawing2D.DashStyle.Solid

    'set a default crop line color
    Public cropPenColor As Color = Color.Aquamarine

    'this is for changing the mouseicon.
    'being used for setting cropping points. 
    'makes it more user friendly
    Public c As Cursors



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
        OpenFileDialog1.Filter = "bitmaps files (*.bmp)|test|All files (*.*)|*.*"
        OpenFileDialog1.ShowDialog()
        fname = OpenFileDialog1.FileName
        bmps = New Bitmap(fname)

        PanelX.AutoScrollMinSize = New Size(bmps.Width, bmps.Height)
        viewImage.Image = bmps

        'HScrollBar1.Maximum = bmps.Width - viewImage.Width
        'VScrollBar1.Maximum = bmps.Height - viewImage.Height
    End Sub

    Private Sub selectArea_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles selectArea.Click
        viewImage.Image = bmps
        status = True
    End Sub

    Private Sub selectImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles selectImage.Click
        Try

            If cropWidth < 1 Then

                'if there are not proper cropping cordinates, then throw a message and exit code
                MessageBox.Show("You need to first select what portion of the image to crop.", " No cropping Cordinates!", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Exit Sub

            End If

            'a rectangle to set the location and size from the source image
            Dim rect As Rectangle = New Rectangle(cropX, cropY, cropWidth, cropHeight)

            'You will need to remember that you will want to decide the width and height of the
            'bitmap according to what the sizemode of the picturebox that contains the image is.
            'If the sizemode = Stretch, then you will want the width/height of the control itself.
            'IF the sizemode = Normal, then you will want the width/height of the IMAGE. So on,
            'and so forth depending on the picturebox controls sizemode. If you do not do this,
            'then you will end up with a completely different cropping image then what you gave
            'cordinates for.
            Dim bit As Bitmap = New Bitmap(viewImage.Image, viewImage.Width, viewImage.Height)

            'create a new bitmap with the width/height values that were specified in the textboxes.
            cropBitmap = New Bitmap(cropWidth, cropHeight)

            'a new Graphics object that will draw on the cropBitmap
            Dim g As Graphics = Graphics.FromImage(cropBitmap)

            'draw the portion of the image that you supplied cropping values for.
            g.DrawImage(bit, 0, 0, rect, GraphicsUnit.Pixel)

            'go ahead and make the new portion of the image a PART of the picturebox instead of
            'just drawing on it. Because if you draw the image through the Graphic class, then
            'you will lose the image whenever the application minimized or got covered up since
            'the image is not persisted on the control.
            imgHeight = cropBitmap.Height
            imgWidth = cropBitmap.Width
            selectView.Image = cropBitmap

        Catch exc As Exception

            MessageBox.Show(exc.Message, " Error", MessageBoxButtons.OK, MessageBoxIcon.Error)

        End Try
    End Sub

    Private Sub viewImage_MouseDown1(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseDown
        Try

            If e.Button = MouseButtons.Left Then

                cropX = e.X
                cropY = e.Y

                cropPen = New Pen(cropPenColor, cropPenSize)
                cropPen.DashStyle = cropDashStyle

                'change the mouse pointer to the cross cursor which kinda helps when
                'sizing for the crop
                Cursor = Cursors.Cross

            End If

            'clear the previoius crop lines by clicking on the pic
            viewImage.Refresh()


        Catch exc As Exception

            MessageBox.Show(exc.Message, " Error", MessageBoxButtons.OK, MessageBoxIcon.Error)

        End Try
    End Sub

    Private Sub viewImage_MouseMove1(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseMove
        Try

            If viewImage.Image Is Nothing Then Exit Sub

            If e.Button = MouseButtons.Left Then

                'clear the previous drawn crop lines
                viewImage.Refresh()

                'need to take into count where the mouse started at
                'and calculate the new position
                cropWidth = e.X - cropX
                cropHeight = e.Y - cropY

                'draw the outline for the cropping
                viewImage.CreateGraphics.DrawRectangle(cropPen, cropX, cropY, cropWidth, cropHeight)

                'update the coordinates in the textboxes
                'txtX.Text = cropX
                'txtY.Text = cropY
                'txtWidth.Text = cropWidth
                'txtHeight.Text = cropHeight

            End If

            'release as much memory as possible
            GC.Collect()

        Catch exc As Exception

            'this is a error when the cropping parameters are less than 1
            If Err.Number = 5 Then Exit Sub

            MessageBox.Show(exc.Message, " Error", MessageBoxButtons.OK, MessageBoxIcon.Error)

        End Try

    End Sub

    Private Sub viewImage_MouseUp1(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles viewImage.MouseUp
        Try

            'change the mouse pointer back to the default cursor
            Cursor = Cursors.Default

        Catch exc As Exception

            MessageBox.Show(exc.Message, " Error", MessageBoxButtons.OK, MessageBoxIcon.Error)

        End Try
    End Sub

    Private Sub zoomIn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles zoomIn.Click
        selectView.SizeMode = PictureBoxSizeMode.Zoom
    End Sub
End Class
