# Tinet Primary and Junior School Management System — V2

GitHub Pages-ready school management system for Tinet Primary and Junior School.

## V2 upgrades

- Academic year + Term are now central to the system.
- Fees are stored separately for every class, academic year and term.
- Changing a new term's fee does not alter previous-term payment records.
- Subjects can be added to one class, a whole section, or all classes.
- Subjects can be deactivated/reactivated without deleting historical marks.
- Subject combinations are term/year aware.
- Weekly lesson frequency and double-lesson settings can be configured per subject/class/term.
- Reports and rankings use the active subjects for the selected assessment period.
- Academic periods can be opened/closed and switched from Settings.
- Existing V1 local browser data is migrated into the V2 structure on first load.

## Current deployment mode

The GitHub Pages frontend currently uses browser local storage for its working data. The included `supabase-schema.sql` is the V2 database foundation for a later Supabase connection.

**Do not put Supabase service-role keys in GitHub Pages or browser code.** Production authentication and Row Level Security policies should be configured before storing real school data.

## Default period

- Academic year: 2026
- Term: Term 3
- Junior default: 9 subjects

## Default administrator

- Username: `admin`
- Initial password: `Tinet123`

Change the initial password immediately after first login. The browser prototype's password storage is not a substitute for server-side authentication.
