struct Fragment {
    @builtin(position) Position : vec4f,
    @location(0) Color : vec4f,
};

@vertex
fn vertex_main(@builtin(vertex_index) v_id : u32) -> Fragment {
    var positions = array(
        vec2(0.0, 0.5),
        vec2(-0.5, -0.5),
        vec2(0.5, -0.5),
    );
    
    var colors = array(
        vec3(1.0, 0.0, 0.0),
        vec3(0.0, 1.0, 0.0),
        vec3(0.0, 0.0, 1.0),
    );

    var output: Fragment;
    output.Position = vec4f(positions[v_id], 0.0, 1.0);
    output.Color = vec4f(colors[v_id], 1.0);
    return output;
}

@fragment
fn frag_main(@location(0) Color: vec4f) -> @location(0) vec4f {
    return Color;
}