# 🚀 CircuitVerse Organization System (GSoC Prototype)

## 🧠 Overview

This project is a prototype implementation of **Enterprise & Institutional Organization Features** for CircuitVerse.

It introduces a **multi-tenant architecture** that enables universities and institutions to manage users, groups, and classrooms under a unified system with **role-based access control (RBAC)** and **custom branding via subdomains**.

---

## ✨ Key Features

### 🏢 Hierarchical Organization Structure

```
Organization → Groups → Classrooms
```

* Models real-world academic systems
* Enables scalable management across institutions

---

### 👥 Multi-Tenancy

* Users belong to organizations via memberships
* A user can be part of multiple organizations
* Data is logically isolated per organization

---

### 🛡️ Role-Based Access Control (RBAC)

Roles implemented:

* `org_admin`
* `group_lead`
* `instructor`
* `student`

🔐 Permissions enforced using a policy-based system:

* Admin / Group Lead / Instructor → allowed to manage resources
* Student → restricted

---

### 🌐 Subdomain-Based Organization Context

* Each organization is mapped to a subdomain
* Example:

  * `lvh.me:3000` → No organization
  * `iitd.lvh.me:3000` → IIT Delhi

👉 Enables **true SaaS-like behavior**

---

### 🎨 Custom Branding

* Organization-specific:

  * Name
  * Logo
* Dynamically rendered based on subdomain

---

### 🔐 Authentication

* Implemented using **Devise**
* Foundation ready for **OIDC / SSO integration**

---

## ⚙️ Tech Stack

* **Ruby on Rails**
* **PostgreSQL**
* **Devise** (Authentication)
* **Pundit-style Policies** (Authorization)
* **OmniAuth (planned)** for OIDC/SSO

---

## 🏗️ System Architecture

### Core Models

* `User`
* `Organization`
* `Membership` (joins users ↔ organizations with roles)
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

### 🔍 Demo Flow

1. Open root → no org detected
2. Open subdomain → organization loaded
3. RBAC:

   * Admin → allowed
   * Student → restricted

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

Then open:

```
http://lvh.me:3000
```

---

## 🔮 Future Enhancements

### 🔐 OpenID Connect (OIDC) / SSO

* Integration with:

  * Google Workspace
  * Azure AD
* Map users to organizations via email domain

---

### 📩 Invitation System

* Org admins invite users
* Role assigned during onboarding

---

### 📊 Admin Dashboard

* Manage:

  * Users
  * Roles
  * Groups
  * Classrooms

---

### 🌍 Custom Domains

* Support:

  ```
  university.edu → CircuitVerse org
  ```

---

## 🎯 GSoC Relevance

This prototype demonstrates:

* ✅ Multi-tenant system design
* ✅ Hierarchical data modeling
* ✅ Policy-based RBAC
* ✅ Subdomain routing & branding
* 🔄 Foundation for OIDC-based SSO

---

## 👩‍💻 Author

**Aditi**

---

## ⭐ Acknowledgment

Built as part of preparation for contributing to CircuitVerse under Google Summer of Code.
