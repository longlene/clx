# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Lime Parser Generator"
HOMEPAGE="
	https://codeberg.org/gregburd/lime/
"
SRC_URI="https://codeberg.org/gregburd/lime/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
S="${WORKDIR}"/${PN}
KEYWORDS="~amd64"
IUSE="llvm test"
RESTRICT="!test? ( test )"

DEPEND="llvm? ( llvm-core/llvm:= )"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/0001-add-tests-meson-option.patch"
	"${FILESDIR}/0002-fix-test-diagnostics-include-path.patch"
)

src_configure() {
	local emesonargs=(
		$(meson_feature llvm)
		$(meson_use test tests)
	)
	meson_src_configure
}

src_install() {
	meson_src_install

	# meson embeds raw llvm-config output (absolute paths) into the
	# pkg-config file. Strip them: downstream packages that need LLVM
	# should declare it themselves via llvm-core/llvm.
	if use llvm; then
		sed -i \
			-e 's| -L/usr/lib/llvm/[^/]*/lib[^ ]*||g' \
			-e 's| -lLLVM-[0-9][^ ]*||g' \
			-e 's| -I/usr/lib/llvm/[^/]*/include||g' \
			"${ED}/usr/$(get_libdir)/pkgconfig/lime.pc" || die
	fi
}
