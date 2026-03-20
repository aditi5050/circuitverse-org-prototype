# CircuitVerse Organization System Prototype

## 🚀 Overview

This project is a prototype implementation of **Enterprise & Institutional Organization Features** for CircuitVerse (GSoC).

It introduces a scalable multi-tenant architecture that allows institutions (like universities) to manage users, groups, and classrooms under a unified system with role-based access control and custom branding.

---

## 🧠 Features Implemented

### 🏢 Hierarchical Organization Structure

* Organization → Groups → Classrooms
* Models real-world academic hierarchy (University → Department → Course)

---

### 👥 Multi-Tenancy

* Users belong to organizations via memberships
* A user can have different roles in different organizations
* Data is isolated per organization

---

### 🛡️ Role-Based Access Control (RBAC)

Roles implemented:

* `org_admin`
* `group_lead`
* `instructor`
* `student`

Permissions enforced via policy layer:

* Admin / Group Lead / Instructor → allowed to manage classrooms
* Student → restricted

---

### 🎨 Custom Branding

* Organization-specific subdomains (e.g., `iitd.lvh.me`)
* Dynamic organization name and logo rendering

---

### 🔐 Authentication

* User authentication implemented using Devise

---

## ⚙️ Tech Stack

* Ruby on Rails
* PostgreSQL
* Devise (Authentication)
* Policy-based Authorization (Pundit-style)

---

## 🧪 Demo Flow

1. Create an organization (e.g., IIT Delhi)
2. Assign subdomain and logo
3. Add users with different roles
4. Create groups and classrooms
5. Enforce RBAC:

   * Admin → allowed
   * Student → denied
6. Access via subdomain:

   * `iitd.lvh.me:3000`

---

## 🏗️ Setup Instructions

```bash
git clone https://github.com/aditi5050/circuitverse-org-prototype.git
cd circuitverse-org-prototype

bundle install
rails db:create
rails db:migrate

rails server
```

Then open:

```text
http://lvh.me:3000
```

---

## 💡 Future Work

* SSO integration using OpenID Connect (Google / Azure AD)
* Invitation system for onboarding users
* Admin dashboard for organization management
* Custom domain support

---

## 🎯 GSoC Relevance

This prototype demonstrates:

* Multi-tenant system design
* Hierarchical data modeling
* Policy-based RBAC implementation
* Foundation for enterprise-level features in CircuitVerse

---

## 📌 Author

Aditi
