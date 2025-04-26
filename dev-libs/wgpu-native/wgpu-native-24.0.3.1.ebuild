# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android_system_properties@0.1.5
	arrayvec@0.7.6
	ash@0.38.0+1.3.281
	autocfg@1.3.0
	bindgen@0.70.1
	bit-set@0.6.0
	bit-vec@0.7.0
	bitflags@1.3.2
	bitflags@2.6.0
	block@0.1.6
	bumpalo@3.16.0
	bytemuck@1.17.0
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	clang-sys@1.8.1
	codespan-reporting@0.11.1
	com@0.6.0
	com_macros@0.6.0
	com_macros_support@0.6.0
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	document-features@0.2.10
	either@1.13.0
	equivalent@1.0.1
	fixedbitset@0.4.2
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	gl_generator@0.14.0
	glob@0.3.1
	glow@0.13.1
	glutin_wgl_sys@0.6.0
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	gpu-allocator@0.26.0
	gpu-descriptor-types@0.2.0
	gpu-descriptor@0.3.0
	hashbrown@0.14.5
	hassle-rs@0.11.0
	hexf-parse@0.2.1
	indexmap@2.4.0
	itertools@0.13.0
	jni-sys@0.3.0
	js-sys@0.3.70
	khronos-egl@6.0.0
	khronos_api@3.1.0
	libc@0.2.158
	libloading@0.8.5
	litrs@0.4.1
	lock_api@0.4.12
	log@0.4.22
	malloc_buf@0.0.6
	memchr@2.7.4
	metal@0.29.0
	minimal-lexical@0.2.1
	ndk-sys@0.5.0+25.2.9519653
	nom@7.1.3
	objc@0.2.7
	once_cell@1.19.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	petgraph@0.6.5
	pkg-config@0.3.30
	pp-rs@0.2.1
	presser@0.3.1
	prettyplease@0.2.22
	proc-macro2@1.0.86
	profiling@1.0.15
	quote@1.0.37
	range-alloc@0.1.3
	raw-window-handle@0.6.2
	redox_syscall@0.5.3
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	renderdoc-sys@1.1.0
	rustc-hash@1.1.0
	scopeguard@1.2.0
	serde@1.0.209
	serde_derive@1.0.209
	shlex@1.3.0
	slotmap@1.0.7
	smallvec@1.13.2
	spirv@0.3.0+sdk-1.3.268.0
	syn@1.0.109
	syn@2.0.76
	termcolor@1.4.1
	thiserror-impl@1.0.63
	thiserror@1.0.63
	unicode-ident@1.0.12
	unicode-width@0.1.13
	unicode-xid@0.2.5
	version_check@0.9.5
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.93
	web-sys@0.3.70
	widestring@1.1.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows@0.52.0
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	xml-rs@0.8.21
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
"

declare -A GIT_CRATES=(
	[d3d12]='https://github.com/gfx-rs/wgpu;5c5c8b1d4d2d965fbd10b290ee26f4e7eb158d7c;wgpu-%commit%/d3d12'
	[naga]='https://github.com/gfx-rs/wgpu;5c5c8b1d4d2d965fbd10b290ee26f4e7eb158d7c;wgpu-%commit%/naga'
	[wgpu-core]='https://github.com/gfx-rs/wgpu;5c5c8b1d4d2d965fbd10b290ee26f4e7eb158d7c;wgpu-%commit%/wgpu-core'
	[wgpu-hal]='https://github.com/gfx-rs/wgpu;5c5c8b1d4d2d965fbd10b290ee26f4e7eb158d7c;wgpu-%commit%/wgpu-hal'
	[wgpu-types]='https://github.com/gfx-rs/wgpu;5c5c8b1d4d2d965fbd10b290ee26f4e7eb158d7c;wgpu-%commit%/wgpu-types'
)

inherit cargo

DESCRIPTION="Native WebGPU implementation based on wgpu-core"
HOMEPAGE="https://github.com/gfx-rs/wgpu-native"
SRC_URI="
	https://github.com/gfx-rs/wgpu-native/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/webgpu-native/webgpu-headers/archive/043af6c77e566f707db36759d9c9f161ebb616fd.tar.gz -> webgpu-headers-043af6c77e566f707db36759d9c9f161ebb616fd.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
LICENSE+=" Apache-2.0 BSD CC0-1.0 ISC MIT Unicode-DFS-2016 ZLIB"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	rmdir ffi/webgpu-headers && ln -sv "${WORKDIR}"/webgpu-headers-043af6c77e566f707db36759d9c9f161ebb616fd ffi/webgpu-headers
}

src_install() {
	dolib.so target/*/release/libwgpu_native.so
	doheader ffi/wgpu.h ffi/webgpu-headers/webgpu.h
	einstalldocs
}
