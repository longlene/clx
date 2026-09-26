# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# libs/ and libs/iovm/ both define the rule generating IoVMInit.c, which
# ninja rejects
CMAKE_MAKEFILE_GENERATOR=emake

inherit cmake

MY_PV="${PV}-native-final"
PARSON_COMMIT="4f3eaa6849ba62404fc5756650168bb2056d0b46"

DESCRIPTION="Small, prototype-based programming language"
HOMEPAGE="https://iolanguage.org https://github.com/IoLanguage/io"
SRC_URI="
	https://github.com/IoLanguage/io/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/kgabis/parson/archive/${PARSON_COMMIT}.tar.gz -> parson-${PARSON_COMMIT}.gh.tar.gz
"
S="${WORKDIR}/io-${MY_PV}"

# MIT for bundled parson
LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="doc"

PATCHES=(
	"${FILESDIR}"/${P}-gcc14.patch
)

src_prepare() {
	rmdir deps/parson || die
	mv "${WORKDIR}"/parson-${PARSON_COMMIT} deps/parson || die

	cmake_src_prepare

	sed -i -e "s#DESTINATION lib\$#DESTINATION $(get_libdir)#" \
		libs/*/CMakeLists.txt || die
	sed -i -e "s#\${CMAKE_INSTALL_PREFIX}/lib#\${CMAKE_INSTALL_PREFIX}/$(get_libdir)#" \
		-e '/execute_process(COMMAND ldconfig)/d' \
		tools/CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	einstalldocs
	if use doc; then
		docinto html
		dodoc -r docs/*.html docs/docs.css docs/reference
	fi
}
