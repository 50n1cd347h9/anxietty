extern const _heap_start: *u8;

const KmallocChunk = struct {
    fd: *KmallocChunk,
    bk: *KmallocChunk,
    data: u8 align(0x10),
};

const KmallocState = packed struct {
    heap_top: *u8,
    chunks: *KmallocChunk,
};

export var km_state: KmallocState = _heap_start;



pub fn initKmalloc() void {
    km_state.heap_top: *u8 = _heap_start + @sizeOf(KmallocState);
    km_state.first_chunk = &(km_state.chunks);
}

// align 0x10 bytes
pub fn kmalloc(buf_size: u32) *KmallocState {
    const new_chunk: *KmallocChunk = km_state.heap_top;

    new_chunk.fd = km_state.;
}
