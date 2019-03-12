# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

MY_PV=${PV//./}

DESCRIPTION="Oracle Tuxedo is #1 application server"
HOMEPAGE="http://www.oracle.com/technetwork/middleware/tuxedo/index.html"
SRC_URI="
	x86? ( tuxedo${MY_PV}_32_Linux_01_x86.zip )
	amd64? ( tuxedo${MY_PV}_64_Linux_01_x86.zip )
"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE="apache server"

DEPEND="
	apache? ( www-servers/apache )
"
RDEPEND="${DEPEND}"

QA_PREBUILT="usr/lib*/tuxedo/lib*/lib*"

pkg_nofetch() {
	eerror "Please go to"
	eerror "${HOMEPAGE}"
	eerror "download the ${SRC_URI}."
}

S="${WORKDIR}"
SERVER_DATA_DIR=Disk1/stage/Components/tuxedoServer/${PV}/1/DataFiles
CLIENT_DATA_DIR=Disk1/stage/Components/tuxedoClientCore/${PV}/1/DataFiles

src_unpack() {
	unpack "${A}"
	unzip -q "${WORKDIR}"/${CLIENT_DATA_DIR}/filegroup1.1.1.jar -d "${WORKDIR}"/${CLIENT_DATA_DIR}
	use server && unzip -q "${WORKDIR}"/${SERVER_DATA_DIR}/filegroup1.1.1.jar -d "${WORKDIR}"/${SERVER_DATA_DIR}
}

src_configure() { :; }
src_compile() { :; }


src_install() {
	local tuxdir=usr/$(get_libdir)/${PN}
	local ldpath=/${tuxdir}/$(get_libdir)

	into "/${tuxdir}"
	dolib.so ${CLIENT_DATA_DIR}/lib{buft,engine,fml,fml32,giconv,gpnet,jms,msgq1,omg,orbutl,plugin,qm,qs,sec,secssl,trpc,ticuuc,ticudata,tux,txml,usort,utrace,wsc}$(get_libname)* ${CLIENT_DATA_DIR}/registry$(get_libname)
	dosym libtxml$(get_libname 25.0) "/${tuxdir}"/$(get_libdir)/libtxml$(get_libname 25) 
	dosym libtxml$(get_libname 25.0) "/${tuxdir}"/$(get_libdir)/libtxml$(get_libname) 
	dosym libticuuc$(get_libname 36.0) "/${tuxdir}"/$(get_libdir)/libticuuc$(get_libname 36) 
	dosym libticudata$(get_libname 36.0) "/${tuxdir}"/$(get_libdir)/libticudata$(get_libname 36) 
	dosym "/${tuxdir}"/$(get_libdir)/registry$(get_libname) /usr/$(get_libdir)/registry.so
	
	local f
	for f in buildclient mkfldhdr32 ; do
		dobin ${CLIENT_DATA_DIR}/${f}
		#dosym "/${tuxdir}"/bin/${f} /usr/bin/${f}
	done

	insinto "/${tuxdir}"/include
	doins ${CLIENT_DATA_DIR}/{atmi.h,fml.h,fml1632.h,fml32.h,tmenv.h,tpadm.h,tx.h,Uunix.h,userlog.h,xa.h}

	insinto "/${tuxdir}"/include/xercesc/sax
	doins ${CLIENT_DATA_DIR}/{ErrorHandler.hpp,InputSource.hpp,SAXException.hpp,SAXParseException.hpp}

	insinto "/${tuxdir}"/include/xercesc/util
	doins ${CLIENT_DATA_DIR}/{ArrayIndexOutOfBoundsException.hpp,AutoSense.hpp,BaseRefVectorOf.c,BaseRefVectorOf.hpp,BinInputStream.hpp,EmptyStackException.hpp,HashBase.hpp,HashXMLCh.hpp,IllegalArgumentException.hpp,Janitor.c,Janitor.hpp,KVStringPair.hpp,Mutexes.hpp,NameIdPool.c,NameIdPool.hpp,NoSuchElementException.hpp,NullPointerException.hpp,PanicHandler.hpp,PlatformUtils.hpp,QName.hpp,RefArrayVectorOf.c,RefArrayVectorOf.hpp,RefHashTableOf.c,RefHashTableOf.hpp,RefVectorOf.c,RefVectorOf.hpp,RuntimeException.hpp,TranscodingException.hpp,ValueStackOf.c,ValueStackOf.hpp,ValueVectorOf.c,ValueVectorOf.hpp,XercesDefs.hpp,XercesVersion.hpp,XMemory.hpp,XMLEnumerator.hpp,XMLException.hpp,XMLExceptMsgs.hpp,XMLString.hpp,XMLUni.hpp,XMLUniDefs.hpp}

	insinto "/${tuxdir}"/include/xercesc/util/Platforms/Linux
	doins ${CLIENT_DATA_DIR}/LinuxDefs.hpp

	insinto "/${tuxdir}"/include/xercesc/util/Compilers
	doins ${CLIENT_DATA_DIR}/GCCDefs.hpp

	insinto "/${tuxdir}"/include/xercesc/util/regx
	doins ${CLIENT_DATA_DIR}/{BMPattern.hpp,ConditionToken.hpp,ModifierToken.hpp,Op.hpp,OpFactory.hpp,RegularExpression.hpp,Token.hpp,TokenFactory.hpp}

	insinto "/${tuxdir}"/include/xercesc/dom
	doins ${CLIENT_DATA_DIR}/{DOMAttr.hpp,DOMBuilder.hpp,DOMCDATASection.hpp,DOMCharacterData.hpp,DOMComment.hpp,DOMConfiguration.hpp,DOMDocument.hpp,DOMDocumentFragment.hpp,DOMDocumentRange.hpp,DOMDocumentTraversal.hpp,DOMDocumentType.hpp,DOMElement.hpp,DOMEntity.hpp,DOMEntityResolver.hpp,DOMEntityReference.hpp,DOMError.hpp,DOMErrorHandler.hpp,DOMException.hpp,DOMImplementation.hpp,DOMImplementationLS.hpp,DOMImplementationRegistry.hpp,DOMImplementationSource.hpp,DOMInputSource.hpp,DOMLocator.hpp,DOMNamedNodeMap.hpp,DOMNode.hpp,DOMNodeFilter.hpp,DOMNodeIterator.hpp,DOMNodeList.hpp,DOMNotation.hpp,DOMProcessingInstruction.hpp,DOMRange.hpp,DOMRangeException.hpp,DOMText.hpp,DOMTreeWalker.hpp,DOMTypeInfo.hpp,DOMUserDataHandler.hpp,DOMWriter.hpp,DOMWriterFilter.hpp,DOMXPathEvaluator.hpp,DOMXPathException.hpp,DOMXPathExpression.hpp,DOMXPathNamespace.hpp,DOMXPathNSResolver.hpp,DOMXPathResult.hpp}

	insinto "/${tuxdir}"/include/xercesc/dom/deprecated
	doins ${CLIENT_DATA_DIR}/{DOM.hpp,DOM_Attr.hpp,DOM_CDATASection.hpp,DOM_CharacterData.hpp,DOM_Comment.hpp,DOM_Document.hpp,DOM_DocumentFragment.hpp,DOM_DocumentType.hpp,DOM_DOMException.hpp,DOM_DOMImplementation.hpp,DOM_Element.hpp,DOM_Entity.hpp,DOM_EntityReference.hpp,DOM_NamedNodeMap.hpp,DOM_Node.hpp,DOM_NodeFilter.hpp,DOM_NodeIterator.hpp,DOM_NodeList.hpp,DOM_Notation.hpp,DOM_ProcessingInstruction.hpp,DOM_Range.hpp,DOM_Text.hpp,DOMParser.hpp,DOMString.hpp,DOM_TreeWalker.hpp,DOM_XMLDecl.hpp}

	insinto "/${tuxdir}"/include/xercesc/framework
	doins ${CLIENT_DATA_DIR}/{BinOutputStream.hpp,MemBufInputSource.hpp,MemoryManager.hpp,ValidationContext.hpp,XMLAttr.hpp,XMLAttDef.hpp,XMLAttDefList.hpp,XMLDocumentHandler.hpp,XMLContentModel.hpp,XMLEntityDecl.hpp,XMLErrorReporter.hpp,XMLFormatter.hpp,XMLElementDecl.hpp,XMLEntityHandler.hpp,XMLNotationDecl.hpp}

	insinto "/${tuxdir}"/include/xercesc/framework/psvi
	doins ${CLIENT_DATA_DIR}/{XSConstants.hpp,XSObject.hpp,XSSimpleTypeDefinition.hpp,XSTypeDefinition.hpp}

	insinto "/${tuxdir}"/include/xercesc/internal
	doins ${CLIENT_DATA_DIR}/{XProtoType.hpp,XSerializable.hpp,XSerializationException.hpp,XSerializeEngine.hpp}

	insinto "/${tuxdir}"/include/xercesc/validators/datatype
	doins ${CLIENT_DATA_DIR}/DatatypeValidator.hpp

	insinto "/${tuxdir}"/include/xercesc/validators/schema
	doins ${CLIENT_DATA_DIR}/SchemaSymbols.hpp
	
	insinto "/${tuxdir}"/include/xercesc/validators/DTD
	doins ${CLIENT_DATA_DIR}/{DocTypeHandler.hpp,DTDAttDef.hpp,DTDElementDecl.hpp,DTDEntityDecl.hpp}
	
	insinto "/${tuxdir}"/locale/C
	for f in CMDFML CMDGW CMDTUX GP LIBFML LIBGWT LIBGW LIBPLUGIN LIBSEC LIBTUX LIBWSC ORACLE ; do
		newins ${CLIENT_DATA_DIR}/${f}_CAT0 ${f}_CAT
		newins ${CLIENT_DATA_DIR}/${f}.text0 ${f}.text
	done


	if use server ; then
		for f in tmadmin  tmboot  tmconfig  tmipcrm tmloadcf tmshutdown tmunloadcf buildserver dmadmin dmloadcf dmunloadcf qmadmin BBL DBBL DMADM GWADM GWTDOMAIN TMQUEUE WSH WSL  ; do
			dobin ${SERVER_DATA_DIR}/${f}
			dosym "/${tuxdir}"/bin/${f} /usr/bin/${f}
		done
			dolib.so ${SERVER_DATA_DIR}/lib{tmib,gw,gwt,tuxj,tuxjni}$(get_libname)*
		insinto "/${tuxdir}"/include
		doins ${SERVER_DATA_DIR}/sqlca.h

		insinto "/${tuxdir}"/udataobj
		doins ${SERVER_DATA_DIR}/dependency.ini ${CLIENT_DATA_DIR}/SysRegiiop.rdp ${SERVER_DATA_DIR}/SysRegtgiop.rdp

		insinto "/${tuxdir}"/locale/C
		for f in TMADMIN TPFW TUXMQ WSNAT  ; do
			newins ${SERVER_DATA_DIR}/${f}_CAT2 ${f}_CAT
			newins ${SERVER_DATA_DIR}/${f}.text2 ${f}.text
		done
		if use apache ; then
			exeinto /usr/$(get_libdir)/apache2/modules
			doexe ${SERVER_DATA_DIR}/mod_tuxedo.so
		fi
	fi

	dosym $(get_libdir) "/${tuxdir}"/lib

	{
		echo "# ${EPREFIX}/etc/env.d/50${PN}"
		echo "# Do not edit this file, but 99${PN} instead"
		echo
		echo "TUXDIR=${EPREFIX}/${tuxdir}"
		echo "LDPATH=${ldpath}"
	} > "${T}"/50${PN}

	doenvd "${T}"/50${PN}
}

pkg_preinst() {
	if [[ -r ${EROOT}/etc/env.d/99${PN} ]]; then
		cp "${EROOT}/etc/env.d/99${PN}" "${ED}/etc/env.d/" || die
	else
	{
		echo "# ${EPREFIX}/etc/env.d/99${PN}"
			echo "# Configure system-wide defaults for your Tuxedo here"
			echo
			echo "#$(grep '^TUXDIR=' "${ED}/etc/env.d/50${PN}")"
	} > "${ED}/etc/env.d/99${PN}"
	fi
}

