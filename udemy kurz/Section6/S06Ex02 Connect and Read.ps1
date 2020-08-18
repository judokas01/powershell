#===================================================================================================

$connectionString= "Data Source=XE;User Id=SYSTEM;Password=SYSTEM;   Integrated Security=no"
[System.Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient")

$connection = New-Object  System.Data.OracleClient.OracleConnection($connectionString)
$connection.open()


$queryString = "select * from DOMAIN_SYSTEM_INFORMATION"


$command = new-Object System.Data.OracleClient.OracleCommand($queryString, $connection)

<#
Another method of Preparing  command 

$command=$connection.CreateCommand()
$command.CommandText=$queryString

#>

$reader=$command.ExecuteReader()


Write-Verbose "Printing the table data" -Verbose
while ($reader.Read()) {
   [String]$reader.GetInt32(0) + ',' + $reader.GetString(2) + ', ' + $reader.GetString(4)

}



$Connection.Close()

#===================================================================================================









#===================================================================================================
#Case2:   In SQL Server Database
$SQLServer=""
$DBName=""
$user_name=""
$db_password=""

$connectionString="Data Source=$SQLServer;Initial Catalog=$DBName;uid=$user_name;pwd=$db_password"
$connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)
$query = "select * from DOMAIN_SYSTEM_INFORMATION"
$command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
$connection.Open()

$Reader = $command.ExecuteReader()

$Connection.Close()
#===================================================================================================
