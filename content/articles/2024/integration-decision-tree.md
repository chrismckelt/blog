---
title: "Integration Decision Tree"
date: 2024-03-21T10:03:35Z
draft: false
tags: ["integration", "api", "event driven architecture", "pub sub"]
author: ["Smart Tech Ventures"]
description: "Integration Decision Evaluation"
summary: "A guide to integration strategy"
cover:
  image: "https://github.com/user-attachments/assets/241253b8-9595-4cb5-97be-8431ebf623d4"
  alt: "CIAM Selection"
  relative: true
---

# A guide to integration strategy

> Which integration method should you use for a given scenario?

# Integration Decision Tree

The integration decision tree is a tool for deciding which integration patterns and technologies should be used to implement an integration.
It references approved design patterns, template projects, and standards that should guide implementation.

The following decision tree should be used to determine how an integration should be implemented:

![Integration Decision Tree](https://github.com/user-attachments/assets/87041084-be33-4e38-944d-6fd319aed3c6)

---

## Integration Types

Integrations can be broadly classified as **Application Integration** or **Data Integration**:

- **Application Integrations**
  Integrating live operational data in real-time between two or more applications.
  Example: Calling an API to retrieve information from a 3rd party service, or publishing an event when an application changes state.

- **Data Integrations**
  Typically batch-oriented, dealing with data at rest (the process that created the data has already completed).
  Example: Sending invoice or payment data to a finance system on a nightly schedule.

---

## Integration Styles

Integration style refers to how two systems communicate. For example:

- Does the calling system get an immediate response?
- Does the back-end system send notifications?
- Is information exchanged on a schedule?

### Real-time Synchronous

(Request-Reply) Couples the front-end host to the back-end processing; the front-end must wait for a response before continuing.

### Real-time Asynchronous

Decouples back-end processing, but the front-end still needs a response (often via polling).
See:

- [Polling pattern](https://www.enterpriseintegrationpatterns.com/patterns/conversation/Polling.html)
- [Async Request-Reply](https://docs.microsoft.com/en-us/azure/architecture/patterns/async-request-reply)

### Real-time Asynchronous with Callback

(Request-Callback) The back-end calls a URI provided by the front-end once processing completes (success or failure).

### Batch (Unitary)

Data exchange on a scheduled basis, decoupled from front-end processing. Often involves background processes generating events/messages.

### Batch (Bulk)

Large-scale scheduled data exchange (export/import).
Example: Exporting invoices every 12 hours to a file share, then importing them into another system.

---

## Integration Styles (Gregor Hohpe, 2003)

Gregor Hohpe described four integration styles in _Enterprise Integration Patterns_ (2003):

- **API (Remote Procedure Call)**
  Direct API integration applies encapsulation, letting each system maintain its own data integrity.
  Types:

  - Private APIs
  - Partner APIs
  - SaaS APIs (e.g., GitHub, Stripe)
  - Platform APIs (ERP, CRM, marketplaces)

- **Event or Messaging**
  Transfer of information via messages on a bus.

  - _Events_: Inform that something happened (lightweight, contextual).
  - _Messages_: Instruct an action with full details.

- **ETL (Extract, Transform, Load)**
  Scheduled data transfer, transforming source data to fit a target model. Suited for large/bulk transfers or legacy systems.

> **Note**: Shared databases are excluded as an anti-pattern due to tight coupling.

---

## Integration Technologies

Approved technologies (DWER context):

### API Management

[Azure API Management](https://docs.microsoft.com/en-us/azure/api-management/api-management-key-concepts)
APIs are published, secured, monitored, and versioned through APIM.
Types:

- **Proxy APIs** – Expose 3rd party services with security/throttling controls. Example: DWER’s ArcGIS API.
- **Microservice APIs** – Independently deployable units for bespoke business capabilities. Traits: bounded context, independent deployability, owning their data.
  See:
  - [Microservices Ultimate Guide](https://aka.ms/apis-microservices-ultimate-guide)
  - [API Design eBook](https://aka.ms/api-design-ebook)

### Service Bus

[Azure Service Bus](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview)
A fully managed enterprise message broker with queues and publish/subscribe topics. Supports events and messages, though not event replay at scale.

### Point-to-Point

Direct integrations where reusability is limited. Suitable when out-of-the-box connectors exist or cost/time constraints apply.

### iPaaS

[Azure Integration Services](https://azure.microsoft.com/en-au/product-categories/integration/)
A suite including Azure Functions, Logic Apps, Service Bus, and APIM for enterprise integration.

### ETL Tools

Off-the-shelf ETL engines with many connectors for extracting, transforming, and loading data.

---

# Using the Decision Tree

### Start

- If integration is user-initiated → **Application Integration**
- If scheduled/triggered → **Data Integration**

### Integration Type

- **Application Integration**
  - Immediate response → Real-Time Synchronous
  - Deferred response (no callback) → Real-Time Asynchronous
  - Deferred response (callback available) → Real-Time Async with Callback
  - Triggered, per-transaction → Batc

---

# Our Technological Competencies

<br />
<img width="878" height="497" alt="Smart Tech" src="https://github.com/user-attachments/assets/0863a4fa-501b-46ff-8433-e7ee246ded48" />
<br />
<hr />

### Ready to start?

[Contact us to start your journey](https://smarttechventures.au/contact/)
