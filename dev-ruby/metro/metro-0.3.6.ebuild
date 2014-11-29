# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Metro is a 2D Gaming framework built around gosu (game development library)"
HOMEPAGE="https://github.com/burtlo/metro"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gosu-0.7"
ruby_add_rdepend ">=dev-ruby/texplay-0.4"
ruby_add_rdepend ">=dev-ruby/chipmunk-6.1.3.1"
ruby_add_rdepend ">=dev-ruby/tmx-0.1.2"
ruby_add_rdepend ">=dev-ruby/thor-0.16.0"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.1"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/listen-0.6.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.11"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.0.1"

