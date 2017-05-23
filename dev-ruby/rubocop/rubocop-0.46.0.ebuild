# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Automatic Ruby code style checking tool"
HOMEPAGE="http://github.com/bbatsov/rubocop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rainbow-1.99.1"
ruby_add_rdepend ">=dev-ruby/parser-2.3.1.1"
ruby_add_rdepend ">=dev-ruby/powerpack-0.1"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-1.7"
ruby_add_rdepend ">=dev-ruby/unicode-display_width-1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"

