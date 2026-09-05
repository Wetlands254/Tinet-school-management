# Deployment checklist

## Phase 1 — GitHub Pages
- [ ] Create repository
- [ ] Upload all files
- [ ] Enable GitHub Actions / Pages
- [ ] Confirm HTTPS site opens
- [ ] Change initial admin password

## Phase 2 — Database
- [ ] Create Supabase project
- [ ] Run `supabase-schema.sql`
- [ ] Configure RLS policies
- [ ] Create admin/headteacher/teacher/bursar roles
- [ ] Connect frontend using public anon key only

## Phase 3 — Real school operations
- [ ] Import learner register
- [ ] Add teachers
- [ ] Configure class subjects
- [ ] Configure fee structures
- [ ] Enter term and academic year
- [ ] Generate/check timetables
- [ ] Test reports and printing

## Phase 4 — SMS/USSD
- [ ] Choose an SMS provider
- [ ] Choose/configure USSD if required
- [ ] Create backend/serverless endpoints
- [ ] Store provider credentials as server secrets
- [ ] Add OTP rate limiting
- [ ] Test password recovery
- [ ] Test transaction/security logs
