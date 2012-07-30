inherit eutils

DESCRIPTION="A tool to create hard-linked incremental backups on an existing filesystem."

HOMEPAGE="http://faubackup.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86" # only tested here
IUSE=""

RDEPEND="sys-apps/findutils
	dev-lang/perl"


src_install() {
	dodir /etc /usr/bin /usr/share/man/man{5,8}
	make install \
		mandir=/usr/share/man \
		DESTDIR="${D}" \
		CONFFILE="${D}"/etc/faubackup.conf \
		|| die

	dodoc INSTALL README TODO NEWS AUTHORS
	dohtml faq.html
}

pkg_postinst() {
	einfo "Please edit your /etc/faubackup.conf file to suit your needs"
}
