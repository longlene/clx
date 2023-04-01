# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A static site generator"
HOMEPAGE="http://middlemanapp.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.1"
ruby_add_rdepend ">=dev-ruby/rack-1.4.5"
ruby_add_rdepend ">=dev-ruby/tilt-2.0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/fast_blank-0"
ruby_add_rdepend ">=dev-ruby/parallel-0"
ruby_add_rdepend ">=dev-ruby/servolux-0"
ruby_add_rdepend ">=dev-ruby/dotenv-0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2"
ruby_add_rdepend ">=dev-ruby/padrino-helpers-0.13.0"
ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend ">=dev-ruby/memoist-0.14"
ruby_add_rdepend ">=dev-ruby/listen-3.0.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.5.0"
ruby_add_rdepend ">=dev-ruby/i18n-0.7.0"
ruby_add_rdepend ">=dev-ruby/fastimage-2.0"
ruby_add_rdepend ">=dev-ruby/sass-3.4"
ruby_add_rdepend ">=dev-ruby/uglifier-3.0"
ruby_add_rdepend ">=dev-ruby/execjs-2.0"
ruby_add_rdepend ">=dev-ruby/contracts-0.13.0"
ruby_add_rdepend ">=dev-ruby/hashie-3.4"
ruby_add_rdepend ">=dev-ruby/hamster-3.0"
ruby_add_rdepend ">=dev-ruby/backports-3.6"

