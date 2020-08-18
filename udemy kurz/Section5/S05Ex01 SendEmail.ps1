	# Details of the Login Username and SMTP server. These can very from one 
	# Mail Service Provder to another
	$SMTPServer = "smtp.gmail.com"
	$SMTPPort = "587"
	$Username = "testingpurpose201801@gmail.com"
	$Password = "TestingPurpose_forStudents"

	
	#Add email address of person in to & cc  whom you are sending email (Multiple addresses should be comma seperated)
	$to = "testingpurpose201801@gmail.com"
	$cc = "testingpurpose201801@gmail.com"


	$subject = "Email Subject"
	$body = "Dear Sir/Madam, 
			This is a system generated email. Please do not reply.

			Information: This is the important information
			Regards,
			Team XYZ
			"

	$message = New-Object System.Net.Mail.MailMessage
	$message.subject = $subject
	$message.body = $body
	$message.to.add($to)
	$message.cc.add($cc)
	$message.from = "testingpurpose201801@gmail.com"

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);

$smtp.send($message)