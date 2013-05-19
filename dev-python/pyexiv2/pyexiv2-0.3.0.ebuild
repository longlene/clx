# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PYTHON_DEPEND="2:2.5"

inherit eutils python versionator

MY_PV2=$(get_version_component_range 1-2)

DESCRIPTION="A Python binding to exiv2 for manipulation of EXIF and IPTC image metadata"
HOMEPAGE="http://tilloy.net/dev/pyexiv2/"
SRC_URI="http://launchpad.net/${PN}/${MY_PV2}.x/${MY_PV2}/+download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"

IUSE="doc examples"

RDEPEND=">=dev-libs/boost-1.38
	>=media-gfx/exiv2-0.19"
DEPEND=">=dev-util/scons-0.97
	doc? ( dev-python/sphinx )
	${RDEPEND}"

src_compile() {
	scons || die
	if use doc; then
		scons doc
	fi
}

src_install() {
	scons DESTDIR="${D}" install || die
	dodoc NEWS README todo
	if use doc; then
		dohtml -r doc/_build/
	fi
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins src/*.py
	fi
}

pkg_postinst() {
	python_mod_optimize $(python_get_sitedir)/${PN}
}

pkg_postrm() {
	python_mod_cleanup $(python_get_sitedir)/${PN}
}
