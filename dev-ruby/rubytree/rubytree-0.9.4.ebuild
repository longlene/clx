# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    RubyTree is a pure Ruby implementation of the generic tree data structure"
HOMEPAGE="http://rubytree.anupamsg.me"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/structured_warnings-0.1"
ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rdoc-4.1"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/rtagstask-0.0"

