# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="FastImage finds the size or type of an image given its uri by fetching as little as needed"
HOMEPAGE="http://github.com/sdsykes/fastimage"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2"
ruby_add_rdepend ">=dev-ruby/fakeweb-1.3"
ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"

