const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const exe = b.addExecutable(.{
        .name = "svd2zig",
        .root_source_file = .{ .path = "src/main.zig" },
        .optimize = optimize,
        .target = b.host,
    });

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
