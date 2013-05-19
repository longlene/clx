inherit eutils

DESCRIPTION="Oracle to PostgreSQL database schema converter"

HOMEPAGE="http://www.samse.fr/GPL/ora2pg/"

SRC_URI="http://www.samse.fr/GPL/ora2pg/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 mips ppc ppc64 sparc x86"
IUSE=""

DEPEND="dev-lang/perl
		dev-perl/DBI
		dev-perl/Compress-Zlib
		dev-perl/DBD-Pg
		perl-gcpan/String-Random
		perl-gcpan/DBD-Oracle
		"


src_install() {
        cd ${WORKDIR}/ora2pg
        perldoc -onroff -T Ora2Pg.pm > Ora2Pg.3pm
        dodoc CHANGES TODO ora2pg.conf
	dohtml ora2pg.html
        doman Ora2Pg.3pm

        dobin ora2pg.pl
	dosym ora2pg.pl /usr/bin/ora2pg

	insinto /usr/lib/perl5/site_perl
	doins Ora2Pg.pm
}