bpftrace -l | wc -l
bpftrace -l "*tracepoint:*" | wc -l

bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'
