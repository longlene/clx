# Dependency Syntax Reference

## Dependency Variables

| Variable | Purpose | Runs on |
|---|---|---|
| `DEPEND` | Compile-time libs/headers | CHOST (target machine) |
| `BDEPEND` | Build tools (compilers, generators) | CBUILD (build machine) |
| `RDEPEND` | Runtime deps | CHOST at runtime |
| `PDEPEND` | Post-merge runtime deps | (for cyclic dep resolution only) |

Common pattern:
```ebuild
DEPEND="dep/lib:="
RDEPEND="${DEPEND}
    extra/runtime-dep"
BDEPEND="
    virtual/pkgconfig
    dev-util/cmake
"
```

## Version Operators

```ebuild
>=dev-libs/foo-1.0       # 1.0 or newer
>dev-libs/foo-1.0        # strictly newer than 1.0
~dev-libs/foo-1.0        # exactly 1.0 or any 1.0-rN revision
=dev-libs/foo-1.0        # exactly 1.0
=dev-libs/foo-1.0*       # any 1.0.x (glob, only with =)
<dev-libs/foo-2.0        # older than 2.0
```

## Slot Dependencies

```ebuild
dev-libs/foo:0           # require slot 0
dev-libs/foo:=           # any slot, rebuild if slot changes (most common for libs)
dev-libs/foo:0=          # slot 0, rebuild if sub-slot changes
dev-libs/foo:*           # any slot, never rebuild
dev-qt/qtcore:6          # require slot 6
```

Rule of thumb: shared libraries → `:=`. Python → no slot dep (use `${PYTHON_USEDEP}` instead).

## USE Conditionals

```ebuild
RDEPEND="
    ssl? ( dev-libs/openssl:= )
    !ssl? ( net-libs/gnutls:= )
    gui? (
        x11-libs/gtk+:3
        x11-libs/libX11
    )
"
```

## OR Dependencies

```ebuild
RDEPEND="
    || (
        dev-libs/openssl:=
        net-libs/gnutls:=
    )
"
```

## USE Requirements on Dependencies

```ebuild
dev-python/foo[${PYTHON_USEDEP}]    # Python: always add this
dev-libs/bar[ssl]                    # require bar built with ssl USE
dev-libs/bar[ssl=]                   # require bar's ssl matches our ssl flag
dev-libs/bar[-debug]                 # require bar built without debug
dev-libs/bar[foo?,bar]               # conditional: foo? flag + always bar
```

## Blockers

```ebuild
!<old-pkg/foo-1.0        # weak blocker (uninstall after us)
!!old-pkg/foo            # strong blocker (must uninstall before us)
```

## REQUIRED_USE

```ebuild
REQUIRED_USE="
    ssl? ( !gnutls )          # ssl conflicts with gnutls
    gui? ( X )                # gui requires X
    ^^ ( a b c )              # exactly one of a, b, c
    ?? ( a b )                # at most one of a, b
    || ( a b c )              # at least one of a, b, c
"
```

## Python Dependency Helpers

```ebuild
# Standard Python dep
RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

# Version-conditional Python dep (only for python 3.10 and older)
RDEPEND="
    $(python_gen_cond_dep '
        dev-python/typing-extensions[${PYTHON_USEDEP}]
    ' 3.10)
"

# For DISTUTILS_SINGLE_IMPL packages:
RDEPEND="$(python_gen_dep 'dev-python/foo[${PYTHON_SINGLE_USEDEP}]')"
```

## Common BDEPEND entries

```ebuild
BDEPEND="
    virtual/pkgconfig          # whenever you use pkg-config
    dev-build/cmake            # CMake (usually pulled by cmake eclass)
    dev-build/meson            # Meson (usually pulled by meson eclass)
    dev-util/ninja             # Ninja build system
    app-arch/unzip             # if upstream ships .zip
    sys-devel/gettext          # for NLS/intltool
"
```
