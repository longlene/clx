# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Tioga is a blend of PDF, pdfTex and ruby into a library to make
scientific graphs of high quality"
HOMEPAGE="http://tioga.sf.net"

LICENSE="LGPL 2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""


