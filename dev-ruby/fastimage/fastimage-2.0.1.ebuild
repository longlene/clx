# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="FastImage finds the size or type of an image given its uri by fetching as little as needed"
HOMEPAGE="http://github.com/sdsykes/fastimage"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2"
ruby_add_rdepend ">=dev-ruby/fakeweb-1.3"
ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"

