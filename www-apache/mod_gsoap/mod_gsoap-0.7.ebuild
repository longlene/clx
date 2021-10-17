# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit apache-module

DESCRIPTION="mod_gsoap is an Apache module that allows Apache to serve SOAP requests via the Gsoap library"
HOMEPAGE="https://sourceforge.net/projects/mod-gsoap/"
SRC_URI="mirror://sourceforge/mod-gsoap/${P}.tar.gz"

LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="0"

DEPEND="net-libs/gsoap"

# See apache-module.eclass for more information.
APACHE2_MOD_CONF="99_${PN}"
APACHE2_MOD_DEFINE="GSOAP"

need_apache2

APXS2_S="${S}"/apache_20

