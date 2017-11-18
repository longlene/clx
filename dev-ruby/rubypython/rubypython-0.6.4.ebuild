# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RubyPython is a bridge between the Ruby and Python interpreters"
HOMEPAGE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0.7"
ruby_add_rdepend ">=dev-ruby/blankslate-2.1.2.3"
ruby_add_rdepend ">=dev-ruby/rubyforge-2.0.4"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-doofus-1.0"
ruby_add_rdepend ">=dev-ruby/hoe-gemspec2-1.1"
ruby_add_rdepend ">=dev-ruby/hoe-git-1.5"
ruby_add_rdepend ">=dev-ruby/hoe-hg-1.0"
ruby_add_rdepend ">=dev-ruby/hoe-rubygems-1.0"
ruby_add_rdepend ">=dev-ruby/hoe-travis-1.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"
ruby_add_rdepend ">=dev-ruby/tilt-1.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.8"

