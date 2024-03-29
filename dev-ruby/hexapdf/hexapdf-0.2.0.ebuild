# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="HexaPDF is a pure Ruby library with an accompanying application for working with PDF files"
HOMEPAGE="http://hexapdf.gettalong.org"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cmdparse-3.0"
ruby_add_rdepend ">=dev-ruby/kramdown-1.0"

