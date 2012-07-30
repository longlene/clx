DESCRIPTION="Perl program that converts HTML documents to WML decks"
HOMEPAGE="http://www.sourceforge.net/projects/html2wml"
SRC_URI="mirror://sourceforge/html2wml/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc ~sparc-fbsd x86 ~x86-fbsd"

DEPEND="dev-lang/perl
        dev-perl/HTML-Parser
		dev-perl/libwww-perl
		dev-perl/URI
		dev-perl/text-template
		dev-perl/XML-Parser
		"

RDEPEND="${DEPEND}"

src_install() {
	mv html2wml.cgi html2wml
	mv doc/html2wml.man doc/html2wml.1
	dobin html2wml
	doman doc/html2wml.1
	dodoc ChangeLog COPYING README NEWS NOTES TODO doc/readme.pdf
}
