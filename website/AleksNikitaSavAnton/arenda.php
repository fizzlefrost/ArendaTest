<html>
 <head>
  <title>WEB-site of the Alekseev Nikta's and Savvin Anton's website rieltors</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 </head>
 <body>
	<?php
	printf('<P>Hello world! Searching for every human:</P> %s',"\n");

	$link = mysqli_connect('10.14.129.132', 'AlekseevNikita', '9YFJ9skR','AlekseevNikitaDB')
	    or die('Error: Unable to connect: ' . mysqli_connect_error());
	printf('<P>Succesfully connected!</P> %s',"\n");

	$SQLquery = 'SELECT * FROM arenda';
	$SQLresult = mysqli_query($link,$SQLquery);

	printf('<table cellspacing=\' 0 \' border=\' 1 \'> %s',"\n");
	printf('<TR> %s',"\n");
	printf('	<TH>4elovek_id_4elovek</TH> %s',"\n");
	printf('	<TH>kvartiri_id_kvartiri</TH> %s',"\n");
	printf('	<TH>oplata v mesac</TH> %s',"\n");
	printf('	<TH>predoplata</TH> %s',"\n");
	printf('	<TH>arenda begin</TH> %s',"\n");
	printf('	<TH>arenda end</TH> %s',"\n");
	printf('</TR> %s',"\n");


	while ($result = mysqli_fetch_array($SQLresult,MYSQLI_NUM))
	{
		printf('<TR>');
		printf('<TD> %s </TD> <TD> %s </TD> <TD> %s </TD> <TD> %s </TD> <TD> %s </TD> <TD> %s </TD>',$result[1],$result[2],$result[3],$result[4],$result[5],$result[6]);
		printf('</TR> %s',"\n");
	}
	printf('</table> %s',"\n");
	mysqli_free_result($SQLresult);
	mysqli_close($link);

	?>
	<a href="index.html"> <P>GO BACK</P> </a>
 </body>
</html>