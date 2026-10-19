# Tinet School Management System

A merged upgrade of the original Tinet project with the comprehensive academic, reporting, administration and school-control modules from Kapnanda.

## Included modules

### Existing and merged school operations
- Dashboard, learner records, alumni register and teacher records
- Marks, exams, question-paper workflow, class rankings and performance analytics
- Attendance register and printable learner reports
- Fees, payment records, capitation and budgets where configured in the merged app
- Timetables, subjects, academic-year promotion and school controls
- Parent/guardian contact management, bulk messaging workflow and TPAD Assistant
- CSV imports/exports, PDF/print workflows, settings, backup and audit features inherited from the Kapnanda codebase

### Additional Tinet modules
- Parent contact / portal-preparation register
- Student portal access register
- E-learning and assignments register
- Communication and announcements register
- HR and payroll preparation register
- M-PESA integration readiness guide

The new registers store records in the shared school-state JSON. They are useful administrative registers, but they are **not yet authenticated parent/student portals, an online learning delivery platform, a payroll engine, or a live M-PESA Daraja integration**. Those require separate authentication mappings, server-side workflows, and testing.

## Setup

1. Download/extract this project and upload the files to the root of a private GitHub repository.
2. Review `supabase-schema.sql` and run it in the **Tinet Supabase project** SQL Editor.
3. Confirm the project URL and publishable/anon key in `app.js` are correct for your Tinet Supabase project. Never place a service-role key in browser code.
4. Create authorised staff accounts in Supabase Authentication.
5. Enable GitHub Pages (or suitable static hosting) for the repository.
6. Sign in and test on a copy of the data before using it for live school records.

## Important database and security notes

- This merged build is configured to use Tinet's Supabase URL and the `TINET` shared-state row ID.
- The original shared-state design grants broad read/write access to authenticated users. This is **not adequate for production role separation** among administrators, teachers, parents and students.
- Do not issue parent/student accounts or put real learner data into production until database permissions are redesigned and tested. Supabase RLS must enforce access server-side; hiding UI buttons is not security.
- Take a backup before running schema changes. Do not run this against the Kapnanda project.
- Never publish real learner records, secrets or service-role keys to a public repository.

## M-PESA

Automatic payments are not enabled in this build. To add them, register a Safaricom Daraja application and implement STK Push and verified callbacks in a server-side endpoint or Supabase Edge Function. Keep consumer secrets server-side, verify transactions, prevent duplicate callback processing, and reconcile confirmed payments with invoices before issuing receipts.

## Recommended rollout

1. Deploy to a test URL and use sample records.
2. Verify all existing modules, reports, printouts, rankings, imports and exports.
3. Harden the database and role model before onboarding non-staff users.
4. Implement dedicated parent/student authentication and scoped data access.
5. Add server-side M-PESA, messaging, email, e-learning submissions and payroll integrations as separate tested phases.
