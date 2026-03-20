# CircuitVerse Organization System Prototype

## 🚀 Overview

This project is a prototype implementation of enterprise-level organizational features for CircuitVerse, designed for GSoC.

It introduces a scalable multi-tenant architecture allowing institutions to manage users, groups, and classrooms with role-based access control.

---

## 🧠 Features Implemented

### 🏢 Organization Hierarchy

* Organization → Groups → Classrooms
* Supports institutional structure (e.g., University → Department → Course)

### 👥 Multi-Tenancy

* Users belong to organizations via memberships
* Data is isolated per organization

### 🛡️ Role-Based Access Control (RBAC)

* Roles: `org_admin`, `instructor`, `student`
* Only authorized roles can create/manage classrooms

### 🔐 Authentication

* Implemented using Devise

---

## ⚙️ Tech Stack

* Ruby on Rails
* PostgreSQL
* Devise (Authentication)
* Pundit-style policy (RBAC)

---

## 🧪 Demo

### Example Flow:

1. Create organization (e.g., IIT Delhi)
2. Add users with roles
3. Create group (CSE Department)
4. Create classroom (Digital Logic)
5. RBAC:

   * Admin → allowed
   * Student → denied

---

## 💡 Key Learnings

* Multi-tenant architecture design
* Policy-based authorization
* Scalable database modeling

---

## 🎯 Future Work

* SSO integration (OIDC)
* Invitation system
* Admin dashboard
* Custom branding

---

## 📌 Author

Aditi
