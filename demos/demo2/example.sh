bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'
bpftrace -e 'tracepoint:syscalls:sys_enter_openat /comm == "cat"/ { printf("%s %s\n", comm, str(args->filename)) }'

bpftrace -l | wc -l
bpftrace -l "*tracepoint:*" | wc -l
comm	Process or command name