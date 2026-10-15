# Script 2: Protocol Security - FTP Anonymous Access
Register --test-no CUST-0020 --weight L --network NO --category security --description "Check FTP anonymous access"
if [ ${SKIPTEST} -eq 0 ]; then
    Display --indent 2 --text "- Checking FTP configuration for anonymous access"
    LogText "Test CUST-0020: Checking /etc/vsftpd.conf"
    
    if [ -f "/etc/vsftpd.conf" ]; then
        grep -q "anonymous_enable=YES" /etc/vsftpd.conf
        if [ $? -eq 0 ]; then
            Display --indent 4 --text "Anonymous FTP is ENABLED" --result "WARNING" --color RED
            LogText "Result: Anonymous access is dangerously enabled."
        else
            Display --indent 4 --text "Anonymous FTP is DISABLED" --result "OK" --color GREEN
            LogText "Result: Anonymous access is safely disabled."
        fi
    else
        Display --indent 4 --text "FTP server not installed (Safe)" --result "OK" --color GREEN
        LogText "Result: vsftpd.conf not found, assuming FTP is not running."
    fi
fi
