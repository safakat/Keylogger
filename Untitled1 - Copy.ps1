Param( [String]$Att,
       [String]$Subj,
       [String]$Body
      )

Function Send-EMail
{
    Param(
             [Parameter(`
             Mandatory=$true)]
        [String]$To,
             [Parameter(`
             Mandatory=$true)]
        [String]$From,
            [Parameter(`
            mandatory=$true)]
        [String]$Password,
            [Parameter(`
            Mandatory=$true)]
        [String]$Subject,
            [Parameter(`
            Mandatory=$true)]
        [String]$Body,
            [Parameter(`
            Mandatory=$true)]
        [String]$attachment
        )

try
{
   $Msg = New-object System.Net.Mail.MailMessage($From, $To,  $Subject, $Body)
   $Srv = "smtp.gmail.com"
   if($attachment -ne $null)
   {
    try
    {
        $Attachment = $attachment -split ("\:\:");

        Foreach($val in $Attachments)
        {
            $attch = New-object System.net.Mail.Attachmet($val)
            $Msg.Attachments.Add($attch)
        }
    }
    catch
    {
        exit 2;
    }

    $Client = New-object Net.Mail.SmtpClient($Srv, 587)
    $Client.EnableSsl = $true
    $Client.Credentials = new-object System.Net.NetworkCredential($From.split("@")[0]. $Password);
    $Client.Send($Msg)
    Remove-variable -Name Client
    Remove-variable -Name password
    exit 7;

   }
  
}
 catch
   {
        exit 3;
   }
}

try
{
    Send-Email
        -attachment $att
        -To "Address of the recipient"
        -Body $body
        -subject $Subj
        -password "fuckfuckfuck"
        -From "Address of the Sender"

}
catch
{
    exit 4;
}