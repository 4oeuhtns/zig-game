const std = @import("std");
const core = @import("mach-core");
const gpu = core.gpu;

pub const Mesh = struct {
    const Self = @This();

    buffer: gpu.Buffer,
    bufferLayout: gpu.VertexBufferLayout,

    pub fn init() !void {
        const vertices = [_]f32{ 0.0, 0.5, 1.0, 0.0, 0.0, -0.5, -0.5, 0.0, 1.0, 0.0, 0.5, -0.5, 0.0, 0.0, 1.0 };
        const usage = gpu.Buffer.UsageFlags{ .vertex = true, .copy_dst = true };

        const descriptor = gpu.Buffer.Descriptor{
            .size = vertices.len,
            .usage = usage,
            .mapped_at_creation = .true,
        };

        var buffer = core.device.createBuffer(&descriptor);
        const vertex_mapped = buffer.getMappedRange(f32, 0, vertices.len/5);
        @memcpy(vertex_mapped.?, vertices[0..]);
        buffer.unmap();
        const vertex_attributes = [_]gpu.VertexAttribute{
            .{
                .shader_location = 0,
                .format = .float32x2,
                .offset = 0,
            },
            .{
                .shader_location = 1,
                .format = .float32x3,
                .offset = 8,
            },
        };
        const bufferLayout = gpu.VertexBufferLayout.init(.{ 
            .array_stride = 20,
            .attributes = &vertex_attributes
        });

        return Mesh{
            .buffer = buffer,
            .bufferLayout = bufferLayout,
        };
    }
};
