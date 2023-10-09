# Terraform Beginner Bootcamp 2023 - Week 1

## Fixing Tags

[How to Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Local delete a tag

```sh
git tag -d <tag_name>
```

Remotely delete tag

```sh
git push --delete origin tagname
```

Checkout the commit that you want to retag. You can grab the sha from your GitHub history.

```sh
git checkout <SHA>
git tag M.M.P
git push --tags
git checkout main
```

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kinds of variables:
- Environment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibly in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

The `-var-file` flag is used to pass Input Variable values into Terraform `plan` and `apply` commands using a file that contains the values. This allows you to save the Input Variable values in a file with a `.tfvars` extension that can be checked into source control for you variable environments you need to deploy to / manage.

### terraform.tvfars

This is the default file to load in terraform variables in bulk

### auto.tfvars

A `terraform.tfvars` file is used to assign variable values that are automatically loaded by Terraform during the `apply` or `plan` commands. This file should be created in the root directory of your Terraform project and should contain key-value pairs for your variables as shown below:

```
variable_name = "variable_value"
```
For example:

```
first_name   = "John"
last_name    = "Smith"
```

Furthermore, the convention is to add this `terraform.tfvars` file in your `.gitignore file` so that you don't check it into git. The reason for this is that you would typically define sensitive values in this file. You can also create a `terraform.tfvars.example` file that shows an example of the content of the `terraform.tfvars` file with no sensitive values. This would serve as an example for users using your code.

### order of terraform variables

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

1. Environment variables
2. The `terraform.tfvars` file, if present.
3. The `terraform.tfvars.json` file, if present.
4. Any `*.auto.tfvars or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
5. Any `-var` and `-var-file` options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

## Dealing With Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likely will have to tear down all your cloud infrastructure manually.

You can use `terraform import` but it will not work for all cloud resources. You need check the `terraform providers`` documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and deletes or modifies cloud resource manually through ClickOps. 

If we run `Terraform plan`` it will attempt to put our infrstraucture back into the expected state fixing Configuration Drift

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommended to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.

The module has to declare these terraform variables in its own variables.tf

```tf
module "terrahome_aws" {
  source = "./modules/terrahome_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source, we can import the module from various places eg:

- locally
- Github
- Terraform Registry

```tf
module "terrahome_aws" {
  source = "./modules/terrahome_aws"
}
```


[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely produce older examples, that could be deprecated, often affecting providers.

## Working with Files in Terraform


### Fileexists function

This is a built in terraform function to check the existance of a file.

```tf
condition = fileexists(var.error_html_filepath)
```

https://developer.hashicorp.com/terraform/language/functions/fileexists

### Filemd5

https://developer.hashicorp.com/terraform/language/functions/filemd5

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

``````
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}
``````

## Terraform Locals

Locals allows us to define local variables.

It can be very useful when we need transform data into another format and have referenced a varaible.

```tf
locals {
  s3_origin_id = "MyS3Origin"
}
```

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)


## Terraform Data Sources

This allows us to source data from cloud resources.

This is useful when we want to reference cloud resources without importing them.

```tf
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON

We use the jsonencode to create the json policy inline in the hcl.

```tf
> jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

### Changing the Lifecycle of Resources

[Meta Arguments Lifcycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Terraform Data

Plain data values such as `Local Values` and `Input Variables` don't have any side-effects to plan against and so they aren't valid in `replace_triggered_by`. You can use `terraform_data's` behavior of planning an action each time `input` changes to indirectly use a plain value to trigger replacement.

[Managed Resource Type](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

