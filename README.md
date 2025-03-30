# githubactions-deployments-oidc

This repository demonstrates how to deploy Terraform configurations to multiple AWS accounts using GitHub Actions and [OpenID Connect (OIDC)]((https://www.microsoft.com/en-us/security/business/security-101/what-is-openid-connect-oidc)) for short-lived, secure credentials.

**Why OIDC and Short-Lived Credentials?**

Traditional methods of authenticating with AWS often involve creating IAM users and access keys. These keys are long-lived and require regular rotation to maintain security, typically every 90 days or less. This process can be cumbersome and prone to errors.

OIDC offers a more secure and streamlined approach. By leveraging OIDC, GitHub Actions can directly assume IAM roles in your AWS accounts using short-lived credentials. This eliminates the need for long-lived access keys, reducing the risk of credential leakage and simplifying security management.

**Benefits of using OIDC:**

* **Enhanced Security:** Short-lived credentials are automatically rotated, minimizing the window of opportunity for attackers.
* **Simplified Management:** No need to manually rotate access keys.
* **Reduced Risk:** Eliminates the risk of accidentally exposing long-lived credentials.
* **Centralized Identity Management:** Leverage GitHub's identity provider for secure access.



