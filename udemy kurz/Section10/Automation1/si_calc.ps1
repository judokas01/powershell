
 
 #Automation1:   Enhanced
 

#======================================
#------------------------
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form;
 $form.Width = 500;
 $form.Height = 250;
 $form.Text = $title;
 $form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;

##############Define text label1
 $textLabel1 = New-Object System.Windows.Forms.Label;
 $textLabel1.Left = 25;
 $textLabel1.Top = 15;

$textLabel1.Text = 'Principal';

##############Define text label2

$textLabel2 = New-Object System.Windows.Forms.Label;
 $textLabel2.Left = 25;
 $textLabel2.Top = 50;

$textLabel2.Text = 'Rate';

##############Define text label3

$textLabel3 = New-Object System.Windows.Forms.Label;
 $textLabel3.Left = 25;
 $textLabel3.Top = 85;

$textLabel3.Text = 'Time(in years)';





$textLabel4 = New-Object System.Windows.Forms.Label;
 $textLabel4.Left = 25;
 $textLabel4.Top = 155;

$textLabel4.Text = 'Interest Amount';


$textLabel5 = New-Object System.Windows.Forms.Label;
 $textLabel5.Left = 155;
 $textLabel5.Top = 155;

$textLabel5.Text = '---';




############Define text box1 for input
 $Principal = New-Object System.Windows.Forms.TextBox;
 $Principal.Left = 150;
 $Principal.Top = 10;
 $Principal.width = 200;

############Define text box2 for input

$Rate = New-Object System.Windows.Forms.TextBox;
 $Rate.Left = 150;
 $Rate.Top = 50;
 $Rate.width = 200;

############Define text box3 for input

$Time = New-Object System.Windows.Forms.TextBox;
 $Time.Left = 150;
 $Time.Top = 90;
 $Time.width = 200;

#############Define default values for the input boxes
 $defaultValue = "0"
$Principal.Text = $defaultValue;
 $Rate.Text = $defaultValue;
 $Time.Text = $defaultValue;

#############define button
 $button = New-Object System.Windows.Forms.Button;
 $button.Left = 360;
 $button.Top = 85;
 $button.Width = 100;
 $button.Text = 'Enter';

############# This is when you have to close the form after getting values
 $eventHandler = [System.EventHandler]{
         $Principal.Text;
         $Rate.Text;
         $Time.Text;

         #################return values
        $princiapl_amount =  [double] $Principal.Text
        $interest_rate = [double]$Rate.Text
        $time_period = [double] $Time.Text

        $interest = ($princiapl_amount * $interest_rate * $time_period)/100
        "Your will have to pay interest of $interest currency units"

        $textLabel5.Text = $interest;

       #  $form.Close();
 };

$button.Add_Click($eventHandler) ;

#############Add controls to all the above objects defined
 $form.Controls.Add($button);
 $form.Controls.Add($textLabel1);
 $form.Controls.Add($textLabel2);
 $form.Controls.Add($textLabel3);
 $form.Controls.Add($textLabel4);
 $form.Controls.Add($textLabel5);
 $form.Controls.Add($Principal);
 $form.Controls.Add($Rate);
 $form.Controls.Add($Time);
 $ret = $form.ShowDialog();


 