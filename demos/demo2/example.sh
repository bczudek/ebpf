bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'

bpftrace -l | wc -l
bpftrace -l "*tracepoint:*" | wc -l
