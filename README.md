# Yaveri (Yet Another Verilog Compiler)

Just some guy learning.

## Building

**Normal**

```bash
$ meson setup build
$ ninja -C build
```

**Yocto Project SDK**

```bash
$ meson setup --prefix="${SDKTARGETSYSROOT}/usr" \
              --libdir="${SDKTARGETSYSROOT}/usr/lib64" \
              build
$ ninja -C build
```
