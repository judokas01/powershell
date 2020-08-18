cls
$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Sample Form"
$Form.AutoScroll = $True
$Form.AutoSize = $True
$Form.AutoSizeMode = "GrowAndShrink"


$Font = New-Object System.Drawing.Font("Times New Roman",24,[System.Drawing.FontStyle]::Italic)
 # Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Form.Font = $Font
$Label = New-Object System.Windows.Forms.Label
$Label.Text = "This form is very simple."
$Label.AutoSize = $True
$Form.Controls.Add($Label)

$Form.ShowDialog()





#Ex2
Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form

$Form.Text = "Sample Form"

$Form.AutoScroll = $True

$Form.AutoSize = $True

$Form.AutoSizeMode = "GrowAndShrink"

    # or GrowOnly
$Form.MinimizeBox = $False

$Form.MaximizeBox = $False

$Form.WindowState = "Normal"

    # Maximized, Minimized, Normal

$Form.SizeGripStyle = "Hide"

    # Auto, Hide, Show

$Form.ShowInTaskbar = $False

$Form.Opacity = 0.7

    # 1.0 is fully opaque; 0.0 is invisible

$Form.StartPosition = "CenterScreen"

    # CenterScreen, Manual, WindowsDefaultLocation, WindowsDefaultBounds, CenterParent
   $Font = New-Object System.Drawing.Font("Times New Roman",24,[System.Drawing.FontStyle]::Italic)

    # Font styles are: Regular, Bold, Italic, Underline, Strikeout

$Form.Font = $Font

$Label = New-Object System.Windows.Forms.Label

$Label.Text = "This form is very simple."

$Label.AutoSize = $True

$Form.Controls.Add($Label)

$Form.ShowDialog()





#Ex3 colorful
Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form

$Form.Text = "Sample Form"

$Form.AutoSize = $True

$Form.AutoSizeMode = "GrowAndShrink"

    # or GrowOnly

 

$Form.BackColor = "Lime"

    # color names are static properties of System.Drawing.Color

    # you can also use ARGB values, such as "#FFFFEBCD"

 

$Font = New-Object System.Drawing.Font("Times New Roman",24,[System.Drawing.FontStyle]::Italic)

    # Font styles are: Regular, Bold, Italic, Underline, Strikeout

$Form.Font = $Font

$Label = New-Object System.Windows.Forms.Label

$Label.Text = "This form is very simple."

$Label.AutoSize = $True

$Form.Controls.Add($Label)

$Form.ShowDialog()








#Form with image
Add-Type -AssemblyName System.Windows.Forms
$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Sample Form"

 
$Image = [system.drawing.image]::FromFile("c:\mypic.png")
$Form.BackgroundImage = $Image
$Form.BackgroundImageLayout = "None"

# None, Tile, Center, Stretch, Zoom
$Form.Width = $Image.Width
$Form.Height = $Image.Height


$Font = New-Object System.Drawing.Font("Times New Roman",24,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout

$Form.Font = $Font
$Label = New-Object System.Windows.Forms.Label

$Label.Text = "This form is very simple."
$Label.BackColor = "Transparent"
$Label.AutoSize = $True
$Form.Controls.Add($Label)
$Form.ShowDialog()

 






 [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "Data Entry Form"
$objForm.Size = New-Object System.Drawing.Size(300,200) 
$objForm.StartPosition = "CenterScreen"

$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.Add_Click({$x=$objTextBox.Text;$objForm.Close()})
$objForm.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,20) 
$objLabel.Size = New-Object System.Drawing.Size(280,20) 
$objLabel.Text = "Please enter the information in the space below:"
$objForm.Controls.Add($objLabel) 

$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(10,40) 
$objTextBox.Size = New-Object System.Drawing.Size(260,20) 
$objForm.Controls.Add($objTextBox) 

$objForm.Topmost = $True

$objForm.Add_Shown({$objForm.Activate()})


$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})


[void] $objForm.ShowDialog()

$x











#=====================================================
#Form complete
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the information in the space below:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $x
}


