# Tinet Primary and Junior School Management System

GitHub-ready school management system for Tinet Primary and Junior School.

## Frontend already included

- Modern colourful responsive dashboard
- ECDE: PP1 and PP2
- Lower Primary: Grades 1–3
- Upper Primary: Grades 4–6
- Junior: Grades 7–9
- Junior default 9 subjects
- Add/deactivate subjects by class for ECDE/Primary
- Separate fee management by ECDE, Primary and Junior
- Learner register and printable class lists
- Teacher register
- Marks entry
- Average-based grading and class ranking
- Individual learner reports with bar/doughnut charts
- Headteacher and class-teacher signature areas
- Recommendations
- Attendance
- Class and teacher timetables
- A4 printing
- Administrator security settings
- Backup and audit log in prototype mode

## Timetable rules included

### ECDE
- PP1 and PP2
- Two teachers, one teacher per class timetable
- 8:30 AM–12:40 PM

### Primary
- Grades 1–3: individual class teacher teaches all subjects
- Grades 4–6: upper-primary timetable
- 8:00 AM–3:30 PM
- 35-minute lessons
- First break: 9:30–9:50
- Second break: 11:00–11:30

### Junior
- Grades 7–9
- 9 subjects by default
- 8:00 AM–3:30 PM
- 40-minute lessons
- Three lessons before first break
- First break: 10:00–10:30
- Second break: 11:50–12:00
- Timetable supports teacher collision prevention

## Production architecture

The included `supabase-schema.sql` creates the persistent database foundation for:
learners, teachers, classes, subjects, marks, assessments, attendance, fees, timetables and audit logs.

The frontend can be hosted on GitHub Pages, while the database/authentication runs on Supabase or another secure backend.

### Important

GitHub Pages alone cannot securely provide:
- multi-device persistent school records
- administrator authentication
- real password recovery
- real SMS/USSD delivery
- role-based access control

Those require a backend.

## Deploy frontend to GitHub Pages

1. Create a GitHub repository.
2. Upload the contents of this folder to the root of the `main` branch.
3. Go to **Settings → Pages**.
4. Under build/deployment, choose **GitHub Actions**.
5. Push to `main`.
6. The included workflow deploys the site automatically.

## Initial prototype login

Username: `admin`
Password: `Tinet123`

Change this immediately after first login.

## Real SMS/USSD

The phone number requested for recovery is represented in the application settings, but no fake SMS is sent.

For production, connect a Kenyan SMS/USSD provider through a backend/serverless function. Keep provider API keys out of GitHub and out of browser JavaScript.
