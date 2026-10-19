# Security checklist — Tinet School Management System

- Browser code must contain only the Supabase publishable/anon key. Never include a service-role key.
- The current shared-state table has broad authenticated-user access and is suitable only for a controlled staff test environment until policies are tightened.
- Before production, replace broad access with role-aware database policies and preferably normalized tables for learners, marks, fees, attendance, parents, students and staff.
- Enforce authorization in PostgreSQL/Supabase RLS, not only in front-end navigation.
- Parent/student accounts must be explicitly linked to learner/guardian records and must only access permitted records.
- Use server-side Edge Functions for M-PESA, SMS, WhatsApp and other provider secrets.
- Keep backups encrypted and restrict access; test restoration.
- Keep real learner data out of public Git repositories and issue trackers.
