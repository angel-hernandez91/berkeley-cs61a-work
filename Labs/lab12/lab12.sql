-- Requires the contents of file states.sql to be loaded first.
.read states.sql

-- Tables in states.sql:
--   states(state):       US States + DC - HI - AK
--   landlocked(state):   Table of landlocked (not adjacent to ocean) states
--   adjacencies(s1, s2): States that are adjacent to each other

create table california as
  -- REPLACE THIS LINE
  select s1, s2 from adjacencies where s1 = 'CA';

-- Finds lengths of possible paths between two states
create table distances as
  with
    distance(start, end, hops) as (
      select s1, s2, 1 from adjacencies union
      select k.start, hop.s2, k.hops + 1
             from adjacencies as hop, distance as k
             where k.hops < 15 and hop.s1 = k.end
    )
  select * from distance;

create table three_hops as

    select end from distances
    where hops = 3 and start = "CA";
