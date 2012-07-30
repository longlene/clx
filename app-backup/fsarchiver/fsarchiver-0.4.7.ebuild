inherit autotools eutils

DESCRIPTION="flexible filesystem archiver for backup and deployment tool"
HOMEPAGE="http://www.fsarchiver.org"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="lzo lzma opensslcrypt static debug"

DEPEND="sys-libs/zlib
	app-arch/bzip2
	>=sys-fs/e2fsprogs-1.41.0
	lzma? ( app-arch/xz-utils )
	lzo? ( >=dev-libs/lzo-2.02 )
	opensslcrypt? ( dev-libs/openssl )"

#src_unpack() {
#	unpack ${A}
#	cd "${S}"
#	eautoconf
#}

src_compile() {
	local myconf="--prefix=/usr"
	use debug && myconf="${myconf} --enable-devel"
	use lzma || myconf="${myconf} --disable-lzma"
	use lzo || myconf="${myconf} --disable-lzo"
	use opensslcrypt || myconf="${myconf} --disable-crypto"
	use static && myconf="${myconf} --enable-static"
	econf ${myconf} || die "econf failed."
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
