# Terraform Parent -> Child module as variable

Given a parent (core/shared) module that exposes outputs for a child module to consume, do we have to duplicate everything into the child module as inputs, or can we pass the entire parent module to the child module as inputs? (In theory this sets up the dependency chain correctly as well.)

Turns out, as of at least Terraform 1.1.8 (and likely earlier) this is possible.

Anything the child needs to access **must** be exported from the parent module as an output, but the child can just take in the entire module as a variable and use it.

<https://github.com/hashicorp/terraform/issues/15818> was quite useful in figuring this out.

## Example

In this worked example we have a `module.parent` and `module.child` being setup in the root module (/workspace). The parent takes a prefix as input, and generates a petname inside itself. The parent then exposes both the prefix and the petname as outputs from itself.

The child module then takes a single input, `parent` to which we pass the entire `module.parent`. Inside the child module we can then use `var.parent.petname_id` to access the output on the parent module.

The old alternative to this would be defining input variabels on `module.child` that match the outputs on `module.parent` and duplicating vertical noise everywhere.

Outputs from both modules show the data being passed through successfully.
