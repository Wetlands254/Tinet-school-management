# Tinet School Management System V2 — Deployment Checklist

## Before uploading

1. Keep the existing GitHub repository as a backup.
2. Download/export a backup from the current live system if it contains data.
3. Upload the V2 `index.html` and the updated `supabase-schema.sql`.
4. You can also upload the V2 README and CHANGELOG.

## GitHub Pages

The repository should use:

- Branch: `main`
- Folder: `/ (root)`
- Source: **Deploy from a branch**

After committing `index.html`, wait for the `github-pages` deployment to finish.

## V2 first run

The first time V2 opens on the same browser/site origin, it migrates the V1 local data into the new structure.

Check:

- Learners still appear.
- Teachers still appear.
- Marks still appear.
- Existing fees are preserved for the current period.
- Current period is 2026 Term 3.

## Test flexible fees

1. Open **Settings**.
2. Add/open another period, e.g. `2027 Term 1`.
3. Select **Use**.
4. Open **Fees → Configure Current Term Fees**.
5. Set different fees for different classes.
6. Return to 2026 Term 3 and confirm its fee values are unchanged.

## Test flexible subjects

1. Open **Subjects**.
2. Select an academic year and term.
3. Select a class.
4. Add a subject.
5. Choose `Selected class`, `All ECDE classes`, `All Primary classes`, `All Junior classes`, or `All classes`.
6. Deactivate/reactivate a subject.
7. Confirm it changes the current marks/report subject list.
8. Confirm historical marks are not deleted from the browser data.

## Supabase production phase

The included SQL creates the database foundation for year/term-aware data. Before real school data is stored in Supabase:

- Create Supabase Auth users/roles.
- Configure Row Level Security policies.
- Never expose a Supabase service-role key in GitHub Pages.
- Connect the frontend using only a publishable/anon key with appropriate RLS policies.

The current V2 browser application still operates locally; the Supabase schema is prepared for the database connection phase.
