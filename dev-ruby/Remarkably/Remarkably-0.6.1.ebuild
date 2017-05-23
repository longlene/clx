# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"
RUBY_FAKEGEM_GEMSPEC=remarkably.gemspec

inherit ruby-fakegem

DESCRIPTION="Remarkably is a very tiny Markaby-like XML,HTML and CSS builder"
HOMEPAGE="http://www.darkarts.co.za/remarkably"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">=dev-ruby/rspec-1.3.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' remarkably.gemspec || die "sed failed"
}
