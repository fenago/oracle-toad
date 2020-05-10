select grantee,grantor,privilege
from all_tab_privs
where grantor ^= 'SYS'
/
