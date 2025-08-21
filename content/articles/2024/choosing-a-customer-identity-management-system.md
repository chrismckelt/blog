---
title: "Choosing a Customer Identity Management System"
date: 2025-08-21T10:03:35Z
draft: false
tags: ["ciam", "identity", "Access Management", "oauth"]
author: ["Smart Tech Ventures"]
description: " Solution Evaluation"
summary: "Customer Identity and Access Managment"
cover:
  image: "/articles/api-governance/2025-img-1.png"
  alt: "API Integration Lifecycle"
  relative: true
---

> Customer Identity and Access Management

**The Challenge**

Recently we had a client that was using Salesforce Visualforce portals with custom code to authenticate users in Salesforce with a username, password and community license.

To enable growth and ease custom development outside SalesForce, the client decided to move to a Customer Identity and Access Management (CIAM).

Customer Identity and Access Management (CIAM) is a subset of the larger identity and access management (IAM) concept that focuses on managing and controlling external parties' access to a business's applications, web portals, and digital services. CIAM solutions help organizations manage customer identities, providing security and an enhanced experience.

We were engaged to provide options for a CIAM implementation and provide a recommended solution, costs and implementation estimates.

# Scope

<br />

## In Scope

<br />

| **Area**                    | **Requirement**       | **MUSCOW**                                                                           | **Scope**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| --------------------------- | --------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| User Registration           | Sign Up               | MUST                                                                                 | Account object - First Name, Middle Name Last Name, Address, Email, Phone • Flags and params for ID verification with Frankie One, • Flags and params for open banking details with Basiq,• Income details (Child object), • Employment details (Child object) • Open banking accounts (Child object) • Monthly expense details (Child object), • Assets details (Child object), • Household account details in case of a join app (parent), User object – Username, Email, Phone, • User profile (community user profile), • User license (SF community plus license) |     |
| Verify Email                | MUST                  | After user registration, the user receives an email link to verify login             |
|                             |
| Verify SMS                  | MUST                  | After user registration, the user receives a SMS with a unique token to verify login |
| User Login                  | TOTP                  | MUST                                                                                 | User can login from unique link from email or token code from SMS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|                             |
| Step Up Auth                | SHOULD                | Designated areas require extra authentication means                                  |
|                             |
| 2FA                         | MUST                  | Multiple authentication methods will be required to login                            |
| User Experience             | Branding              | MUST                                                                                 | Login and site packages must have ability to customise branding                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|                             |
| Templates                   | SHOULD                | Emails and SMS should allow customisation                                            |
| Reporting & Analytics       | User Management       | MUST                                                                                 | Display a user management dashboard to view, modify and delete sessions, metadata, roles and accounts                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                             |
| Analysis                    | COULD                 | Trend analysis on usage/signup/logins                                                |
| Administration              | Account Lockout       | MUST                                                                                 | 5 failed tries - lock account and notify admin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|                             |
| Uptime monitor              | MUST                  | Service notifications on health                                                      |
|                             |
| Data Residency              | MUST                  | Data must reside on Australian shores                                                |
|                             |
| Oath 2 Flows                | MUST                  | OAuth 2.0 authorization code flows, like PKCE (Proof Key for Code Exchange)          |
| Migration                   | Import existing users | MUST                                                                                 | Allow PIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Non-Functional Requirements | Scaling               | MUST                                                                                 | Handle 100 logins per day. Peek 1000 for MAU \< 50000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                             |
| Environment                 | MUST                  | Provide non-production environment for development and testing purposes              |
|                             |
| API Access Management       | SHOULD                | Authorise users and roles to APIs                                                    |
|                             |
| Development SDK             | SHOULD                | Provide client libraries for easy application integration                            |

<br />

## Out of Scope

<br />

- Password based logins / storing passwords
- Anything not deemed in scope

<br />

## Security Considerations

<br />

A recommended authentication protocol for modern web and mobile authentication is **OpenID Connect (OIDC).** This is an open standard that provides a simple and secure way for users to authenticate with web applications. It is based on OAuth 2.0 and uses JSON Web Tokens (JWTs) to exchange identity information between the user, the client application, and the identity provider (IdP).

