# Lab 1 - Connectivity

- [Create Repo from Template](#Create-Repo-From-Template)
- [Create Project on Google Cloud](#Create-Google-Cloud-Project)
- [Enable Cloud Build and Install GitHub App](#Enable-Cloud-Build-and-Install-GitHub-App)
- [Configure GitHub App Triggers](#Configure-GitHub-App-Triggers)
- [Run GitHub Actions](#Run-GitHub-Actions)

---

## Create Repo From Template

1. Access the source repo url: [https://github.com/softchoice-corp/sc-gc-devops-bootcamp](https://github.com/softchoice-corp/sc-gc-devops-bootcamp)

2. Click the green **Use this template** button. This will copy all of the content from the source repo into a new repo under your GitHub account.

3. Provide a new repository name and description. The repo can be left as `Public`, and leave the `Include all branches` option unselected. Click the green **Create repository from template** button.

4. Once the repository creation is completed you should see that your new repo is in your account, and was generated from _softchoice-corp/sc-gc-devops-bootcamp_.

> ![lab_1_template_01](images/lab_1_template_01.gif)

---

## Create Google Cloud Project

A project in Google Cloud is an isolated container for all your work and cloud resources. Use an existing project or create a brand new one (recommended) for your work related to this bootcamp. Deleting a project will also delete all resources created within that project.

To create a new Project:

1. Click the Project Selector drop down at the top of your Cloud Console

> ![lab1-project-selector](images/lab1-project-selector.png)

2. Select New Project

> ![lab1-new-project](images/lab1-new-project.png)

3. Enter project details and push Create

> ![lab1-new-project-details](images/lab1-new-project-details.png)

4. Ensure the project you just created is selected on the Project Selector drop down

---

## Enable Cloud Build and Install GitHub App

1. Navigate to Cloud Build via the hamburger menu as shown below, and 'Enable API'

> ![lab1-cloud-build](images/lab1-cloud-build.png)

2. The Cloud Build GitHub App connects your GitHub repository to your Google Cloud project. Follow the directions on this [page](https://cloud.google.com/cloud-build/docs/automating-builds/create-github-app-triggers) to install the Cloud Build GitHub App.

---

## Configure GitHub App Triggers

The Cloud Build GitHub App triggers enable you to automatically invoke builds on Git pushes and pull requests, and view your build results on GitHub and Google Cloud Console.

1. Open the **Triggers** page in the Google Cloud Console and click **Create Trigger**

> ![lab1-create-trigger](images/lab1-create-trigger.png)

2. Enter a name and description for your trigger. Then select the repository Event to invoke your trigger. Here we will set the trigger to start a build on commits that contain a particular tag.

> ![lab1-create-trigger-event](images/lab1-create-trigger-event.png)

3. Select your copy of the sc-gc-devops-bootcamp repository as the Source and we will specify a regular expression that indicates that pushes to any branch in the repository will trigger a build.

> ![lab1-create-trigger-source](images/lab1-create-trigger-source.png)

4. Expand the 'Show Included and Ignored File Filters' section and enter the details below to indicate that only changes under the lab_1 folder should trigger a build.

> ![lab1-create-trigger-includedfiles](images/lab1-create-trigger-includedfiles.png)

5. Select the `cloudbuild-lab1.yaml` Cloud Build configuration file under the lab_1 folder. This configuration file defines the build steps that will be performed when a build is triggered.

> ![lab1-create-trigger-buildconfig](images/lab1-create-trigger-buildconfig.png)

6. Click Create to finish creating the trigger on Cloud Build

7. Navigate to the `lab_1/cloudbuild-lab1.yaml` and we can examine what the Cloud Build config will actually do. We can see that it executes the Cloud SDK builder to run gcloud and get the current project in the first step and the second step retrieves the current account that is executing the build.

```
steps:
  - name: gcr.io/google.com/cloudsdktool/cloud-sdk
    args: ['gcloud', 'config', 'get-value', 'project']
  - name: gcr.io/google.com/cloudsdktool/cloud-sdk
    args: ['gcloud', 'config', 'list', 'account']
```

## Run GitHub Actions

The workflow we just created is triggered by changes made to the files in the `lab_1/` directory. Let's make a change here to kick off the workflow. The `readme.txt` can be modified by simply adding a new line or some text. The act of committing this change to any branch will instruct Cloud Build to trigger a build.

1. Navigate to **Code**, and browse to the `lab_1/readme.txt` file. Click the pencil icon to edit the file, and add a new line. Provide a commit message and commit your change.

2. Navigate to **Cloud Build -> History** and you should see the build executing with the lab1-trigger name.

3. Click the build id and you can explore the results of this execution. You will see the results of executing the build steps within the window.

---

## End of Lab 1

Links to more learning:

- **Cloud Builders**: [https://cloud.google.com/cloud-build/docs/cloud-builders](https://cloud.google.com/cloud-build/docs/cloud-builders)
- **Build Config Files**: [https://cloud.google.com/cloud-build/docs/build-config](https://cloud.google.com/cloud-build/docs/build-config)
- **Create GitHub App Triggers**: [https://cloud.google.com/cloud-build/docs/automating-builds/create-github-app-triggers](https://cloud.google.com/cloud-build/docs/automating-builds/create-github-app-triggers)
- **Create a basic Build Config file**: [https://cloud.google.com/cloud-build/docs/configuring-builds/create-basic-configuration](https://cloud.google.com/cloud-build/docs/configuring-builds/create-basic-configuration)

![professortocat](images/Professortocat_v2.png)
