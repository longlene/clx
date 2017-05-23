# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fidgit is a GUI library built on Gosu/Chingu"
HOMEPAGE="http://github.com/Spooner/fidgit/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gosu-0.7.41"
ruby_add_rdepend ">=dev-ruby/chingu-0.9"
ruby_add_rdepend ">=dev-ruby/clipboard-0.9.9"
ruby_add_rdepend ">=dev-ruby/ffi-1.0.11"
ruby_add_rdepend ">=dev-ruby/rspec-2.8.0"
ruby_add_rdepend ">=dev-ruby/texplay-0.4.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/redcloth-4.2.9"

