create or replace type DummyObj as OBJECT (
   f1     number,
   f2     number,
   member procedure method1 (x in varchar2),
  member function  method2 return date
);
