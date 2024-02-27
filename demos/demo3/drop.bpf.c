#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int counter = 0;

SEC("xdp")
int drop(struct xdp_md *ctx) {
    bpf_printk("Dropping packet %d", counter);
    counter++;
    return XDP_DROP;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";