#include<stdio.h> 
#include<syslog.h>

/* Author: Nitin Maiya */

int main(int argc, char* argv[])
{
	openlog(NULL, 0, LOG_USER);

	if(argc < 3)
	{
		syslog(LOG_ERR, "Invalid args.");
		syslog(LOG_ERR, "1. File path 2. String to write");
		closelog();
		return 1;
	}

	char* writefile = argv[1];
	char* writestr = argv[2];

	FILE *fp = fopen(writefile, "w");
	if(fp == NULL)
	{
		syslog(LOG_ERR, "Unable to open file for writing.");
		closelog();
		return 1;
	}

	if(fprintf(fp, "%s", writestr) < 0)
	{
		syslog(LOG_ERR, "Write failed.");
		fclose(fp);
		closelog();
		return 1;
	}

	fclose(fp);
	syslog(LOG_DEBUG, "Writing %s to file %s", writestr, writefile);
	closelog();
	
	return 0;
}	
