# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${P/_alpha/a}"
DESCRIPTION="A set of useful shell/CGI scripting functions for the GNU Bash shell."
HOMEPAGE="http://sourceforge.net/projects/bashprogramming/"
SRC_URI="mirror://sourceforge/bashprogramming/${MY_P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/libxml2-2.6.22"
RDEPEND=">=dev-db/mysql-5.0.17
         >=dev-libs/openssl-0.9.7"

S="${WORKDIR}/${MY_P}"

src_install() {
    emake DESTDIR="${D}" install || die "install failed"
    dodoc AUTHOR TODO || die "dodoc failed"
}

pkg_postinst() {
    elog "Read 'man bpe' to get started!"
}