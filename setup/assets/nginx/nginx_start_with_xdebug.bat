set "TARGET_WORKSPACE=%cd%"
set TARGET_WORKSPACE=%TARGET_WORKSPACE:\=\\/%

%VSC_DRIVE%

cd %VSC_ROOT%
..\utils\gnuwin\sed -i '0,/root.*/ s//root   %TARGET_WORKSPACE%;/g' ..\utils\nginx\conf\nginx.conf
..\utils\gnuwin\sed -i '0,/root.*/! {0,/root.*/! {0,/root.*/ s//root   %TARGET_WORKSPACE%;/g}}' ..\utils\nginx\conf\nginx.conf

rem �߰��� ���� ������ - �ż��� ����
..\utils\gnuwin\sed -i '0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/ s//root   %TARGET_WORKSPACE%;/g}}}}}' ..\utils\nginx\conf\nginx.conf
..\utils\gnuwin\sed -i '0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/! {0,/root.*/ s//root   %TARGET_WORKSPACE%;/g}}}}}}}' ..\utils\nginx\conf\nginx.conf

cd ..\utils\nginx
start nginx.exe

rem cd ..\langs\php
cd %PHP_ROOT%
php-cgi.exe -c php.ini -b 127.0.0.1:9900
