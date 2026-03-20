
# circuitverse-org-prototype
=======
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
>>>>>>> 0a7c5ba (Initial commit: Org system prototype with RBAC)
=======
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
