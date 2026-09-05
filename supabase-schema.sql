-- TINET PRIMARY AND JUNIOR SCHOOL
-- Production database foundation for Supabase/PostgreSQL.
-- Run this in Supabase SQL Editor after creating a project.

create extension if not exists pgcrypto;

create table if not exists public.school_settings (
  id uuid primary key default gen_random_uuid(),
  school_name text not null default 'Tinet Primary and Junior School',
  motto text default 'Learn • Grow • Excel',
  current_term text default 'Term 3',
  academic_year integer default 2026,
  recovery_phone text default '0718134443',
  email text,
  updated_at timestamptz not null default now()
);

create table if not exists public.classes (
  id uuid primary key default gen_random_uuid(),
  name text unique not null,
  section text not null check (section in ('ECDE','Primary','Junior')),
  level_group text not null check (level_group in ('ECDE','Lower Primary','Upper Primary','Junior')),
  active boolean not null default true
);

create table if not exists public.subjects (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  section text not null check (section in ('ECDE','Primary','Junior')),
  default_weekly_lessons integer not null default 4,
  active boolean not null default true,
  unique(name, section)
);

create table if not exists public.class_subjects (
  class_id uuid references public.classes(id) on delete cascade,
  subject_id uuid references public.subjects(id) on delete cascade,
  weekly_lessons integer not null default 4,
  active boolean not null default true,
  primary key(class_id, subject_id)
);

create table if not exists public.teachers (
  id uuid primary key default gen_random_uuid(),
  auth_user_id uuid unique,
  full_name text not null,
  staff_number text unique,
  role text not null default 'Teacher',
  phone text,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.learners (
  id uuid primary key default gen_random_uuid(),
  admission_number text unique not null,
  full_name text not null,
  gender text check (gender in ('Male','Female','Other')),
  class_id uuid references public.classes(id),
  date_of_birth date,
  parent_guardian text,
  parent_phone text,
  address text,
  status text not null default 'Active' check (status in ('Active','Archived')),
  created_at timestamptz not null default now()
);

create table if not exists public.assessments (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  term text not null,
  academic_year integer not null,
  max_mark numeric not null default 50
);

create table if not exists public.marks (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid references public.learners(id) on delete cascade,
  assessment_id uuid references public.assessments(id) on delete cascade,
  subject_id uuid references public.subjects(id),
  mark numeric not null check (mark >= 0 and mark <= 100),
  entered_by uuid,
  created_at timestamptz not null default now(),
  unique(learner_id, assessment_id, subject_id)
);

create table if not exists public.attendance (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid references public.learners(id) on delete cascade,
  attendance_date date not null,
  status text not null check (status in ('Present','Absent','Late','Excused')),
  entered_by uuid,
  unique(learner_id, attendance_date)
);

create table if not exists public.fee_structures (
  id uuid primary key default gen_random_uuid(),
  class_id uuid references public.classes(id) on delete cascade,
  amount numeric not null default 0,
  term text not null,
  academic_year integer not null,
  unique(class_id, term, academic_year)
);

create table if not exists public.fee_payments (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid references public.learners(id) on delete cascade,
  amount numeric not null check (amount > 0),
  method text not null,
  receipt_number text unique not null,
  payment_date timestamptz not null default now(),
  term text not null,
  academic_year integer not null,
  recorded_by uuid
);

create table if not exists public.timetables (
  id uuid primary key default gen_random_uuid(),
  class_id uuid references public.classes(id) on delete cascade,
  teacher_id uuid references public.teachers(id),
  day_of_week integer not null check (day_of_week between 1 and 5),
  start_time time not null,
  end_time time not null,
  subject_id uuid references public.subjects(id),
  unique(class_id, day_of_week, start_time),
  unique(teacher_id, day_of_week, start_time)
);

create table if not exists public.audit_log (
  id uuid primary key default gen_random_uuid(),
  actor uuid,
  action text not null,
  entity_type text,
  entity_id uuid,
  metadata jsonb,
  created_at timestamptz not null default now()
);

-- Initial classes
insert into public.classes(name,section,level_group) values
('PP1','ECDE','ECDE'),('PP2','ECDE','ECDE'),
('Grade 1','Primary','Lower Primary'),('Grade 2','Primary','Lower Primary'),('Grade 3','Primary','Lower Primary'),
('Grade 4','Primary','Upper Primary'),('Grade 5','Primary','Upper Primary'),('Grade 6','Primary','Upper Primary'),
('Grade 7','Junior','Junior'),('Grade 8','Junior','Junior'),('Grade 9','Junior','Junior')
on conflict (name) do nothing;

-- Default subjects. Junior has exactly nine by default.
insert into public.subjects(name,section,default_weekly_lessons) values
('Language Activities','ECDE',4),('Mathematical Activities','ECDE',4),('Environmental Activities','ECDE',4),('Creative Activities','ECDE',4),
('English','Primary',5),('Kiswahili','Primary',4),('Mathematics','Primary',5),('Environmental Activities','Primary',4),('Creative Arts','Primary',4),('Religious Education','Primary',4),
('Science & Technology','Primary',5),('Agriculture','Primary',4),('Social Studies','Primary',4),('Creative Arts & Sports','Primary',4),
('English','Junior',5),('Kiswahili','Junior',4),('Mathematics','Junior',5),('Integrated Science','Junior',5),('Agriculture','Junior',4),('Social Studies','Junior',4),('Creative Arts & Sports','Junior',4),('Pre-Technical Studies','Junior',4),('Religious Education','Junior',4)
on conflict (name,section) do nothing;

-- Secure row-level security foundation.
alter table public.school_settings enable row level security;
alter table public.classes enable row level security;
alter table public.subjects enable row level security;
alter table public.class_subjects enable row level security;
alter table public.teachers enable row level security;
alter table public.learners enable row level security;
alter table public.assessments enable row level security;
alter table public.marks enable row level security;
alter table public.attendance enable row level security;
alter table public.fee_structures enable row level security;
alter table public.fee_payments enable row level security;
alter table public.timetables enable row level security;
alter table public.audit_log enable row level security;

-- IMPORTANT:
-- Add production policies after deciding roles:
-- administrator, headteacher, teacher, bursar, and read-only/report users.
-- Do not use a public/anon write policy for learner, marks, fees or password data.
