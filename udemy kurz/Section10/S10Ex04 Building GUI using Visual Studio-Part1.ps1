
#ERASE ALL THIS AND PUT XAML BELOW between the @" "@
$inputXML = @"
<Window x:Class="WpfApplication5.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApplication5"
        mc:Ignorable="d"
        Title="My GUI App" Height="350" Width="525">
    <Grid>
        <Grid HorizontalAlignment="Left" Height="299" Margin="0,10,0,0" VerticalAlignment="Top" Width="497" Background="#FF289989">
            <Label x:Name="label" Content="Name" HorizontalAlignment="Left" Margin="57,43,0,0" VerticalAlignment="Top" Background="#FFE8DADA"/>
            <Label x:Name="label1" Content="Age" HorizontalAlignment="Left" Margin="57,100,0,0" VerticalAlignment="Top" Background="#FFE8DADA"/>
            <CheckBox x:Name="check_sports" Content="Sports" HorizontalAlignment="Left" Margin="167,165,0,0" VerticalAlignment="Top"/>
            <CheckBox x:Name="check_music" Content="Music" HorizontalAlignment="Left" Margin="265,165,0,0" VerticalAlignment="Top"/>
            <TextBox x:Name="textbox_name" HorizontalAlignment="Left" Height="23" Margin="196,43,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Background="#FF876C6C"/>
            <TextBox x:Name="textbox_age" HorizontalAlignment="Left" Height="23" Margin="196,100,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Background="#FF876C6C"/>
            <Button x:Name="btn_submit" Content="Submit" HorizontalAlignment="Left" Margin="57,224,0,0" VerticalAlignment="Top" Width="354" Height="31" Background="#FFCD8A8A"/>
            <Label x:Name="label2" Content="Hobbies" HorizontalAlignment="Left" Margin="61,159,0,0" VerticalAlignment="Top" Width="52" Background="#FFE8DADA"/>
        </Grid>

    </Grid>
</Window>

"@       
 
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
 $inputXML



[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')



#===========================================================================
#Read XAML
#===========================================================================
[xml]$XAML = $inputXML


$reader=(New-Object System.Xml.XmlNodeReader $xaml)

try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch{Write-Error "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
 
#===========================================================================


 $Form.ShowDialog() | out-null

