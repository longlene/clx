# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="MemFs provides a fake file system that can be used for tests"
HOMEPAGE="http://github.com/simonc/memfs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/coveralls-0.6"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/guard-2.6"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.3"
ruby_add_rdepend ">=dev-ruby/rb-inotify-0.8"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9"
ruby_add_rdepend ">=dev-ruby/rb-fchange-0.0"

