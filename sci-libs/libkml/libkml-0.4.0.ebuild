EAPI=5

inherit autotools distutils eutils perl-module toolchain-funcs

IUSE="curl java python swig"

DESCRIPTION="libkml is a KML library written in C++ with bindings to other languages"
HOMEPAGE="http://code.google.com/p/libkml/"
SRC_URI="http://libkml.googlecode.com/files/${P}.tar.gz"

SLOT="0"
LICENSE="Google"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
# need to get these arches updated on several libs first
#KEYWORDS="~alpha ~hppa"

RDEPEND="( net-misc/curl )
	python? ( virtual/python )
	java? ( virtual/jdk )
	swig? ( dev-lang/swig )"

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	eautoconf
}

src_compile() {

	distutils_python_version

	use_conf="$(use_with python) $(use_with java) $(use_with swig)"

	econf ${pkg_conf} ${use_conf} || die "econf failed"

	emake || die "emake failed"

}

src_install() {

	einstall || die "make install failed"

}

pkg_postinst() {
	elog
	elog "Be careful....libkml is alpha"
	elog
}
