MY_PN="air-sdk" 
MY_PV=1.5
MY_P=${MY_PN}-${PV}
DESCRIPTION="Adobe AIR runtime and development kit for Linux" 
HOMEPAGE="http://labs.adobe.com/technologies/air/" 
SRC_URI="http://airdownload.adobe.com/air/lin/download/latest/air_1.5_sdk.tbz2" 

LICENSE="AdobeAIR" 
SLOT="0" 
KEYWORDS="~x86" 
IUSE="" 

RESTRICT="strip" 

DEPEND="dev-libs/nspr
		dev-libs/nss"
RDEPEND="${DEPEND}
		 virtual/jre"

src_unpack() {
	unpack ${A}
	rm runtimes/air/linux/Adobe\ AIR/Versions/1.0/Resources/nss3/0d/*.so
	rm runtimes/air/linux/Adobe\ AIR/Versions/1.0/Resources/nss3/1d/*.so
	rm runtimes/air/linux/Adobe\ AIR/Versions/1.0/Resources/nss3/None/*.so
	sed -i -e "s|^here=.*|here=/opt/${P}/bin|" bin/adt
}

src_install() { 
	insinto /opt/${P}    insinto /opt/${P} 
	doins -r frameworks lib runtimes AIR\ SDK\ Readme.txt samples SDK\ license.pdf templates || die "doins failed." 
	dodir /opt/${P}/bin || die "dodir bin failed." 
	exeinto /opt/${P}/bin 
	doexe bin/adl || die "doexe failed." 
	doexe bin/adt || die "doexe failed." 
	dosym /opt/${P}/bin/adl /usr/bin/ || die "dosym failed." 
	dosym /opt/${P}/bin/adt /usr/bin/ || die "dosym failed." 
	dobin ${FILESDIR}/air-run
}
