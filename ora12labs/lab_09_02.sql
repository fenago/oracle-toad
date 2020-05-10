set echo on
drop index exp_mod;
CREATE index exp_mod on exp_test(mod(id,10));

