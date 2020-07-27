# Lab 2 - IaaS

- [Update Cloud Build service account permissions](#Update-Cloud-Build-service-account-permissions)
- [Create Cloud Storage bucket for Terraform state](#Create-Cloud-Storage-bucket-for-Terraform-state)
- [Configure GitHub App Triggers](#Configure-GitHub-App-Triggers)
- [Run Cloud Build](#Run-Cloud-Build)
- [Scale Out Resources](#Scale-Out-Resources)
- [Clean Up Resources](#Clean-Up-Resources)

---

## Overview

The second lab will deploy IaaS components consisting of a Virtual Private Cloud (VPC), Virtual Machines, Load Balancer using Terraform scripts via Cloud Build.

---

## Update Cloud Build service account permissions

To allow Cloud Build service account to run Terraform scripts with the goal of managing Google Cloud resources, you need to grant it appropriate access to your project. For simplicity, project editor access is granted here. But when the project editor role has a wide-range permission, in production environments you must follow your company's IT security best practices, usually providing least-privileged access.

1. Start Cloud Shell

> ![lab_2_cloud_shell](images/lab2-cloud-shell.jpg)

2. In Cloud Shell, retrieve the email for your project's Cloud Build service account

```
CLOUDBUILD_SA="$(gcloud projects describe $PROJECT_ID \
    --format 'value(projectNumber)')@cloudbuild.gserviceaccount.com"
```

3. Grant the required access to your Cloud Build service account

```
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$CLOUDBUILD_SA --role roles/editor
```

---

## Create Cloud Storage bucket for Terraform state

By default, Terraform stores state locally in a file named terraform.tfstate. This default configuration can make Terraform usage difficult for teams, especially when many users run Terraform at the same time and each machine has its own understanding of the current infrastructure. To help you avoid such issues, this section configures a remote state that points to a Cloud Storage bucket. Remote state is a feature of backends and, in this bootcamp, is configured in the backend.tf files.

1. Start Cloud Shell

> ![lab_2_cloud_shell](images/lab2-cloud-shell.jpg)

2. In Cloud Shell, create the Cloud Storage bucket

```
PROJECT_ID=$(gcloud config get-value project)
gsutil mb gs://${PROJECT_ID}-tfstate
```

3. Enable Object Versioning to keep the history of your deployments

```
gsutil versioning set on gs://${PROJECT_ID}-tfstate
```

4. Replace the PROJECT_ID placeholder with the project ID in the backend.tf

---

## Configure GitHub App Triggers

We will now configure a Cloud Build trigger that will run the terraform commands to deploy the networking and compute resources in this project.

1. Open the **Triggers** page in the Google Cloud Console and click **Create Trigger**

> ![lab2-create-trigger](images/lab2-create-trigger.png)

2. Similar to Lab 1, enter a name and description for your trigger. Then select your copy of the sc-gc-devops-bootcamp repository as the Source and indicate that pushes to any branch will trigger a build.

3. Expand the 'Show Included and Ignored File Filters' section and enter the details below to indicate that only changes under the lab_1 folder should trigger a build.

> ![lab2-create-trigger-includedfiles](images/lab2-create-trigger-includedfiles.jpg)

5. Select the `cloudbuild-lab2.yaml` Cloud Build configuration file under the lab_2 folder

> ![lab2-create-trigger-buildconfig](images/lab2-create-trigger-buildconfig.jpg)

6. Click Create to finish creating the trigger on Cloud Build

---

## Run Cloud Build

The workflow we just created is triggered by changes made to the files in the `lab_2/` directory. Let's make a change here to kick off the workflow. The `readme.txt` can be modified by simply adding a new line or some text. The act of committing this change to the `master` branch will instruct GitHub Actions to kick off our workflow.

1. Navigate to **Code**, and browse to the `lab_2/readme.txt` file. Click the pencil icon to edit the file, and add a new line. Provide a commit message and commit your change.

2. Navigate to **Cloud Build -> History** and you should see the build executing with the lab2-trigger name.

The workflow for Lab 2 is going to take a few minutes to execute. While it is running take a look at the terraform files and try to infer what resources will be deployed.

The terraform files defines several Google Cloud resources to deploy:

- Virtual Network with one subnet
- Managed instance group with two instances in the same region
- Network TCP load balancer

> ![lab_2_diagram](images/lab_2_diagram.png)

3. Once the workflow has completed you can access the Google Cloud console and view the resources the workflow created. In the Google Cloud console click the top left &#9776; hamburger menu, navigate to Compute Engine to view the running instances. Navigate to VPC Network -> VPC Networks to see the VPCs created. Navigating to Network Services -> Load Balancing will display the load balancers created.

---

## Scale Out Resources

Let's scale out the solution from 2 virtual machines to 4.

1. Navigate to **Code** and browse to the `lab_2/main.tf` file.

2. Click the pencil icon to edit the file. In the `managed_instance_group` module, change the `target_size` from 2 to 4.

3. Enter a commit message and click `Commit changes`

4. Navigate to **Cloud Build -> History** and you should see your build executing.

5. Once the build is completed we can open the Google Cloud Console and confirm there are now four virtual machines deployed. We can also check the Load Balancer and see that all 4 are already configured in the backend server pool.

---

## Clean Up Resources

To mimimize billing usage in your subscription we can remove all of the resources we deployed with Cloud Build by executing a Terraform destroy.

1. Create a new trigger on Cloud Build called `lab2-destroy-trigger`

2. Use similar settings to the trigger created previously, except set the Included files filter to `lab_2/destroy.txt`, leave the Ignored files filter blank. For the Build Configuration, set the Cloud Build configuration file to `lab_2/cloudbuild-destroy-lab2.yaml`. Click create to finish creating the trigger.

3. Go to the triggers page and select Run trigger to manually execute the build, which will destroy all the resources created.

---

## End of Lab 2

Links to more learning:

- **Managing Infrastructure as code**: [https://cloud.google.com/solutions/managing-infrastructure-as-code](https://cloud.google.com/solutions/managing-infrastructure-as-code)
- **Substituting Cloud Build variable values**: [https://cloud.google.com/cloud-build/docs/configuring-builds/substitute-variable-values](https://cloud.google.com/cloud-build/docs/configuring-builds/substitute-variable-values)
- **Terraform on Google Cloud**: [https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform](https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform)
- **Google Cloud VPC**: [https://cloud.google.com/solutions/best-practices-vpc-design](https://cloud.google.com/solutions/best-practices-vpc-design)
- **Google Cloud Virtual Machines**: [https://cloud.google.com/compute/docs/instances](https://cloud.google.com/compute/docs/instances)
- **Google Cloud Load Balancer**: [https://cloud.google.com/load-balancing/docs/network](https://cloud.google.com/load-balancing/docs/network)
- **Managed Instance Groups**: [https://cloud.google.com/compute/docs/instance-groups/working-with-managed-instances](https://cloud.google.com/compute/docs/instance-groups/working-with-managed-instances)

![constructocat](images/constructocat2.jpg)