# Tinet production security

1. The initial password `Tinet123` is only a bootstrap credential. Change it immediately.
2. Do not store administrator passwords in JavaScript, localStorage, GitHub, or SQL seed data.
3. Use Supabase Auth (or another established identity provider) for administrator/teacher login.
4. Store only password hashes through the authentication provider; never implement password hashing manually in the browser.
5. SMS/USSD credentials belong on a backend/serverless function, never in `index.html`.
6. Recovery should use a verified phone number and a short-lived OTP. Rate-limit OTP requests and attempts.
7. Enable Row Level Security (RLS) on every school table and create role-specific policies.
8. Use HTTPS in production.
9. Back up the database regularly.
10. Keep audit logs for changes to marks, fees, learners, subjects, timetable and security settings.
11. Do not expose the recovery phone number unnecessarily in public pages.
12. For GitHub Pages, treat the site as a public frontend. All sensitive data operations must be authenticated and authorized by the backend.
