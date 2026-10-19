# Supabase setup for Tinet

1. Open the Tinet Supabase project.
2. Run `supabase-schema.sql` in SQL Editor after reviewing it.
3. Confirm `app.js` uses the Tinet project URL and publishable/anon key.
4. Create authorised staff users under Authentication.
5. Test login, cloud saving and refresh with dummy data.

**Security warning:** the shared JSON state schema has broad access for authenticated users. Use a test project until role-based RLS has been implemented and independently verified. Do not use this setup as a secure parent/student portal.
