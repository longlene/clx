# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.5"

inherit eutils versionator scons-utils python

MY_PV=$(get_version_component_range 1-2)
DESCRIPTION="Python binding to exiv2"
HOMEPAGE="http://tilloy.net/dev/pyexiv2/"
SRC_URI="http://launchpad.net/${PN}/${MY_PV}.x/${PV}/+download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

DEPEND=">=media-gfx/exiv2-0.20
	doc? ( >=dev-python/sphinx-1.1.3-r2 )
	>=dev-libs/boost-1.48[python]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/scons_python_abi.patch
}

src_compile() {
	python_copy_sources

	build() {
		if [ "$(python_get_version --major)" -ge 3 ]; then
			"2to3-${PYTHON_ABI}" --no-diffs --write --nobackups .
		fi
		escons lib PYTHONINC="$(python_get_includedir)" PYTHONLIB="$(python_get_sitedir)" BOOSTLIB="boost_python-${PYTHON_ABI}" || die
	}
	python_execute_function -s build

	build_doc() {
		if use doc; then
			escons doc || die

			# To enable doins -r in src_install
			rm -R doc/_build/.doctrees || die
		fi
	}
	python_execute_function -s -f build_doc
}

src_install() {
	store() {
		escons DESTDIR="${D}"  PYTHONINC="$(python_get_includedir)" PYTHONLIB="$(python_get_sitedir)" BOOSTLIB="boost_python-${PYTHON_ABI}" install || die
		dodoc NEWS README todo || die
	}
	python_execute_function -s store

	store_doc() {
		if use examples; then
			insinto /usr/share/doc/${PF}/examples
			doins src/*example*.py
		fi

		if use doc; then
			insinto /usr/share/doc/${PF}/
			doins -r doc/html || die  # no dohtml due to mixed content
		fi
	}
	python_execute_function -s -f store_doc
}

pkg_postinst() {
	python_mod_optimize ${PN}
}

pkg_postrm() {
	python_mod_cleanup ${PN}
}