The **Proof Key of Code Exchange (PKCE)** is an extension of the standard authorization code grant OAuth flow. It is designed to be a secure substitute for the implicit flow for single-page applications (SPA) or native applications.

SPAs and native applications are vulnerable to reverse engineering practices. For SPAs, the source code of the application is available within browsers. Native apps can be decompiled. Because of those reasons, SPAs and native applications cannot securely store their client credentials (especially client secrets) and are considered public clients.

Authorization code grant with PKCE introduces a technique to prevent unauthorized access to resources in the case of code interception.

**OIDC** with **PCKE** is the recommended approach to enable a secure authentication solution.

# Selection Criteria

**Meets Requirements**

Ability to satisfy the desired functional and non-functional requirements identified as in-scope. Methodology to assess options is available in this document's appendix.

**Security & Compliance**

The solution must meet all security and compliance requirements required for handling Australian consumer data detailed in the Australia Privacy Act 1988, Privacy Amendment Act 2012 and Privacy Amendment Act 2017

**Pricing**

Consideration will be given to the total cost of ownership, including initial setup, licensing, maintenance, and future upgrades.

**Deployment time**

The effort required to setup the Identity Management Provider solution in production. This can vary depending on type of hosting i.e., SaaS, COTS or OSS self-hosted solution. Includes all configuration, environment creation and customisations such as branding.

**Scalability**

The system should be able to handle the growth of the organization, both in terms of users and data volume. Pricing should scale according to use of service/compute. Ideally the ability to handle ~6000 MAUs within 2 years should be supported and price effective

**Support**

The level of support provided by the vendor, including technical support, updates, training, and documentation, is crucial.

**Flexibility**

The solution should be able to adapt to future changes in technology, business requirements, and regulatory environment.
<br />

# Options Analysis

<br />

### Do Nothing

| **Overview**      | **Continue with custom Salesforce SAML authentication and authorisation**                                                                                                                                                |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Benefits**      | Minimal changes in the immediate termExisting SAML login process built and in production                                                                                                                                 |
| **Disadvantages** | Logins use a Salesforce Community License Limit on free tier                                                                                                                                                             |
| **Risks**         | Custom development required to build identity management features that exist in 3rd party solutions <br> Cost to manage features inhouse on user authentication and authorisation exceed outsourcing to a vendor product |

### Solution Options

**AWS Cognito**

