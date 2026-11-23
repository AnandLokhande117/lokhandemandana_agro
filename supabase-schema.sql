-- Run this once in Supabase Dashboard > SQL Editor.
-- One private JSON state row per authenticated owner. Row Level Security prevents
-- one signed-in user from reading or changing another user's business records.
create table if not exists public.business_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.business_state enable row level security;
drop policy if exists "Owner can read own business state" on public.business_state;
create policy "Owner can read own business state"
  on public.business_state for select to authenticated
  using (auth.uid() = user_id);
drop policy if exists "Owner can insert own business state" on public.business_state;
create policy "Owner can insert own business state"
  on public.business_state for insert to authenticated
  with check (auth.uid() = user_id);
drop policy if exists "Owner can update own business state" on public.business_state;
create policy "Owner can update own business state"
  on public.business_state for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
