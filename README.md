# alias-codecommit
A CloudFormation .yml file and some supporting scripts for creating a custom domain alias for your AWS CodeCommit repositories.

To create the alias for git.foo.com:
``` console
$ ./create_site.sh git.foo.com foo.com.
```

It is Assumed that foo.com is a hosted Zone in Route53.

The CF .yml file sets up the mapping so that 
https://git-codecommit.us-east-1.amazonaws.com/v1/repos/bar is mapped to https://git.foo.com/bar

Improvements/Customizations that could be made:

1. add the ability to pass in an SSL Cert ARN.

**NOTE:**
The aws codecommit credential-helper does not seem to work with this setup.  You will need to create
some HTTPS CodeCommit credentials and us them when you are prompted.
