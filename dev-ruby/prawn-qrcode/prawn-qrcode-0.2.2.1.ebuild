# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Prawn/QRCode simplifies the generation and rendering of QRCodes in Prawn PDF documents"
HOMEPAGE="http://github.com/jabbrwcky/prawn-qrcode"

LICENSE="Apache License 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/prawn-0.11.1"
ruby_add_rdepend ">=dev-ruby/rqrcode-0.4.1"

