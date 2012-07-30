# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

DESCRIPTION="MathML DTD and entity files"
HOMEPAGE="http://www.w3.org/1998/Math/MathML"
SRC_URI="http://www.w3.org/Math/DTD/${PN/-*/}$(get_major_version).tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-libs/libxml2"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN/-*/}$(get_major_version)"

src_install() {
	install_directory="/usr/share/sgml/mathml/${P}"

	insinto ${install_directory}
	doins * || die
}

pkg_postinst() {
	[ ! -e /etc/xml ] && mkdir -p /etc/xml/

	if [[ ! -r "${ROOT}"etc/xml/catalog ]] ; then
		ebegin "Creating root XML catalog"
		xmlcatalog --noout --create "${ROOT}"etc/xml/catalog
		eend $? "Failed creating root XML catalog"
		[ $? ] && return
	fi

	if [[ ! -r "${ROOT}"etc/xml/mathml ]] ; then
		ebegin "Creating MathML catalog"
		xmlcatalog --noout --create "${ROOT}"etc/xml/mathml
		eend $? "Failed creating MathML catalog"
		[ $? ] && return
	fi

	einfo "Updating Root XML Catalog"
	xmlcatalog --noout \
		--add "delegatePublic" "-//W3C//DTD MathML" "file:///etc/xml/mathml" \
		--add "delegatePublic" "-//W3C//ENTITIES" "file:///etc/xml/mathml" \
		--add "delegateURI" "http://www.w3.org/TR/2001/REC-MathML2-20010221/dtd" "file:///etc/xml/mathml" \
		"${ROOT}"etc/xml/catalog

	einfo "Updating MathML Catalog"
	sed -n "/PUBLIC \"/ {N; s/\n/ /; s/SYSTEM//; s/\"[^\"]*$//; s/^[^\"]*\"//; s%\"[[:blank:]]\+\"%;file://${install_directory}/%; p};" ${S}/mathml2.dtd | while read entity
	do
		orig=`echo ${entity} | cut -f1 -d';'`
		replace=`echo ${entity} | cut -f2 -d';'`
		xmlcatalog --noout --add public "${orig}" "${replace}" "${ROOT}"etc/xml/mathml
	done

	xmlcatalog --noout \
		--add "rewriteURI" "http://www.w3.org/TR/2001/REC-MathML2-20010221/dtd" "file://${install_directory}" \
		"${ROOT}"etc/xml/mathml
}

pkg_postrm() {
	einfo "Cleaning Root XML Catalog"

	xmlcatalog --noout \
		--del "-//W3C//DTD MathML" \
		--del "-//W3C//ENTITIES" \
		--del "http://www.w3.org/TR/2001/REC-MathML2-20010221/dtd" \
		"${ROOT}"etc/xml/catalog

	einfo "Cleaning MathML Catalog"

	sed -i "/${P}/d" "${ROOT}"etc/xml/mathml
}
