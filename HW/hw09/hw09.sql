create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

create table dogs as
  select "abraham" as name, "long" as fur, 26 as height union
  select "barack"         , "short"      , 52           union
  select "clinton"        , "long"       , 47           union
  select "delano"         , "long"       , 46           union
  select "eisenhower"     , "short"      , 35           union
  select "fillmore"       , "curly"      , 32           union
  select "grover"         , "short"      , 28           union
  select "herbert"        , "curly"      , 31;

create table sizes as
  select "toy" as size, 24 as min, 28 as max union
  select "mini",        28,        35        union
  select "medium",      35,        45        union
  select "standard",    45,        60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
create table size_of_dogs as
select a.name as name, b.size as size
  from dogs as a, sizes as b
  where b.min < a.height and a.height <= b.max;



-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
select child from parents, dogs where parent = name order by height desc;


-- Sentences about siblings that are the same size
create table sentences as
  with
  siblings(parent, child, siblings) as (
  select a.parent, a.child, size from parents as a
  inner join size_of_dogs as b where a.child = b.name
  )

select a.child || ' and ' || b.child || ' are ' || a.siblings || ' siblings'
  from siblings as a, siblings as b
  where a.parent = b.parent and a.child < b.child and a.siblings = b.siblings;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
with
  dogs_stack(names, stack, sum_height, final) as (
  select name, 1, height, height from dogs union
  select a.names || ", " || b.name, stack + 1, sum_height + b.height, b.height
    from dogs_stack as a, dogs as b
    where a.final < b.height and stack < 4
  )
select names, sum_height from dogs_stack
  where sum_height >= 170 and stack = 4 order by sum_height;

create table tallest as
  select max(height), name from dogs where height < 30 union
  select max(height), name from dogs where height < 40 and height > 30 union
  select max(height), name from dogs where height < 50 and height > 40;


-- All non-parent relations ordered by height difference
create table non_parents as
select "REPLACE THIS LINE WITH YOUR SOLUTION";


