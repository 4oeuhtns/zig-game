@vertex fn vertex_main(
    @builtin(vertex_index) VertexIndex : u32
) -> @builtin(position) vec4f {
    var pos = array(
        vec2(-0.5,  0.5),
        vec2( 0.75,  0.5),
        vec2( 0.5, -0.5),
        vec2(-0.5, -0.5),
        
    );
    return vec4f(pos[VertexIndex], 0.0, 1.0);
}

@fragment fn frag_main() -> @location(0) vec4f {
    return vec4(1, 1, 0, 1);
}