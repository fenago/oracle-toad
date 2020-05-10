SELECT TO_CHAR(
          TO_TIMESTAMP_TZ('2003-01-01 10:00 ASIA/Tokyo',
                          'YYYY-MM-DD HH24:MI TZR'),
          'YYYY-MM-DD HH24:MI TZH:TZM')
           "Daylight savings in effect" FROM SYS.DUAL
/
