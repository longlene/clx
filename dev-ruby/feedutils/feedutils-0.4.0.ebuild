# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="feedutils - web feed parser and normalizer (RSS 2"
HOMEPAGE="https://github.com/rubylibs/feedutils"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/logutils-0.5"
ruby_add_rdepend ">=dev-ruby/rdoc-3.10"
ruby_add_rdepend ">=dev-ruby/hoe-3.3"

