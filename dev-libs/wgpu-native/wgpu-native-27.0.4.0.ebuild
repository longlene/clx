# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.4
	android_system_properties@0.1.5
	arrayvec@0.7.6
	ash@0.38.0+1.3.281
	autocfg@1.5.0
	bindgen@0.72.1
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@2.10.0
	block@0.1.6
	bumpalo@3.19.0
	bytemuck@1.24.0
	bytemuck_derive@1.10.2
	cexpr@0.6.0
	cfg-if@1.0.4
	cfg_aliases@0.2.1
	clang-sys@1.8.1
	codespan-reporting@0.12.0
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	core-graphics-types@0.2.0
	crunchy@0.2.4
	document-features@0.2.12
	either@1.15.0
	equivalent@1.0.2
	fixedbitset@0.5.7
	foldhash@0.1.5
	foldhash@0.2.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	gl_generator@0.14.0
	glob@0.3.3
	glow@0.16.0
	glutin_wgl_sys@0.6.1
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	gpu-allocator@0.27.0
	gpu-descriptor-types@0.2.0
	gpu-descriptor@0.3.2
	half@2.7.1
	hashbrown@0.15.5
	hashbrown@0.16.0
	hexf-parse@0.2.1
	indexmap@2.12.0
	itertools@0.13.0
	jni-sys@0.3.0
	js-sys@0.3.82
	khronos-egl@6.0.0
	khronos_api@3.1.0
	libc@0.2.177
	libloading@0.8.9
	libm@0.2.15
	litrs@1.0.0
	lock_api@0.4.14
	log@0.4.28
	malloc_buf@0.0.6
	memchr@2.7.6
	metal@0.32.0
	minimal-lexical@0.2.1
	naga@27.0.3
	ndk-sys@0.6.0+11769913
	nom@7.1.3
	num-traits@0.2.19
	objc@0.2.7
	once_cell@1.21.3
	ordered-float@5.1.0
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	paste@1.0.15
	petgraph@0.8.3
	pkg-config@0.3.32
	pp-rs@0.2.1
	presser@0.3.1
	prettyplease@0.2.37
	proc-macro2@1.0.103
	profiling@1.0.17
	quote@1.0.42
	range-alloc@0.1.4
	raw-window-handle@0.6.2
	redox_syscall@0.5.18
	regex-automata@0.4.13
	regex-syntax@0.8.8
	regex@1.12.2
	renderdoc-sys@1.1.0
	rustc-hash@1.1.0
	rustc-hash@2.1.1
	rustversion@1.0.22
	scopeguard@1.2.0
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	shlex@1.3.0
	slotmap@1.0.7
	smallvec@1.15.1
	spirv@0.3.0+sdk-1.3.268.0
	syn@2.0.110
	thiserror-impl@1.0.69
	thiserror-impl@2.0.17
	thiserror@1.0.69
	thiserror@2.0.17
	unicode-ident@1.0.22
	unicode-width@0.2.2
	unicode-xid@0.2.6
	version_check@0.9.5
	wasm-bindgen-macro-support@0.2.105
	wasm-bindgen-macro@0.2.105
	wasm-bindgen-shared@0.2.105
	wasm-bindgen@0.2.105
	web-sys@0.3.82
	wgpu-core-deps-apple@27.0.0
	wgpu-core-deps-emscripten@27.0.0
	wgpu-core-deps-windows-linux-android@27.0.0
	wgpu-core@27.0.3
	wgpu-hal@27.0.4
	wgpu-types@27.0.1
	windows-core@0.58.0
	windows-implement@0.58.0
	windows-interface@0.58.0
	windows-link@0.2.1
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-targets@0.52.6
	windows@0.58.0
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	xml-rs@0.8.28
	zerocopy-derive@0.8.27
	zerocopy@0.8.27
"

RUST_MIN_VER="1.82.0"

_WEBGPU_HEADERS_COMMIT="bac520839ff5ed2e2b648ed540bd9ec45edbccbc"

inherit cargo

DESCRIPTION="Native WebGPU implementation based on wgpu-core"
HOMEPAGE="https://github.com/gfx-rs/wgpu-native"
SRC_URI="
	https://github.com/gfx-rs/wgpu-native/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/webgpu-native/webgpu-headers/archive/${_WEBGPU_HEADERS_COMMIT}.tar.gz
		-> webgpu-headers-${_WEBGPU_HEADERS_COMMIT}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
LICENSE+=" Apache-2.0 BSD CC0-1.0 ISC MIT Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	rmdir ffi/webgpu-headers && ln -sv "${WORKDIR}/webgpu-headers-${_WEBGPU_HEADERS_COMMIT}" ffi/webgpu-headers || die
}

src_install() {
	dolib.so target/release/libwgpu_native.so
	doheader ffi/wgpu.h ffi/webgpu-headers/webgpu.h
	einstalldocs
}
