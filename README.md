# DevOps Bootcamp - Google Cloud + GitHub + Terraform 

## Overview

The individual labs below will walk through configuring Google Cloud and the Cloud Build GitHub App to deploy and update basic infrastructure using Terraform. If you run into issues please review the FAQ.

[**Frequently Asked Questions**](docs/faq.md)

---

## Lab 0 - Prerequisites

The pre-requisites lab will walk through getting access to GitHub and Google Cloud

- GitHub Account
- Google Cloud Free Account

[**Start Lab 0 - Prerequisites**](docs/lab_0.md)

---

## Lab 1 - Connectivity

The first lab will get us up and running with Google Cloud and connecting to GitHub via the Google Cloud GitHub App.

- Create Repo from Template
- Create Project on Google Cloud
- Enable Cloud Build and Install GitHub App
- Configure GitHub App Triggers
- Run Cloud Build

[**Start Lab 1 - Connectivity**](docs/lab_1.md)

---

## Lab 2 - Store Terraform state & Deploy Infrastructure

The second lab will deploy IaaS components consisting of VPCs, Virtual Machines, Load Balancer using Terraform executed via Cloud Build.

- Update Cloud Build service account permissions
- Create Cloud Storage bucket for Terraform state
- Configure GitHub App Triggers
- Run Cloud Build
- Scale Out Resources
- Clean Up Resources

[**Start Lab 2 - Store Terraform state & Deploy Infrastructure**](docs/lab_2.md)

---

## Lab 3 - Deploy to App Engine

The third lab will deploy PaaS components consisting of App Engine, website code, using gcloud commands executed via Cloud Build.

- Create Google App Engine Instance
- Enable App Engine Admin API
- Configure GitHub App Trigger
- Run Cloud Build
- Continuous Deployment of Changes
- Unit Testing

[**Start Lab 3 - Deploy to App Engine**](docs/lab_3.md)

---

## Lab 4 - CIO Challenge

The fourth lab is intended for one of the lab facilitators to run as a demo, not for each attendee to deploy in their lab environment due to the amount of infrastructure which is deployed. If you choose to deploy this lab please be aware of subscription quota limitations, and cost considerations.

- Deploy Solution

[**Start Lab 4 - CIO Challenge**](docs/lab_4.md)

---

![Google Cloud+GitHub](docs/images/google_github.png)