# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A bloomfilter implementation in both Ruby and Javascript that can be serialised to and loaded from JSON"
HOMEPAGE="http://github.com/cbetta/json-bloomfilter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/yui-compressor-0"
ruby_add_rdepend ">=dev-ruby/therubyracer-0"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/fssm-0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0"
ruby_add_rdepend ">=dev-ruby/jasmine-0"

