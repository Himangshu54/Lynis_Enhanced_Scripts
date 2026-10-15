 #Script 1: OS Security - Cron Job Directory Permissions
Register --test-no CUST-0010 --weight L --network NO --category security --description "Check cron.daily permissions"
if [ ${SKIPTEST} -eq 0 ]; then
    Display --indent 2 --text "- Checking cron.daily permissions"
    LogText "Test CUST-0010: Checking /etc/cron.daily permissions"
    
    PERMS=$(stat -c "%a" /etc/cron.daily 2>/dev/null)
    
    if [ "${PERMS}" = "755" ]; then
        Display --indent 4 --text "Permissions are secure (755)" --result "OK" --color GREEN
        LogText "Result: Permissions are secure."
    else
        Display --indent 4 --text "Permissions are insecure" --result "WARNING" --color RED
        LogText "Result: Permissions are insecure! Expected 755, found ${PERMS}."
    fi
fi