[https://aws.amazon.com/cognito/](https://aws.amazon.com/cognito/)

- fully managed service offered by Amazon Web Services (AWS).
- provides a comprehensive set of features for managing user identities, including user pools, identity pools, and federated identities.
- negative developer community sentiment towards documentation and configuration options

**Auth0**

[https://auth0.com/](https://auth0.com/)

- industry leading CIAM owned by Okta
- known for its user-friendly interface and comprehensive documentation, making it easy to set up and manage your identity management workflows
- pricing gets expensive moving up the tiers

**Fusion Auth**

[https://fusionauth.io](https://fusionauth.io/)

- open-source identity and access management (IAM) platform that provides a comprehensive suite of features for securing applications and data.
- built on a modular architecture that allows for easy customization and integration with existing systems.
- SaaS and self-hosted deployment choice. AWS Marketplace deployment available

  **Keycloak**

[https://keycloak.org](https://keycloak.org/)

- open-source identity and access management (IAM) platform that provides a variety of features for securing applications and data. It is a popular choice for businesses of all sizes, from small startups to large enterprises.
- requires self-hosting with option to leverage AWS Marketplace deployment
- adopted by the Cloud Native Computing Foundation and seen as the leading open-source solution for identity

**Kinde**

[https://kinde.com](https://kinde.com/)

- Australian based identity management solution focused on developer experience.
- new company founded in 2022 by Atlassian Alumni
- behind in features compared with other options but rapidly catching up

<br />

### Evaluation of solution options

<br />

|                              | **AWS Cognito**                                                                    | **Auth 0**                                                                                                           | **Fusion Auth**                                                                                            | **Keycloak**                                                                                      | **Kinde**                                                                                    |
| ---------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Meets Requirements           | 80%                                                                                | 85%                                                                                                                  | 83%                                                                                                        | 73%                                                                                               | 80%                                                                                          |
| Deployment                   | Cloud-based                                                                        | Cloud-based                                                                                                          | Self-hosted or cloud-based                                                                                 | Self-hosted                                                                                       | Cloud-based                                                                                  |
| Pricing                      | Pay-as-you-go                                                                      | Pay-as-you-go                                                                                                        | Freemium, starter and enterprise plans                                                                     | Free for development and testing                                                                  | Free for up to 10,000 active users                                                           |
| Features                     | Basic IAM features, including user authentication, authorization, and social login | Wide range of IAM features, including single sign-on (SSO), multi-factor authentication (MFA), and user provisioning | Wide range of IAM features, including SSO, MFA, user provisioning, and advanced customization options      | Basic IAM features, including user authentication, authorization, and social login                | Wide range of IAM features, including SSO, MFA, user provisioning, and feature management    |
| Security                     | Robust security features, including data encryption and access control             | Robust security features, including data encryption, access control, and regular security audits                     | Robust security features, including data encryption, access control, and open-source code for transparency | Robust security features, including data encryption, access control, and regular security updates | Robust security features, including data encryption, access control, and penetration testing |
| Scalability                  | Highly scalable to support businesses of all sizes                                 | Highly scalable to support businesses of all sizes                                                                   | Highly scalable to support businesses of all sizes                                                         | Highly scalable to support businesses of all sizes                                                | Highly scalable to support businesses of all sizes                                           |
| Ease of use                  | Easy to use with a user-friendly interface                                         | Easy to use with a user-friendly interface                                                                           | Easy to use with a user-friendly interface                                                                 | Can be more complex to configure than other options                                               | Easy to use with a user-friendly interface                                                   |
| Pricing - Free Tier          | Up to 50,000 MAUs                                                                  | Up to 7,500 MAUs                                                                                                     | Self-hosted - unlimited <br> SaaS costs $38 per month hosting with Community Plan                          | Self-hosted - unlimited                                                                           | Up to 7,500 MAUs                                                                             |
| Recommended Monthly Pricing  | Free                                                                               | $1,085                                                                                                               | $400                                                                                                       | Free (hosting ~ $300)                                                                             | $283                                                                                         |
| Open Source                  | No                                                                                 | No                                                                                                                   | No                                                                                                         | Yes                                                                                               | No                                                                                           |
| Uptime SLA                   | 99.90%                                                                             | 99.99%                                                                                                               | 99.95%                                                                                                     | 99.90%                                                                                            | 99.99%                                                                                       |
| Time to deploy full solution | 4-5 weeks                                                                          | 2-3 weeks                                                                                                            | 2-3 weeks                                                                                                  | 5-6 weeks                                                                                         | 2-3 weeks                                                                                    |
| Annual Maintenance Effort    | Small                                                                              | Small                                                                                                                | Medium                                                                                                     | Large                                                                                             | Small                                                                                        |

<br />

### Recommended Solution

<br />

> Recommendation: FusionAuth

From an analysis of several solutions in the marketplace that offer Customer Identity and Access Management features was checked for fit against the business goals, functional and technical fit, which resulted in 5 being shortlisted

These were then compared on complexity, cost and time to deliver, resulting in the final decision

FusionAuth Starter Plan on Business Hosting

Plan is offered via the AWS Marketplace and is accessible from the website: [https://fusionauth.io/download](https://fusionauth.io/download)

_Name: FusionAuth Starter Plan on Business Hosting
Monthly Cost: $400
Annual Cost: $4,560
Estimated setup and config time: 2-3 weeks_

The Starter plan includes premium auth features including advanced MFA, single sign-on, password less and social login, LDAP connectors, application theming, breached password detection, machine-to-machine authentication, and more.

On the Starter plan, support is provided through the community, including forums, Slack, and GitHub. The Starter plan allows up to 10,000 monthly active users.

The service runs on a dedicated EC2 instance. This is a single server with 3 days of backups. A single domain can be configured.

# Our Technological Competencies

<br />
<img alt="Our Technological Competencies" src="https://github.com/Axurcio/axurcio.github.io/assets/662868/03944ecd-1619-4ea9-b4ac-c023020d9b77" />
<br />
<hr />

### Ready to start?

[Contact us to start your journey](https://smarttechventures.au/contact/)
