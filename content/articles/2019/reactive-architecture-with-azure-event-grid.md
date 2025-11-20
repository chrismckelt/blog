---
title: "Reactive Architecture with Azure Event Grid"
tags: ["azure", "event", "reactive"]
author: ["Chris McKelt Blog"]
description: "Azure Global Bootcamp 2019"
date: 2019-02-21T10:26:31Z
draft: false
cover:
  image: "https://github.com/user-attachments/assets/a0b783df-80e6-4e7c-a796-a95fea691512"
  alt: "Azure Event Grid"
  relative: true
---
## Reactive Architecture with Azure Event Grid

```
Reactive, event-driven architecture
Deep dive into Azure Event Grid

“Take a ride on the grid” demo series

```
<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/a0b783df-80e6-4e7c-a796-a95fea691512" />


📈 Why Event Thinking Matters

Enterprises should embrace “event thinking” as part of their digital strategy.

> By 2020, event-sourced, real-time situational awareness will be required for 80% of digital business solutions, and 80% of new business ecosystems will require event processing.
> — Gartner Top 10 Strategic Technology Trends (2018)

**Events Tell a Story**

Change is captured in an event

A series of events captures behaviour

Event streams capture patterns

Together, they tell the narrative of the system

**⚡ What Is a Reactive Architecture?**

A system design approach focused on:

* Responsiveness
* Resilience
* Elasticity
* Message-driven communication

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/624c3db4-41ce-4d5c-9881-60b6252836df" />

> More at: <https://www.reactivemanifesto.org>

**💬 Messages vs Commands vs Events Command**

1. Has intent
2. 1-to-1 from producer → consumer
3. Request-based

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/76f0c9f7-9eb3-446d-a18d-2b48a5be0c95" />

_Example: CreateCustomer_

**Event**

* No intent — purely a notification
* 1-to-many subscribers
* Fact-based

_Example: CustomerCreated_

**☁️ Azure Messaging Services Overview**

Azure provides a broad messaging ecosystem including:

* Service Bus
* Event Hubs
* Event Grid
* Storage Queues

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/3a52308a-9f68-49f4-8dea-a845d1339b5e" />

**Serverless and Integration Services**

> 🔷 What Is Azure Event Grid?

Azure Event Grid is a cloud-native, fully managed event routing service for building event-driven and microservice-oriented systems without heavy plumbing.

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/469df5f5-0492-4846-86f8-111af59ebb45" />

> 🎯 What Is Event Grid For?

* Serverless apps
* Ops automation
* Third-party integrations

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/0b2bf8e1-1886-42c5-aad4-3a96d7427b20" />


**Azure Integration Services**

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/1f8ad7c3-b5df-45d1-999b-7af093c103bb" />

🔄 Event Grid vs Service Bus vs Event Hub


<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/deaf341f-cb35-4d8a-b942-5484b09d060d" />

A quick framing:

* Event Grid → reactive notifications (push model, lightweight)
* Service Bus → commands, workflow coordination, reliable messaging
* Event Hub → large event ingestion, telemetry, streaming

**📣 Why a Push Model?**

> Event Grid pushes events to subscribers as they occur, supporting system-wide reactivity.

Example system events:

* Microsoft.Storage.BlobCreated
* Microsoft.ServiceBus.ActiveMessagesAvailableWithNoListeners

**🧩 Event Schemas**
* Event Grid Native Schema
* Standard structure used by Azure Event Grid.
* CloudEvents Schema

An industry-standard, cloud-agnostic event schema.

Resources:

<https://cloudevents.io>

CNCF Serverless Working Group

GitHub: <https://github.com/cloudevents/spec>

.NET SDK: <https://github.com/aliencube/CloudEvents.NET>

**⚙️ Triggers**

Event Grid can trigger:

* Azure Functions
* Logic Apps
* Automation workflows
* Webhooks
* Custom subscribers

**🔐 Security**

Event Grid supports:

* Managed identities
* Key authentication
* IP filtering
* Private endpoints
* Event domain-level access controls

**📊 Event Grid – Daily Metrics**

* Native monitoring includes:
* Delivery attempts
* Latency
* Subscriber response codes
* Dead-letter events

**🗂️ Event Domains**

Allows multi-tenant event routing at scale, ideal for large distributed platforms.

## Excluded 6 demos done on day :(

_🧪 Demo Highlights_
Demo 1

_Ride the grid: event publishing and subscriptions._

Demo 2

Live event monitoring
🔗 <https://eventsmonitoring2019.azurewebsites.net/>

Demo 3

_Microsoft Flow integration.
_
Demo 4

_Dumb insurance claim management flow_

Example pattern:

_Inbound API request → publish event
_
Event subscriber → execute command

Event publisher → emit result event

Multiple subscribers react

🏗️ Claim Entity Event Flow Example

For each Claim:

Claim has a Status

Business process flows trigger on status changes

Status updates broadcast events

Microservices react and write back updates

BPF rules trigger again from field updates

Reactive loops power distributed workflows.

🙌 Images!

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/b4582440-037b-4ebf-81f9-20710346ce40" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/40eaae0d-0a12-4fb4-a9e0-1e8a4df383d3" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/46ae5c1e-77a3-4f8e-ac4f-6d02f2bc1b21" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/7ddca021-6515-44e6-807c-3192f1470b2c" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/9eb5d61a-3210-44e6-ba38-ea4f341fd940" />


<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/d4af0c7d-0735-4b54-874f-f5b636febe51" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/8a3427f5-124c-4144-a800-62f3951e8c49" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/c813d595-2f53-4181-b14a-433272a9c6a5" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/bbfc38ef-7618-4cce-b761-23828ba451e4" />

<img width="1600" height="900" alt="Image" src="https://github.com/user-attachments/assets/9c45f970-ff51-4ccf-8d7f-d59b2c8ca8d0" />