create table av_data
    (blob_id         number(10,0) not null,
    blob_type        varchar2(10) not null,
    description      varchar(25)  not null,
    blob_data        blob )
/
