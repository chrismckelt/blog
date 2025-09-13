---
title: "Choosing a Customer Identity Management System"
date: 2024-08-21T10:03:35Z
draft: false
tags: ["ciam", "identity", "Access Management", "oauth"]
author: ["Chris McKelt Blog"]
description: " Solution Evaluation"
summary: "Customer Identity and Access Managment"
cover:
  image: "https://github.com/user-attachments/assets/241253b8-9595-4cb5-97be-8431ebf623d4"
  alt: "CIAM Selection"
  relative: true
---

# Customer Identity and Access Management

## The Challenge

A client was using Salesforce Visualforce portals with custom code to authenticate users in Salesforce via username, password, and community licenses.

To enable growth and simplify custom development outside Salesforce, the client decided to move to a **Customer Identity and Access Management (CIAM)** platform.

**Customer Identity and Access Management (CIAM)** is a subset of the larger Identity and Access Management (IAM) concept that focuses on managing and controlling external parties' access to a business's applications, web portals, and digital services. CIAM solutions help organizations manage customer identities while providing security and an enhanced user experience.

We were engaged to provide CIAM implementation options, a recommended solution, cost estimates, and implementation timelines.

![CIAM Diagram](https://github.com/user-attachments/assets/241253b8-9595-4cb5-97be-8431ebf623d4)

---

# Scope

## In Scope

| **Area**                    | **Requirement**    | **MUST/SHOULD/COULD** | **Scope**                                                                                                                                                                                                                                                                                                                                                                        |
| --------------------------- | ------------------ | --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| User Registration           | Sign Up            | MUST                  | Account object: First Name, Middle Name, Last Name, Address, Email, Phone • Flags for ID verification (Frankie One) • Flags for open banking (Basiq) • Income, Employment, Open Banking Accounts, Monthly Expenses, Assets, Household Account (child/parent objects) • User object: Username, Email, Phone • User profile (community) • User license (Salesforce Community Plus) |
| Verify Email                | Post-registration  | MUST                  | User receives an email link to verify login.                                                                                                                                                                                                                                                                                                                                     |
| Verify SMS                  | Post-registration  | MUST                  | User receives a unique SMS token to verify login.                                                                                                                                                                                                                                                                                                                                |
| User Login                  | TOTP               | MUST                  | Login via email link or SMS token.                                                                                                                                                                                                                                                                                                                                               |
| Step-Up Authentication      | Sensitive areas    | SHOULD                | Require extra authentication methods in designated areas.                                                                                                                                                                                                                                                                                                                        |
| Two-Factor Authentication   | Login              | MUST                  | Multiple authentication methods required.                                                                                                                                                                                                                                                                                                                                        |
| User Experience             | Branding           | MUST                  | Ability to customize branding for login and site packages.                                                                                                                                                                                                                                                                                                                       |
|                             | Templates          | SHOULD                | Emails and SMS should allow customization.                                                                                                                                                                                                                                                                                                                                       |
| Reporting & Analytics       | User Management    | MUST                  | Dashboard to view, modify, and delete sessions, metadata, roles, and accounts.                                                                                                                                                                                                                                                                                                   |
|                             | Trend Analysis     | COULD                 | Usage, signup, and login trend analysis.                                                                                                                                                                                                                                                                                                                                         |
| Administration              | Account Lockout    | MUST                  | Lock account after 5 failed attempts; notify admin.                                                                                                                                                                                                                                                                                                                              |
|                             | Uptime Monitor     | MUST                  | Service health notifications.                                                                                                                                                                                                                                                                                                                                                    |
|                             | Data Residency     | MUST                  | Data must reside in Australia.                                                                                                                                                                                                                                                                                                                                                   |
|                             | OAuth 2.0 Flows    | MUST                  | Authorization code flows with PKCE.                                                                                                                                                                                                                                                                                                                                              |
| Migration                   | Import Users       | MUST                  | Allow PIN and user migration.                                                                                                                                                                                                                                                                                                                                                    |
| Non-Functional Requirements | Scaling            | MUST                  | Handle 100 logins/day, peak 1000; MAU < 50,000.                                                                                                                                                                                                                                                                                                                                  |
|                             | Environments       | MUST                  | Provide non-production environment for development/testing.                                                                                                                                                                                                                                                                                                                      |
| API Access Management       | Role Authorization | SHOULD                | Authorize users and roles to APIs.                                                                                                                                                                                                                                                                                                                                               |
| Development SDK             | Integration        | SHOULD                | Provide client libraries for easy integration.                                                                                                                                                                                                                                                                                                                                   |

## Out of Scope

- Password-based logins or storing passwords
- Anything not explicitly in scope

---

## Security Considerations

The recommended authentication protocol for modern web and mobile authentication is **OpenID Connect (OIDC)**, built on OAuth 2.0 and using JSON Web Tokens (JWTs).

The **Proof Key for Code Exchange (PKCE)** extension strengthens OAuth authorization code flow, replacing insecure implicit flows for SPAs and native apps. These app types are vulnerable to reverse engineering and cannot securely store client secrets, making PKCE essential.

**OIDC with PKCE** is the recommended approach for a secure, modern authentication solution.

---

# Selection Criteria

- **Meets Requirements**
  Must satisfy all in-scope functional and non-functional requirements.

- **Security & Compliance**
  Must meet Australian consumer data requirements under the Privacy Act 1988 and subsequent amendments.

- **Pricing**
  Consider total cost of ownership: setup, licensing, maintenance, upgrades.

- **Deployment Time**
  Effort required to deploy (SaaS, COTS, or OSS) including configuration, branding, and environments.

- **Scalability**
  Should scale to ~6,000 MAUs in 2 years, with cost-effective pricing.

- **Support**
  Level of vendor support, including technical assistance, updates, training, and documentation.

- **Flexibility**
  Adaptability to future technology, business, and regulatory changes.

---

# Options Analysis

## Do Nothing

| **Overview**      | Continue with custom Salesforce SAML authentication and authorisation                                       |
| ----------------- | ----------------------------------------------------------------------------------------------------------- |
| **Benefits**      | Minimal changes in the immediate term. Existing SAML login already in production.                           |
| **Disadvantages** | Reliant on Salesforce Community Licenses (limits on free tier).                                             |
| **Risks**         | Ongoing custom development and maintenance costs. In-house development may exceed cost of third-party CIAM. |

---

## Solution Options

### AWS Cognito

[aws.amazon.com/cognito](https://aws.amazon.com/cognito/)

- Fully managed service by AWS.
- Features: user pools, identity pools, federated identities.
- Negative sentiment around documentation/configuration.

### Auth0

[auth0.com](https://auth0.com/)

- Industry leader (owned by Okta).
- Strong UX and documentation.
- Expensive as usage scales.

### FusionAuth

[fusionauth.io](https://fusionauth.io/)

- Open-source, modular IAM platform.
- SaaS and self-hosted options; AWS Marketplace available.

### Keycloak

[keycloak.org](https://keycloak.org/)

- Popular open-source IAM solution.
- Requires self-hosting (AWS Marketplace option available).
- Adopted by CNCF; leading OSS identity option.

### Kinde

[kinde.com](https://kinde.com/)

- Australian startup (founded 2022 by Atlassian alumni).
- Developer-focused, catching up on features.

---

## Evaluation of Solution Options

|                      | **AWS Cognito** | **Auth0**          | **FusionAuth**             | **Keycloak**        | **Kinde**               |
| -------------------- | --------------- | ------------------ | -------------------------- | ------------------- | ----------------------- |
| Meets Requirements   | 80%             | 85%                | 83%                        | 73%                 | 80%                     |
| Deployment           | Cloud           | Cloud              | Cloud / Self               | Self                | Cloud                   |
| Pricing Model        | Pay-as-you-go   | Pay-as-you-go      | Freemium / Plans           | Free / Hosting cost | Free tier               |
| Free Tier            | 50k MAUs        | 7.5k MAUs          | Unlimited (self), $38 SaaS | Unlimited (self)    | 7.5k MAUs               |
| Rec. Monthly Pricing | Free            | $1,085             | $400                       | ~$300               | $283                    |
| Open Source          | No              | No                 | No                         | Yes                 | No                      |
| Features             | Core IAM        | Full IAM, MFA, SSO | Full IAM + customization   | Core IAM            | Full IAM + feature mgmt |
| Security             | Strong          | Strong             | Strong (open)              | Strong              | Strong                  |
| Scalability          | High            | High               | High                       | High                | High                    |
| Ease of Use          | Easy            | Easy               | Easy                       | Complex             | Easy                    |
| SLA                  | 99.90%          | 99.99%             | 99.95%                     | 99.90%              | 99.99%                  |
| Time to Deploy       | 4–5 weeks       | 2–3 weeks          | 2–3 weeks                  | 5–6 weeks           | 2–3 weeks               |
| Maintenance Effort   | Small           | Small              | Medium                     | Large               | Small                   |

---

## Recommended Solution

> **Recommendation: FusionAuth (Starter Plan on Business Hosting via AWS Marketplace)**
> 👉 [fusionauth.io/download](https://fusionauth.io/download)

- **Monthly Cost:** $400
- **Annual Cost:** $4,560
- **Setup & Config Time:** 2–3 weeks

The Starter Plan includes advanced MFA, password-less and social login, LDAP connectors, SSO, application theming, breached password detection, and more.

Support is provided via community channels (forums, Slack, GitHub). Allows up to **10,000 MAUs**. Runs on a dedicated EC2 instance with 3-day backups and single-domain support.

---

# Our Technological Competencies

<br />
<img width="878" height="497" alt="Smart Tech" src="https://github.com/user-attachments/assets/0863a4fa-501b-46ff-8433-e7ee246ded48" />
<br />
<hr />

### Could this help you?

[Contact me for a free discussion](https://smarttechventures.au/contact/)
