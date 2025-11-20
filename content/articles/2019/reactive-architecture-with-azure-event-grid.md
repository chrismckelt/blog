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

**Serverless and Integration Services**

> 🔷 What Is Azure Event Grid?

Azure Event Grid is a cloud-native, fully managed event routing service for building event-driven and microservice-oriented systems without heavy plumbing.

> 🎯 What Is Event Grid For?

* Serverless apps
* Ops automation
* Third-party integrations

**Azure Integration Services
**
🔄 Event Grid vs Service Bus vs Event Hub

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

🙌 Thanks!

# PushDontPull
