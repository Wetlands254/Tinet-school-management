# Tinet Primary and Junior School Management System

A modern browser-based school management prototype.

## Included
- Separate ECDE, Primary and Junior sections
- Lower Primary (Grades 1–3) one-teacher class model
- Upper Primary (Grades 4–6)
- Junior School Grades 7–9 with 9 default subjects
- Class-specific subject add/deactivate
- Section/class-specific fees
- Learners and teachers
- Marks, average-based grading and class ranking
- Colourful individual reports with charts and signatures
- Attendance
- Timetable generator with separate ECDE/Primary/Junior timing rules
- Teacher timetable
- Printing/A4 CSS
- Administrator password/security settings
- Initial admin: admin / Tinet123
- Recovery phone: 0718134443
- Demo OTP recovery flow, clearly marked for provider integration
- JSON backup and audit log

## Important production note
This version is a functional browser prototype. It stores data in localStorage and cannot itself send a real SMS or USSD request. For live school use, move authentication/data to a secure backend/database and connect a legitimate Kenyan SMS/USSD provider. Never expose API keys in frontend JavaScript.

## Run
Open `index.html` in a modern browser.

For a live deployment, use a secure HTTPS server and persistent backend database.
