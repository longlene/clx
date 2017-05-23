# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The epub-reader library implements a EPUB parser conforming as much as possible to the EPUB 3 specification from IDPF"
HOMEPAGE="http://bitbucket.com/fernandoalmeida/epub-reader"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubyzip-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"

