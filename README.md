# githubactions-deployments-oidc

This repository demonstrates how to deploy Terraform configurations to multiple AWS accounts using GitHub Actions and [OpenID Connect (OIDC)](https://www.microsoft.com/en-us/security/business/security-101/what-is-openid-connect-oidc) for short-lived, secure credentials.

**Why OIDC and Short-Lived Credentials?**

Traditional methods of authenticating with AWS often involve creating IAM users and access keys. These keys are long-lived and require regular rotation to maintain security, typically every 90 days or less. This process can be cumbersome and prone to errors.

OIDC offers a more secure and streamlined approach. By leveraging OIDC, GitHub Actions can directly assume IAM roles in your AWS accounts using short-lived credentials. This eliminates the need for long-lived access keys, reducing the risk of credential leakage and simplifying security management.

**Benefits of using OIDC:**

* **Enhanced Security:** Short-lived credentials are automatically rotated, minimizing the window of opportunity for attackers.
* **Simplified Management:** No need to manually rotate access keys.
* **Reduced Risk:** Eliminates the risk of accidentally exposing long-lived credentials.
* **Centralized Identity Management:** Leverage GitHub's identity provider for secure access.

**Quick Start**

Follow these steps to deploy the example Terraform configurations using GitHub Actions and OIDC:

1.  **Deploy the CloudFormation Template:**
    * Deploy the CloudFormation template located here: [github-actions-oidc-federation-and-role.yml](https://github.com/RaduLupan/configure-aws-credentials/blob/main/examples/federated-setup/github-actions-oidc-federation-and-role.yml)
    * This template will create an OIDC-based IAM provider and corresponding roles in both your AWS Dev and AWS Prod accounts.
    * Make sure you deploy this template into both AWS accounts you want to deploy to specifying the main branch for deploying to Prod account and develop to Dev account.

2.  **Configure IAM Role ARNs in GitHub Actions Workflow:**
    * In the `deploy.yml` workflow file, locate line 33.
    * Replace the `<IAM_Role_ARN_Prod_Account>` placeholder with the ARN of the IAM role created in your AWS Prod account.
    * Replace the `<IAM_Role_ARN_Dev_Account>` placeholder with the ARN of the IAM role created in your AWS Dev account.
    * **Important:** The workflow is configured to assume the Prod account role when pushing to the `main` branch and the Dev account role when pushing to the `develop` branch.

3.  **Deploy to the Dev Environment:**
    * Checkout the `develop` branch: `git checkout develop`
    * Make a change to the `main.tf` file. For example, add a tag: `change = "change1"` to the EC2 instance resource.
    * Commit and push your changes to the `develop` branch: `git push origin develop`
    * Observe the GitHub Actions workflow executing and deploying your changes to the Dev AWS account.

4. **Deploy to the Prod Environment:**
    * Checkout the `main` branch: `git checkout main`
    * Make a change to the `main.tf` file. For example, add a tag: `change = "change2"` to the EC2 instance resource.
    * Commit and push your changes to the `main` branch: `git push origin main`
    * Observe the GitHub Actions workflow executing and deploying your changes to the Prod AWS account.
    * **Important:** You can also merge a Pull Request from `develop` to `main` to deploy to the Prod AWS account.

**References**
[Configuring OpenID Connect in Amazon Web Services](https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)