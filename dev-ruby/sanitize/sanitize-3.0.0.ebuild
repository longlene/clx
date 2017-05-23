# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Sanitize is a whitelist-based HTML and CSS sanitizer"
HOMEPAGE="https://github.com/rgrove/sanitize/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/crass-0.2.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4.4"
ruby_add_rdepend ">=dev-ruby/nokogumbo-1.1.9"
ruby_add_rdepend ">=dev-ruby/minitest-5.3.4"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.0.0"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7"

