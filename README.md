# 🚀 CircuitVerse Organization System (GSoC Prototype)

## 🧠 Overview

This project is a prototype implementation of **Enterprise & Institutional Organization Features** for CircuitVerse.

It introduces a **multi-tenant SaaS architecture** that enables universities and institutions to manage users, groups, and classrooms under a unified system with:

* Role-Based Access Control (RBAC)
* Subdomain-based organization isolation
* Google OAuth-based Single Sign-On (SSO)
* Automated onboarding via domain mapping

---

## ✨ Key Features

### 🏢 Hierarchical Organization Structure

```
Organization → Groups → Classrooms
```

* Models real-world academic systems
* Supports scalable institutional management

---

### 👥 Multi-Tenancy

* Users belong to organizations via memberships
* A user can be part of multiple organizations
* Data is logically isolated per organization (subdomain-based)

---

### 🛡️ Role-Based Access Control (RBAC)

Roles implemented:

* `org_admin`
* `group_lead`
* `instructor`
* `student`

🔐 Permissions enforced via policy-based authorization:

* Admin / Group Lead / Instructor → can manage resources
* Student → restricted access

---

### 🌐 Subdomain-Based Organization Context

* Each organization is mapped to a subdomain

Example:

```
lvh.me:3000           → Global context (no org)
iitd.lvh.me:3000      → IIT Delhi
```

* Organization detected via `request.subdomain`
* Enables true SaaS-like tenant isolation

---

### 🔑 Google SSO (OAuth / OIDC)

* Implemented using **Devise + OmniAuth**
* Users can sign in using Google accounts

### 🔁 SSO Flow:

1. User clicks "Sign in with Google"
2. Google authenticates user
3. Email is extracted from OAuth response
4. Domain mapped to organization
5. User auto-created (if new)
6. Membership auto-created with default role

👉 Example:

```
user@iitd.ac.in → mapped to IIT Delhi org
```

---

### ✉️ Invitation System (Foundation)

* Invitations can be created with:

  * Email
  * Organization
  * Role
* Enables controlled onboarding for institutions

---

### 🎨 Custom Branding

* Organization-specific UI:

  * Name
  * Logo
* Dynamically rendered per subdomain

---

## ⚙️ Tech Stack

* **Ruby on Rails 8**
* **PostgreSQL**
* **Devise** (Authentication)
* **OmniAuth (Google OAuth2)** (SSO)
* **Pundit-style policies** (Authorization)

---

## 🏗️ System Architecture

### Core Models

* `User`
* `Organization`
* `Membership` (user ↔ organization with role)
* `Group`
* `Classroom`

### Relationships

* User ↔ Organization → Many-to-Many (via Membership)
* Organization → Groups → Classrooms

---

## 🧪 Demo

### ▶️ Access URLs

```
http://lvh.me:3000
http://iitd.lvh.me:3000
```

---

### 🔍 Demo Flow

1. Open root → no organization detected
2. Open subdomain → organization context loaded
3. Click **Sign in with Google**
4. Login via Google
5. System:

   * Creates user (if new)
   * Maps org via email domain
   * Creates membership
6. Redirects to org dashboard

---

## 🏗️ Setup Instructions

```bash
git clone https://github.com/aditi5050/circuitverse-org-prototype.git
cd circuitverse-org-prototype

bundle install
rails db:create
rails db:migrate

bin/rails server
```

---

## 🏫 Create Organization (Required for Testing)

```bash
rails console
```

```ruby
Organization.create!(
  name: "IIT Delhi",
  subdomain: "iitd",
  domain: "iitd.ac.in"
)
```

---

## 🌐 Run via Subdomain

```
http://iitd.lvh.me:3000
```

---

## 🔮 Future Enhancements

* 🔐 Azure AD / generic OIDC support
* 📊 Organization admin dashboard
* 📩 Full invitation acceptance flow
* 🌍 Custom domain support (e.g., university.edu)
* 📜 Audit logs for enterprise tracking

---

## 🎯 GSoC Relevance

This prototype demonstrates:

* ✅ Multi-tenant system design
* ✅ Subdomain-based tenant isolation
* ✅ Hierarchical organization modeling
* ✅ Role-based access control (RBAC)
* ✅ OAuth/OIDC-based authentication (Google SSO)
* ✅ Automated onboarding via domain mapping

---

## 👩‍💻 Author

**Aditi**

---

## ⭐ Final Note

This project demonstrates a **production-level backend architecture** similar to platforms like:

* Google Classroom
* Canvas LMS
* Notion for Teams

It combines multi-tenancy, RBAC, and SSO to enable scalable institutional use.
