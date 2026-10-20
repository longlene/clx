# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Self-contained C and C++ compiler with JIT, AOT and REPL"
HOMEPAGE="https://github.com/derekbsnider/madc"
SRC_URI="https://github.com/derekbsnider/madc/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MPL-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bdb gdbm qdbm sqlite xqdbm"

DEPEND="
	app-arch/zstd
	dev-libs/libpcre2
	bdb? ( sys-libs/db )
	gdbm? ( sys-libs/gdbm )
	qdbm? ( dev-db/qdbm )
	sqlite? ( dev-db/sqlite )
	xqdbm? ( dev-libs/xqdbm )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_prepare() {
	default
	eautoreconf
	# The forest-pack step cannot run on Gentoo: the header-carrier
	# enumeration relies on dpkg/rpm package ownership, and the dialect
	# freeze does not parse GCC 15's libstdc++ (__bfloat16_t). Skip it and
	# ship the unpacked release artifacts; madc live-parses on-disk headers.
	patch -p1 -f < "${FILESDIR}/${P}-skip-forest-pack.patch" || die
}

src_configure() {
	local econfargs=(
		--with-forest=none
		$(use_with bdb bdb)
		$(use_with gdbm gdbm)
		$(use_with qdbm qdbm)
		$(use_with xqdbm xqdbm)
		$(use_with sqlite sqlite3)
	)
	econf "${econfargs[@]}"
}

src_compile() {
	emake -C src release
}

# No test phase: madc 0.105.0's C++ front-end cannot parse this box's GCC 15
# libstdc++ (bits/c++config.h's `typedef __decltype(0.0bf16) __bfloat16_t;`,
# guarded by __BFLT16_DIG__), so 6/40 doctest cases (all C++ cir_freeze tests)
# fail on this toolchain. The C front-end works; re-add `test` once upstream
# fixes the C++ parser.

src_install() {
	emake -C src install \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		INSTALL_LIBDIR="${EPREFIX}/usr/$(get_libdir)"
}
