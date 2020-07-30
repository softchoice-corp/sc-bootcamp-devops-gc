# Frequently Asked Questions

## Do I need to use the same email address for my Google Cloud and GitHub Accounts

No, you can use different email addresses.

## Can I use my work email if signing up for a free Google Cloud Account?

You should use a personal email when signing up for a free Google Cloud Account, since someone else at your company could have already signed up and you may not be able to create another free account linked to the same organization.

## What permissions, roles, or rights do I need in my Google Cloud project?

If using your own free Google Cloud account, your account will be an Owner on the default projects and any projects you create by default.

If using an existing Google Cloud account/project, confirm you are the Owner on the project you are using.

## When I try to push my code I get a permission error

Make sure you're not trying to modify the softchoice-corp repo

In lab 1 you will create a new `my-gc-devops-bootcamp` repo in your account by using the softchoice-corp template. You need to make sure that when you push the code you changed during the lab that you are executing the commits in your local repo otherwise you will receive a permission error. Remember, you do not have permission to make changes to the template itself (github.com/softchoice-corp/sc-gc-devops-bootcamp) only the repos you create in your account.

## How can I increase my vCPU quota?

Follow the documentation here: [https://cloud.google.com/compute/quotas#requesting_additional_quota](https://cloud.google.com/compute/quotas#requesting_additional_quota)

## Can more than one user share a single Google Cloud account?

Yes, however recommend that each user use a separate Project and that each is an Owner on the project they are using.
