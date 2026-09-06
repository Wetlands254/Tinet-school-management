# Tinet School Management System — V3 improvements

## Marks entry
- Fixed the class/subject selector so changing class automatically refreshes the subject list.
- Added period-aware subject selection based on the selected assessment's year and term.
- Existing V2 subject configurations are safely backfilled with the official class subject catalogue; custom subjects are preserved.
- Added validation for marks entered outside 0–50.
- Added clearer learner/assessment context while entering marks.

## Timetable
- Replaced the old single-teacher timetable generator with a teacher-aware scheduling engine.
- Added explicit teaching assignments: Teacher → Class → Subject → Weekly lessons.
- A teacher can teach different subjects in different classes.
- Whole-section generation schedules classes together and prevents teacher double-booking.
- Uses 40-minute CBC lesson blocks for upper primary and junior, matching the supplied reference timetable structure.
- Added breaks, lunch, personal studies/prep and afternoon-activity rows to the printable timetable.
- Timetable headings now use the correct school identity:
  - TINET PRIMARY SCHOOL
  - TINET JUNIOR SCHOOL
  - TINET ECDE SCHOOL
- Added teacher timetable view.

## Printing
- Individual learner reports redesigned as compact, colourful A4 reports intended to stay on one page.
- Timetables use a modern school-report style and print on a single A4 page per class.
- Print-only controls are hidden from printed output.

## Database foundation
- Added `teaching_assignments` for explicit teacher/class/subject loads.
- Made timetable records academic-year/term aware.


## V3.1 Timetable timing update
- Primary and Junior lessons changed to 35 minutes.
- Fixed short break: 9:30–9:50 AM.
- Fixed second break: 11:00–11:30 AM.
- Lower Primary teaching periods end at 12:40 PM.
- Upper Primary and Junior teaching periods end at 3:10 PM.
- Lunch remains 12:40–1:40 PM and Personal Studies/Prep remains 1:40–2:00 PM.
- Afternoon activities remain from 3:30 PM for Upper Primary and Junior.
- A 9:10–9:30 AM class activity/reading block bridges the fixed first break without creating a shortened lesson.

## V3.1 correction — Junior lesson duration
- Junior School (Grades 7–9) lessons are **40 minutes**, not 35 minutes.
- Junior timetable uses 40-minute lesson slots while retaining fixed 9:30–9:50 AM and 11:00–11:30 AM breaks, 12:40–1:40 PM lunch, and 1:40–2:00 PM prep.
- Junior afternoon lessons run to 3:20 PM, followed by afternoon activities from 3:30 PM.
- Lower and Upper Primary remain on 35-minute lessons; Upper Primary ends lessons at 3:10 PM.
