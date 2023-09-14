# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="WP2TXT extracts plain text data from Wikipedia dump file (encoded in XML/compressed with Bzip2) stripping all the MediaWiki markups and other metadata"
HOMEPAGE="http://github.com/yohasebe/wp2txt"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/htmlentities-0"
ruby_add_rdepend ">=dev-ruby/trollop-0"

