function Test-SQLConnection
{    
    [OutputType([bool])]
    Param
    (
        [Parameter(Mandatory=$true,
                    ValueFromPipelineByPropertyName=$true,
                    Position=0)]
        $ConnectionString
    )
    try
    {
        $sqlConnection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString;
        $sqlConnection.Open();
        $sqlConnection.Close();

        return $true;
    }
    catch
    {
        return $false;
    }
}
<#
Test-SQLConnection "Data Source=host-db01.example.com;database=snoopy;User ID=EXAMPLE.net\user01;Password=**Explicit**;Integrated Security=true;" 

<#
$userName = 'EXAMPLE.com\User02'
$password = '**Explicit**'
$WindowsAuthentication = 'true'
$connectionString = 'Data Source={0};database={1};UID={2};PWD={3};Integrated Security={4}' -f $ServerName,$DatabaseName,$userName,$password,$WindowsAuthentication
Test-SQLConnection $connectionString
#>
