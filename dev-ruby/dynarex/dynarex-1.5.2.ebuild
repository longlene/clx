# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/jrobertson/dynarex"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dynarex-import-0.2"
ruby_add_rdepend ">=dev-ruby/rexle-builder-0.2"
ruby_add_rdepend ">=dev-ruby/rexslt-0.4"
ruby_add_rdepend ">=dev-ruby/dynarex-xslt-0.1"
ruby_add_rdepend ">=dev-ruby/recordx-0.1"
ruby_add_rdepend ">=dev-ruby/rxraw-lineparser-0.2"
ruby_add_rdepend ">=dev-ruby/rowx-0.4"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/table-formatter-0.1"
ruby_add_rdepend ">=dev-ruby/rxfhelper-0.2"

