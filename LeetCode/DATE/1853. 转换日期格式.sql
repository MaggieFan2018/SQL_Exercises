/*
    %W	星期名
    %w	周的天 （0=星期日, 6=星期六）
    %M	月名
    %m	月，数值(00-12)
    %d	月的天，数值(00-31)
    %e	月的天，数值(0-31)
    %Y	年，4 位
    %y	年，2 位
*/

SELECT DATE_FORMAT(day, '%W, %M %e, %Y') day
FROM Days;
