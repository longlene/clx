# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="PHP music streaming website"
HOMEPAGE="http://www.kplaylist.net"
SRC_URI="http://www.kplaylist.net/archive.php?file=${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE=""

RESTRICT="mirror"

RDEPEND="net-www/apache
	>=dev-lang/php-4.3.11-r2
	>=dev-db/mysql-3.23.49-r2"
DEPEND="${RDEPEND}"

src_install() {
	insinto /var/www/localhost/htdocs/kplaylist
	newins "${DISTDIR}"/archive.php?file=${PV} kplaylist.php
}

pkg_postinst() {
	einfo "reach kplaylist via http://127.0.0.1/kplaylist/kplaylist.php"
	einfo "default user is \"admin\" with password \"admin\" "
	einfo "do not forget to start apache and mysql..."
	einfo "have fun listen to your music via web ;-)"
}