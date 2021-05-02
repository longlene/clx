# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pismo extracts and retrieves content-related metadata from HTML pages - you can use the resulting data in an organized way, such as a summary/first paragraph, body text, keywords, RSS feed URL, favicon, etc"
HOMEPAGE="http://github.com/peterc/pismo"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/shoulda-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/sanitize-0"
ruby_add_rdepend ">=dev-ruby/fast-stemmer-0"
ruby_add_rdepend ">=dev-ruby/chronic-0"

