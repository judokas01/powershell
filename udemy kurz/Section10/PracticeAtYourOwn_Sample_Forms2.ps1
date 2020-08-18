

#Example1:  A simple form with 1 button
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")
$form= New-Object Windows.Forms.Form
#$textbox = New-Object Windows.Forms.Button
$button = New-Object Windows.Forms.Button
$button.text = "Click Here!"

$form.controls.add($button)
#$form.controls.add($textbox)

$form.ShowDialog()




#Example 2:  Adding Functionality:
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")
function do_exit
{
     $form.close()
}
$form= New-Object Windows.Forms.Form
$button = New-Object Windows.Forms.Button
$button.text = "Click Here!"
$button.add_click({do_exit})
$form.controls.add($button)
$form.ShowDialog()








# Example 3

# Load the Winforms assembly
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")

# Create the form
$form = New-Object Windows.Forms.Form
#Set the dialog title
$form.text = "PowerShell WinForms Example"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 50,30
$label.Size = New-Object Drawing.Point 200,15
$label.text = "Enter your name and click the button"

# Create TextBox and set text, size and location
$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 50,60
$textfield.Size = New-Object Drawing.Point 200,30

# Create Button and set text and location
$button = New-Object Windows.Forms.Button
$button.text = "Greeting"
$button.Location = New-Object Drawing.Point 100,90

# Set up event handler to extarct text from TextBox and display it on the Label.
$button.add_click({

$label.Text = "Hello " + $textfield.text

})
	
# Add the controls to the Form
$form.controls.add($button)
$form.controls.add($label)
$form.controls.add($textfield)

# Display the dialog
$form.ShowDialog()







#Example4 CheckBox:

 [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    
    # Set the size of your form
    $Form = New-Object System.Windows.Forms.Form
    $Form.width = 500
    $Form.height = 200
    $Form.Text = "My First Form with a working checkbox”"
 
    # Set the font of the text to be used within the form
    $Font = New-Object System.Drawing.Font("Times New Roman",12)
    $Form.Font = $Font
 
    # create your checkbox 
    $checkbox1 = new-object System.Windows.Forms.checkbox
    $checkbox1.Location = new-object System.Drawing.Size(30,30)
    $checkbox1.Size = new-object System.Drawing.Size(250,50)
    $checkbox1.Text = "Enable/Disable OK button"
    $checkbox1.Checked = $true
    $Form.Controls.Add($checkbox1)  
 
    # Add an OK button
    $OKButton = new-object System.Windows.Forms.Button
    $OKButton.Location = new-object System.Drawing.Size(130,100)
    $OKButton.Size = new-object System.Drawing.Size(100,40)
    $OKButton.Text = "OK"
    $OKButton.Add_Click({$Form.Close()})
    $form.Controls.Add($OKButton)
 
    #Add a cancel button
    $CancelButton = new-object System.Windows.Forms.Button
    $CancelButton.Location = new-object System.Drawing.Size(255,100)
    $CancelButton.Size = new-object System.Drawing.Size(100,40)
    $CancelButton.Text = "Cancel"
    $CancelButton.Add_Click({$Form.Close()})
    $form.Controls.Add($CancelButton)
    
    ###########  This is the important piece ##############
    #                                                     #
    # Do something when the state of the checkbox changes #
    #######################################################
    $checkbox1.Add_CheckStateChanged({
    $OKButton.Enabled = $checkbox1.Checked })
 
    
    # Activate the form
    $Form.Add_Shown({$Form.Activate()})
    [void] $Form.ShowDialog() 
	
	
	