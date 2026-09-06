# Tinet School Management System V3 — Deployment Checklist

## Before uploading

1. Keep the previous repository/version as a backup.
2. Export a backup from the current live system if it contains data.
3. Upload the V3 `index.html` and the updated `supabase-schema.sql`.
4. Upload the V3 README, CHANGELOG-V3 and security/deployment documentation.

## V3 marks test

1. Open **Marks**.
2. Select an assessment.
3. Select Grade 4, 5, 6, 7, 8 or 9.
4. Confirm the subject dropdown changes to that class's full active subject list.
5. Enter marks out of 50 and save.
6. Change class and confirm the previous class's subject is not incorrectly carried into the new class.

## V3 timetable test

1. Add every teacher under **Teachers**.
2. Open **Teaching Assignments**.
3. Assign each teacher to the exact class + subject they teach.
4. Set weekly lesson counts to match the school's curriculum.
5. For Grades 4–6 select **Upper Primary**.
6. For Grades 7–9 select **Junior**.
7. Use **Generate Whole Section**. This is preferred because the generator can see all classes and avoid teacher clashes across the section.
8. Review the warning/status message. A warning means the school configuration needs adjustment; the system does not invent a teacher.
9. Print the selected class timetable and confirm the heading says **TINET PRIMARY SCHOOL** or **TINET JUNIOR SCHOOL** as appropriate.

## Print test

- Individual learner reports: target one A4 page.
- Class timetables: target one A4 page.
- Whole-school reports/lists may intentionally span multiple pages.
- Use the browser's A4/portrait print setting unless the document itself specifies another orientation.

## Supabase production

- Run the updated SQL in the Supabase SQL Editor.
- Create Auth users and role-specific RLS policies before storing real learner data.
- Never place a service-role key in the browser.
- Test authenticated reads/writes for learners, marks, fees, subjects, teaching assignments and timetables before production use.
