# terraform-on-azure
An example of how to use Terraform on Azure with Github actions and remote state storage in a storage account

This configuration requires you to have Repository Secrets setup in order for the Github actions to work:

- ARM_CLIENT_ID
- ARM_CLIENT_SECRET
- ARM_SUBSCRIPTION_ID
- ARM_TENANT_ID

If you want to follow least priviliged RBAC then you should setup multiple App Registration and have each one given only permission to it's corresponding scope. Example  you have 2 subscriptions called 'HelloWorld-NonProd' and 'HelloWorld-Prod'. You setup 2 app registrations called 'HelloWorld-NonProd-Terraform' and 'HelloWorld-Prod-Terraform' and permission each one to it's corresponding subscription (usually contributor). Now, rather than setting up the 4 repository secrets as above, first create 2 environments in your Github Repo and have the Secrets be environment scoped rather than subscription scoped. This tells your Github actions pipeline to use the appropriate Service Principal when deploying to the respective environment.