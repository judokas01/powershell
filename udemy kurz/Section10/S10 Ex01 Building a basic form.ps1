#Example1:

#    --Loading Assembly----
#    You can use either [reflection.assembly] or Add-Type
#    [reflection.assembly]::LoadWithPartialName("Windows.Forms")
#    To understand it in detail, please visit https://www.madwithpowershell.com/2013/10/add-type-vs-reflectionassembly-in.html


[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")

$form= New-Object Windows.Forms.Form

$form.ShowDialog()










#Example 2:
$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.BackColor="cyan"
$form.text="My First PowerShell Form"
$form.ShowDialog()






#Example 2.0 Creating Label
$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.text="My First PowerShell Form"
$form.BackColor="cyan"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.text = "Hi Friend!! How are you doing today?"

$form.ShowDialog()










#Example 2.1 Creating Label

$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.text="My First PowerShell Form"
$form.BackColor="cyan"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.text = "Hi Friend!! How are you doing today?"

$form.controls.add($label)
$form.ShowDialog()





#Example 2.2: Creating Label
$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.text="My First PowerShell Form"
$form.BackColor="cyan"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.text = "Hi Friend!! How are you doing today?"

$label.Width=220
$label.height=20

$label.Location = New-Object Drawing.Point 100,30

$label.BackColor='orange'

$form.controls.add($label)

$form.ShowDialog()






#

#Example 3: Creating Label & textbox
$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.text="My First PowerShell Form"
$form.BackColor="cyan"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.text = "Hi Friend!! How are you doing today?"
$label.Width=220
$label.height=20
$label.Location = New-Object Drawing.Point 100,30
$label.BackColor='orange'



# Create TextBox and set text, size and location
$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 100,80
$textfield.Width=220
$textfield.height=20


$form.controls.add($label)
$form.controls.add($textfield)
$form.ShowDialog()








#Example 4: Creating Label & textbox & button
$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.text="My First PowerShell Form"
$form.BackColor="cyan"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.text = "Hi Friend!! How are you doing today?"
$label.Width=220
$label.height=20
$label.Location = New-Object Drawing.Point 100,30
$label.BackColor='orange'



# Create TextBox and set text, size and location
$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 100,80
$textfield.Width=220
$textfield.height=20


# Create TextBox and set text, size and location
$btn = New-Object Windows.Forms.Button
$btn.Location = New-Object Drawing.Point 100,120
$btn.Width=200
$btn.height=40
$btn.BackColor="yellow"
$btn.Text = "Send these details to Admin"


$form.controls.add($label)
$form.controls.add($textfield)
$form.controls.add($btn)

$form.ShowDialog()






#Example 4: Add Click
$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.text="My First PowerShell Form"
$form.BackColor="cyan"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.text = "Hi Friend!! How are you doing today?"
$label.Width=220
$label.height=20
$label.Location = New-Object Drawing.Point 100,30
$label.BackColor='orange'


# Create TextBox and set text, size and location
$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 100,80
$textfield.Width=220
$textfield.height=20


# Create TextBox and set text, size and location
$btn = New-Object Windows.Forms.Button
$btn.Location = New-Object Drawing.Point 100,120
$btn.Width=200
$btn.height=40
$btn.BackColor="yellow"
$btn.Text = "Send these details to Admin"


$btn.Add_Click(
    {

    #You can call any function from here which you want to be executed on clicking the button
    $x=$textfield.Text;
    Write-Host $x
   }
)


$form.controls.add($label)
$form.controls.add($textfield)
$form.controls.add($btn)
$form.ShowDialog()



#Example 4-II: Add Click
$form= New-Object Windows.Forms.Form

$Form.width = 500
$Form.height = 300
$form.text="My First PowerShell Form"
$form.BackColor="cyan"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.text = "Hi Friend!! How are you doing today?"
$label.Width=220
$label.height=20
$label.Location = New-Object Drawing.Point 100,30
$label.BackColor='orange'


# Create TextBox and set text, size and location
$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 100,80
$textfield.Width=220
$textfield.height=20


# Create TextBox and set text, size and location
$btn = New-Object Windows.Forms.Button
$btn.Location = New-Object Drawing.Point 100,120
$btn.Width=200
$btn.height=40
$btn.BackColor="yellow"
$btn.Text = "Send these details to Admin"


$btn.Add_Click(
    {

    #You can call any function from here which you want to be executed on clciking the button
    $x=$textfield.Text;
    Write-Host $x

    [System.Windows.Forms.MessageBox]::Show("Details Accepted." , "Admin Says")
    $form.Close()
   }
)


$form.controls.add($label)
$form.controls.add($textfield)
$form.controls.add($btn)
$form.ShowDialog()
