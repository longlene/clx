# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A free source code editing component"
HOMEPAGE="https://www.scintilla.org"
SRC_URI="https://www.scintilla.org/${PN}${PV//./}.tgz -> ${P}.tgz"

LICENSE="HPND lua? ( MIT )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~arm-linux ~x86-linux"
IUSE="lua"

RDEPEND="
	dev-libs/glib:2
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/pango
	lua? ( >=dev-lang/lua-5:= )"

DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig"

DOCS=( README )

S="${WORKDIR}/${PN}"

pkg_pretend() {
	if tc-is-clang ; then
		# need c++17 features
		[[ "${MERGE_TYPE}" != "binary" &&
		$(clang-major-version) -lt 5 ]] &&
		die "Sorry, SCiTE uses C++17 Features and needs >sys-devel/clang-5
		($(clang-major-version))."

	elif tc-is-gcc; then
		# older gcc is not supported
		[[ "${MERGE_TYPE}" != "binary" &&
		$(gcc-major-version) -lt 7 ]] &&
		die "Sorry, Scite uses C++17 Features, need >sys-devel/gcc-7."
	else
		die "Either gcc or clang should be configured for building scite"
	fi
}

src_prepare() {
	default
	sed -i "gtk/makefile" \
	-e "s#^CC = clang#CC = ${CC}#" \
	-e "s#^CXX = clang++#CC = ${CXX}#" \
	-e "s#-rdynamic#-rdynamic ${LDFLAGS}#" \
	-e "s#-Os##" \
	|| die "error patching gtk/makefile"
}

src_compile() {
	# prepare make options
	local emake_pars=("GTK3=1")

	tc-is-clang && emake_pars+=("CLANG=1")
	use !lua    && emake_pars+=("NO_LUA=1")

	emake -C gtk "${emake_pars[@]}"
}

src_install() {
	dolib.a bin/scintilla.a
	insinto /usr
	doins -r include
	einstalldocs
}

